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
use BitWasp\Bitcoin\Bitcoin;
use BitWasp\Bitcoin\Key\PrivateKeyFactory;
use BitWasp\Bitcoin\Address\AddressCreator;

class BitcoinPaymentController extends Controller
{
    /**
     * Generate Bitcoin address for deposit
     */
    public function generateAddress(Request $request)
    {
        try {
            $userId = Auth::id();
            $trx = $request->trx ?? getTrx();
            
            // Generate deterministic address based on user ID and transaction
            $seed = hash('sha256', config('app.key') . $userId . $trx);
            $privateKey = PrivateKeyFactory::fromHex($seed);
            
            $network = Bitcoin::getNetwork();
            $publicKey = $privateKey->getPublicKey();
            $address = $publicKey->getAddress(new AddressCreator())->getAddress($network);

            Log::info('Bitcoin address created', [
                'user_id' => $userId,
                'trx' => $trx,
                'address' => $address
            ]);

            return response()->json([
                'success' => true,
                'address' => $address,
                'qr_code' => $this->generateQRCode($address, $request->amount)
            ]);

        } catch (\Exception $e) {
            Log::error('Bitcoin address generation failed: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Failed to generate Bitcoin address. Please try again.'
            ], 500);
        }
    }

    /**
     * Check for incoming Bitcoin payments
     */
    public function checkPayment(Request $request)
    {
        try {
            $trx = $request->trx;
            $deposit = Deposit::where('trx', $trx)
                ->where('crypto_type', 'BTC')
                ->where('status', 0)
                ->first();

            if (!$deposit) {
                return response()->json([
                    'success' => false,
                    'message' => 'Deposit not found'
                ], 404);
            }

            // Check blockchain for transactions to this address
            $result = $this->checkBlockchain($deposit->crypto_address);

            if ($result['found']) {
                // Update deposit with transaction details
                $deposit->txid = $result['txid'];
                $deposit->confirmations = $result['confirmations'];
                $deposit->crypto_amount_received = $result['amount'];
                $deposit->save();

                // Update deposit request
                $depositRequest = DepositRequest::where('deposit_id', $deposit->id)->first();
                if ($depositRequest) {
                    $depositRequest->txid = $result['txid'];
                    $depositRequest->confirmations = $result['confirmations'];
                    $depositRequest->save();
                }

                $requiredConfirmations = config('crypto.bitcoin.required_confirmations', 3);

                // Auto-approve if configured and confirmations met
                if (config('crypto.auto_approve_deposits', true) && $result['confirmations'] >= $requiredConfirmations) {
                    $this->approveDeposit($deposit);
                    
                    return response()->json([
                        'success' => true,
                        'status' => 'completed',
                        'confirmations' => $result['confirmations'],
                        'required_confirmations' => $requiredConfirmations,
                        'message' => 'Payment received and approved!'
                    ]);
                }

                return response()->json([
                    'success' => true,
                    'status' => 'pending',
                    'confirmations' => $result['confirmations'],
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
            Log::error('Bitcoin payment check failed: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Payment verification failed'
            ], 500);
        }
    }

    /**
     * Check blockchain for transactions to address
     */
    private function checkBlockchain(string $address): array
    {
        try {
            // Using blockchain.info API (you can replace with your own Bitcoin node)
            $url = "https://blockchain.info/rawaddr/{$address}";
            $response = @file_get_contents($url);

            if (!$response) {
                return ['found' => false];
            }

            $data = json_decode($response, true);

            if (!empty($data['txs'])) {
                // Get the most recent transaction
                $tx = $data['txs'][0];
                
                // Find output to our address
                foreach ($tx['out'] as $output) {
                    if (isset($output['addr']) && $output['addr'] === $address) {
                        $amount = $output['value'] / 1e8; // Convert satoshis to BTC
                        
                        // Get confirmations
                        $confirmations = 0;
                        if (isset($tx['block_height'])) {
                            $latestBlock = $this->getLatestBlockHeight();
                            $confirmations = $latestBlock - $tx['block_height'] + 1;
                        }

                        return [
                            'found' => true,
                            'txid' => $tx['hash'],
                            'amount' => $amount,
                            'confirmations' => max(0, $confirmations)
                        ];
                    }
                }
            }

            return ['found' => false];

        } catch (\Exception $e) {
            Log::error('Blockchain check failed: ' . $e->getMessage());
            return ['found' => false];
        }
    }

    /**
     * Get latest block height from blockchain
     */
    private function getLatestBlockHeight(): int
    {
        try {
            $response = file_get_contents("https://blockchain.info/latestblock");
            $data = json_decode($response, true);
            return $data['height'] ?? 0;
        } catch (\Exception $e) {
            Log::error('Failed to get block height: ' . $e->getMessage());
            return 0;
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
                ->where('crypto_type', 'BTC')
                ->first();

            if (!$deposit) {
                return response()->json([
                    'success' => false,
                    'message' => 'Deposit not found'
                ], 404);
            }

            // Get transaction details
            $url = "https://blockchain.info/rawtx/{$request->txid}";
            $response = @file_get_contents($url);

            if (!$response) {
                return response()->json([
                    'success' => false,
                    'message' => 'Transaction not found'
                ], 404);
            }

            $tx = json_decode($response, true);

            // Verify transaction outputs to our address
            foreach ($tx['out'] as $output) {
                if (isset($output['addr']) && $output['addr'] === $deposit->crypto_address) {
                    $amount = $output['value'] / 1e8;
                    
                    // Verify amount matches (allow 1% variance for fees)
                    if ($amount >= ($deposit->crypto_amount * 0.99)) {
                        $confirmations = 0;
                        if (isset($tx['block_height'])) {
                            $latestBlock = $this->getLatestBlockHeight();
                            $confirmations = $latestBlock - $tx['block_height'] + 1;
                        }

                        $deposit->txid = $request->txid;
                        $deposit->confirmations = max(0, $confirmations);
                        $deposit->crypto_amount_received = $amount;
                        $deposit->save();

                        // Update deposit request
                        $depositRequest = DepositRequest::where('deposit_id', $deposit->id)->first();
                        if ($depositRequest) {
                            $depositRequest->txid = $request->txid;
                            $depositRequest->confirmations = max(0, $confirmations);
                            $depositRequest->save();
                        }

                        $requiredConfirmations = config('crypto.bitcoin.required_confirmations', 3);

                        if ($confirmations >= $requiredConfirmations) {
                            $this->approveDeposit($deposit);
                        }

                        return response()->json([
                            'success' => true,
                            'verified' => true,
                            'confirmations' => max(0, $confirmations),
                            'required_confirmations' => $requiredConfirmations
                        ]);
                    }
                }
            }

            return response()->json([
                'success' => false,
                'message' => 'Transaction output to address not found or amount mismatch'
            ], 404);

        } catch (\Exception $e) {
            Log::error('Bitcoin transaction verification failed: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Verification failed'
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
                'Deposit via Bitcoin (BTC)',
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
                'crypto_type' => 'BTC',
                'crypto_amount' => $deposit->crypto_amount,
                'txid' => $deposit->txid,
            ];

            @send_email($user, 'DEPOSIT_COMPLETE', $shortCodes);

            // Create admin notification
            $adminNotification = new Notification();
            $adminNotification->user_id = $user->id;
            $adminNotification->title = 'Bitcoin deposit completed for ' . $user->username;
            $adminNotification->click_url = urlPath('admin.deposit.depositLog');
            $adminNotification->save();

            Log::info('Bitcoin deposit approved', [
                'deposit_id' => $deposit->id,
                'user_id' => $user->id,
                'amount' => $deposit->amount,
                'txid' => $deposit->txid
            ]);

        } catch (\Exception $e) {
            Log::error('Bitcoin deposit approval failed: ' . $e->getMessage());
        }
    }

    /**
     * Generate QR code for Bitcoin payment
     */
    private function generateQRCode(string $address, float $amount = null): string
    {
        $uri = "bitcoin:{$address}";
        
        if ($amount) {
            $uri .= "?amount={$amount}";
        }

        return "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=" . urlencode($uri);
    }

    /**
     * Get current Bitcoin to USD exchange rate
     */
    public function getExchangeRate()
    {
        try {
            $response = file_get_contents("https://blockchain.info/ticker");
            $rates = json_decode($response, true);
            
            $rate = $rates['USD']['last'] ?? 50000;

            return response()->json([
                'success' => true,
                'rate' => $rate,
                'currency' => 'USD'
            ]);

        } catch (\Exception $e) {
            Log::error('Failed to fetch Bitcoin rate: ' . $e->getMessage());
            
            return response()->json([
                'success' => true,
                'rate' => 50000, // Fallback rate
                'currency' => 'USD'
            ]);
        }
    }

    /**
     * Get Bitcoin network fee estimate
     */
    public function getFeeEstimate()
    {
        try {
            $response = file_get_contents("https://api.blockchain.info/mempool/fees");
            $fees = json_decode($response, true);

            return response()->json([
                'success' => true,
                'regular' => $fees['regular'] ?? 50,
                'priority' => $fees['priority'] ?? 100,
                'unit' => 'sat/byte'
            ]);

        } catch (\Exception $e) {
            Log::error('Failed to fetch fee estimate: ' . $e->getMessage());
            
            return response()->json([
                'success' => true,
                'regular' => 50,
                'priority' => 100,
                'unit' => 'sat/byte'
            ]);
        }
    }
}
