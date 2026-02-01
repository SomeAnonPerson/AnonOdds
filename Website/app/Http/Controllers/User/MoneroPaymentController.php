<?php

/*
 * AnonOdds - The First Anonymous SportsBook
 * Copyright (c) 2026 Skotos
 * All rights reserved.
 */

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Deposit;
use App\Models\DepositRequest;
use App\Models\User;
use App\Models\General;
use App\Models\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class MoneroPaymentController extends Controller
{
    private $walletRPC;
    
    public function __construct()
    {
        try {
            $this->walletRPC = new \MoneroIntegrations\MoneroPhp\walletRPC(
                config('crypto.monero.rpc_host'),
                config('crypto.monero.rpc_port')
            );
        } catch (\Exception $e) {
            Log::error('Monero Wallet RPC connection failed: ' . $e->getMessage());
        }
    }

    /**
     * Generate Monero subaddress for deposit
     */
    public function generateAddress(Request $request)
    {
        try {
            $userId = Auth::id();
            $trx = $request->trx ?? getTrx();
            
            // Create unique subaddress for this deposit
            $label = "AnonOdds_User_{$userId}_TRX_{$trx}";
            $subaddress = $this->walletRPC->create_address(0, $label);

            Log::info('Monero subaddress created', [
                'user_id' => $userId,
                'trx' => $trx,
                'address' => $subaddress['address'],
                'index' => $subaddress['address_index']
            ]);

            return response()->json([
                'success' => true,
                'address' => $subaddress['address'],
                'address_index' => $subaddress['address_index'],
                'qr_code' => $this->generateQRCode($subaddress['address'], $request->amount)
            ]);

        } catch (\Exception $e) {
            Log::error('Monero address generation failed: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Failed to generate Monero address. Please try again.'
            ], 500);
        }
    }

    /**
     * Check for incoming Monero payments (webhook/IPN alternative)
     */
    public function checkPayment(Request $request)
    {
        try {
            $trx = $request->trx;
            $deposit = Deposit::where('trx', $trx)
                ->where('crypto_type', 'XMR')
                ->where('status', 0)
                ->first();

            if (!$deposit) {
                return response()->json([
                    'success' => false,
                    'message' => 'Deposit not found'
                ], 404);
            }

            // Get incoming transfers for this subaddress
            $transfers = $this->walletRPC->get_transfers([
                'in' => true,
                'pending' => true,
                'pool' => true,
                'subaddr_indices' => [$deposit->subaddress_index]
            ]);

            $found = false;
            $confirmations = 0;
            $txid = null;
            $receivedAmount = 0;

            // Check all incoming transfers
            if (!empty($transfers['in'])) {
                foreach ($transfers['in'] as $transfer) {
                    $xmrAmount = $transfer['amount'] / 1e12; // Convert from atomic units
                    
                    // Match if amount is equal or greater (accounting for small variations)
                    if ($xmrAmount >= ($deposit->crypto_amount * 0.99)) {
                        $found = true;
                        $confirmations = $transfer['confirmations'];
                        $txid = $transfer['txid'];
                        $receivedAmount = $xmrAmount;
                        break;
                    }
                }
            }

            // Also check pending/pool
            if (!$found && !empty($transfers['pool'])) {
                foreach ($transfers['pool'] as $transfer) {
                    $xmrAmount = $transfer['amount'] / 1e12;
                    
                    if ($xmrAmount >= ($deposit->crypto_amount * 0.99)) {
                        $found = true;
                        $confirmations = 0;
                        $txid = $transfer['txid'];
                        $receivedAmount = $xmrAmount;
                        break;
                    }
                }
            }

            if ($found) {
                // Update deposit with transaction details
                $deposit->txid = $txid;
                $deposit->confirmations = $confirmations;
                $deposit->crypto_amount_received = $receivedAmount;
                $deposit->save();

                // Update deposit request
                $depositRequest = DepositRequest::where('deposit_id', $deposit->id)->first();
                if ($depositRequest) {
                    $depositRequest->txid = $txid;
                    $depositRequest->confirmations = $confirmations;
                    $depositRequest->save();
                }

                $requiredConfirmations = config('crypto.monero.required_confirmations', 10);

                // Auto-approve if configured and confirmations met
                if (config('crypto.auto_approve_deposits', true) && $confirmations >= $requiredConfirmations) {
                    $this->approveDeposit($deposit);
                    
                    return response()->json([
                        'success' => true,
                        'status' => 'completed',
                        'confirmations' => $confirmations,
                        'required_confirmations' => $requiredConfirmations,
                        'message' => 'Payment received and approved!'
                    ]);
                }

                return response()->json([
                    'success' => true,
                    'status' => 'pending',
                    'confirmations' => $confirmations,
                    'required_confirmations' => $requiredConfirmations,
                    'message' => "Payment detected! Waiting for {$requiredConfirmations} confirmations."
                ]);
            }

            return response()->json([
                'success' => true,
                'status' => 'waiting',
                'message' => 'Waiting for payment...'
            ]);

        } catch (\Exception $e) {
            Log::error('Monero payment check failed: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Payment verification failed'
            ], 500);
        }
    }

    /**
     * Verify specific transaction by TXID
     */
    public function verifyTransaction(Request $request)
    {
        $this->validate($request, [
            'txid' => 'required|string',
            'trx' => 'required|string'
        ]);

        try {
            $deposit = Deposit::where('trx', $request->trx)
                ->where('crypto_type', 'XMR')
                ->first();

            if (!$deposit) {
                return response()->json([
                    'success' => false,
                    'message' => 'Deposit not found'
                ], 404);
            }

            // Get transfer by TXID
            $transfer = $this->walletRPC->get_transfer_by_txid($request->txid);

            if ($transfer && isset($transfer['transfer'])) {
                $tx = $transfer['transfer'];
                $xmrAmount = $tx['amount'] / 1e12;

                // Verify amount matches
                if ($xmrAmount >= ($deposit->crypto_amount * 0.99)) {
                    $deposit->txid = $request->txid;
                    $deposit->confirmations = $tx['confirmations'] ?? 0;
                    $deposit->crypto_amount_received = $xmrAmount;
                    $deposit->save();

                    // Update deposit request
                    $depositRequest = DepositRequest::where('deposit_id', $deposit->id)->first();
                    if ($depositRequest) {
                        $depositRequest->txid = $request->txid;
                        $depositRequest->confirmations = $tx['confirmations'] ?? 0;
                        $depositRequest->save();
                    }

                    $requiredConfirmations = config('crypto.monero.required_confirmations', 10);

                    if ($tx['confirmations'] >= $requiredConfirmations) {
                        $this->approveDeposit($deposit);
                    }

                    return response()->json([
                        'success' => true,
                        'verified' => true,
                        'confirmations' => $tx['confirmations'] ?? 0,
                        'required_confirmations' => $requiredConfirmations
                    ]);
                }
            }

            return response()->json([
                'success' => false,
                'message' => 'Transaction not found or amount mismatch'
            ], 404);

        } catch (\Exception $e) {
            Log::error('Monero transaction verification failed: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Verification failed'
            ], 500);
        }
    }

    /**
     * Get wallet balance and sync status
     */
    public function getWalletStatus()
    {
        try {
            $balance = $this->walletRPC->get_balance();
            $height = $this->walletRPC->get_height();

            return response()->json([
                'success' => true,
                'balance' => $balance['balance'] / 1e12,
                'unlocked_balance' => $balance['unlocked_balance'] / 1e12,
                'height' => $height
            ]);

        } catch (\Exception $e) {
            Log::error('Wallet status check failed: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Wallet status unavailable'
            ], 500);
        }
    }

    /**
     * Approve deposit and credit user account
     */
    private function approveDeposit(Deposit $deposit)
    {
        if ($deposit->status != 0) {
            return; // Already processed
        }

        try {
            $deposit->status = 1;
            $deposit->verified_at = now();
            $deposit->save();

            $user = User::find($deposit->user_id);
            $newBalance = $user->balance + $deposit->amount;

            createTransaction(
                'Deposit via Monero (XMR)',
                $deposit->amount,
                $user->balance,
                $newBalance,
                1,
                $user->id
            );

            $user->balance = $newBalance;
            $user->save();

            // Update deposit request
            $depositRequest = DepositRequest::where('deposit_id', $deposit->id)->first();
            if ($depositRequest) {
                $depositRequest->status = 1;
                $depositRequest->verified_at = now();
                $depositRequest->save();
            }

            // Award referral commission
            levelCommision($deposit->user_id, $deposit->amount);

            // Send email notification
            $gnl = General::first();
            $shortCodes = [
                'trx' => $deposit->trx,
                'amount' => $deposit->amount,
                'currency' => $gnl->currency,
                'crypto_type' => 'XMR',
                'crypto_amount' => $deposit->crypto_amount,
                'txid' => $deposit->txid,
            ];

            @send_email($user, 'DEPOSIT_COMPLETE', $shortCodes);

            // Create admin notification
            $adminNotification = new Notification();
            $adminNotification->user_id = $user->id;
            $adminNotification->title = 'Monero deposit completed for ' . $user->username;
            $adminNotification->click_url = urlPath('admin.deposit.depositLog');
            $adminNotification->save();

            Log::info('Monero deposit approved', [
                'deposit_id' => $deposit->id,
                'user_id' => $user->id,
                'amount' => $deposit->amount,
                'txid' => $deposit->txid
            ]);

        } catch (\Exception $e) {
            Log::error('Monero deposit approval failed: ' . $e->getMessage());
        }
    }

    /**
     * Generate QR code for Monero payment
     */
    private function generateQRCode(string $address, float $amount = null): string
    {
        $uri = "monero:{$address}";
        
        if ($amount) {
            $uri .= "?tx_amount={$amount}";
        }

        return "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=" . urlencode($uri);
    }

    /**
     * Get current Monero to USD exchange rate
     */
    public function getExchangeRate()
    {
        try {
            $response = file_get_contents("https://api.coingecko.com/api/v3/simple/price?ids=monero&vs_currencies=usd");
            $data = json_decode($response, true);
            
            $rate = $data['monero']['usd'] ?? 150;

            return response()->json([
                'success' => true,
                'rate' => $rate,
                'currency' => 'USD'
            ]);

        } catch (\Exception $e) {
            Log::error('Failed to fetch Monero rate: ' . $e->getMessage());
            
            return response()->json([
                'success' => true,
                'rate' => 150, // Fallback rate
                'currency' => 'USD'
            ]);
        }
    }
}
