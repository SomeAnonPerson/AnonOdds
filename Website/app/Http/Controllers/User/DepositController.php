<?php

/*
 * AnonOdds - The First Anonymous SportsBook
 * Copyright (c) 2026 Skotos
 * All rights reserved.
 */

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Deposit;
use App\Models\DepositRequest;
use App\Models\General;
use App\Models\Notification;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Log;

class DepositController extends Controller
{
    /**
     * Display cryptocurrency deposit page
     */
    public function index()
    {
        $data['page_title'] = "Crypto Deposit";
        $data['crypto_options'] = ['BTC', 'XMR'];
        $data['btc_rate'] = $this->getBitcoinRate();
        $data['xmr_rate'] = $this->getMoneroRate();
        
        return view('user.deposit.index', $data);
    }

    /**
     * Generate cryptocurrency deposit address and initiate deposit
     */
    public function depositPayNow(Request $request)
    {
        $this->validate($request, [
            'amount' => 'required|numeric|min:10',
            'crypto_type' => 'required|in:BTC,XMR',
        ]);

        try {
            $amount = floatval($request->amount);
            $cryptoType = $request->crypto_type;
            $gnl = General::first();

            // No fees for crypto - direct conversion
            $charge = 0;
            $total_amount = $amount;
            $trx = getTrx();

            // Get crypto rates
            if ($cryptoType === 'BTC') {
                $rate = $this->getBitcoinRate();
                $cryptoAmount = round($total_amount / $rate, 8); // 8 decimal places for BTC
                $address = $this->generateBitcoinAddress(Auth::id(), $trx);
            } else { // XMR
                $rate = $this->getMoneroRate();
                $cryptoAmount = round($total_amount / $rate, 12); // 12 decimal places for XMR
                $address = $this->generateMoneroSubaddress(Auth::id(), $trx);
            }

            // Create deposit record
            $deposit = Deposit::create([
                'user_id' => Auth::id(),
                'amount' => $amount,
                'charge' => $charge,
                'crypto_type' => $cryptoType,
                'crypto_amount' => $cryptoAmount,
                'crypto_address' => $address['address'],
                'crypto_rate' => $rate,
                'trx' => $trx,
                'status' => 0, // Pending
                'subaddress_index' => $address['index'] ?? null,
            ]);

            // Create deposit request for admin review
            DepositRequest::create([
                'deposit_id' => $deposit->id,
                'user_id' => Auth::id(),
                'amount' => $deposit->amount,
                'charge' => $deposit->charge,
                'crypto_type' => $cryptoType,
                'crypto_amount' => $cryptoAmount,
                'crypto_address' => $address['address'],
                'trx' => $deposit->trx,
                'status' => 0,
                'subaddress_index' => $address['index'] ?? null,
            ]);

            // Notify admin
            $adminNotification = new Notification();
            $adminNotification->user_id = Auth::id();
            $adminNotification->title = "New {$cryptoType} deposit initiated";
            $adminNotification->click_url = urlPath('admin.deposit.pending');
            $adminNotification->save();

            Session::put('Track', $deposit->trx);

            // Redirect to payment view
            $data['page_title'] = "{$cryptoType} Deposit";
            $data['deposit'] = $deposit;
            $data['crypto_address'] = $address['address'];
            $data['crypto_amount'] = $cryptoAmount;
            $data['crypto_type'] = $cryptoType;
            $data['qr_code'] = $this->generateQRCode($address['address'], $cryptoAmount, $cryptoType);

            return view('user.deposit.payment_views.crypto_payment', $data);

        } catch (\Exception $e) {
            Log::error('Crypto deposit initiation failed: ' . $e->getMessage());
            return redirect()->route('deposit.index')->with('alert', 'Failed to generate deposit address. Please try again.');
        }
    }

    /**
     * Check deposit status via AJAX
     */
    public function checkDepositStatus(Request $request)
    {
        $trx = $request->trx;
        $deposit = Deposit::where('trx', $trx)->where('user_id', Auth::id())->first();

        if (!$deposit) {
            return response()->json(['status' => 'not_found']);
        }

        // Check blockchain for transaction
        $verified = false;
        $confirmations = 0;

        if ($deposit->crypto_type === 'XMR') {
            $result = $this->checkMoneroTransaction($deposit);
            $verified = $result['verified'];
            $confirmations = $result['confirmations'];
        } elseif ($deposit->crypto_type === 'BTC') {
            $result = $this->checkBitcoinTransaction($deposit);
            $verified = $result['verified'];
            $confirmations = $result['confirmations'];
        }

        // Auto-approve if verified and has enough confirmations
        if ($verified && $confirmations >= ($deposit->crypto_type === 'XMR' ? 10 : 3)) {
            $this->autoApproveDeposit($deposit);
        }

        return response()->json([
            'status' => $deposit->status,
            'verified' => $verified,
            'confirmations' => $confirmations,
            'required_confirmations' => $deposit->crypto_type === 'XMR' ? 10 : 3
        ]);
    }

    /**
     * Display user deposit log
     */
    public function depositLog()
    {
        $data['page_title'] = "Crypto Deposit Log";
        $data['deposits'] = Deposit::where('user_id', Auth::id())
            ->whereIn('crypto_type', ['BTC', 'XMR'])
            ->where('status', '!=', 0)
            ->latest('updated_at')
            ->paginate();
            
        return view('user.deposit.log', $data);
    }

    /**
     * Generate Bitcoin address for user deposit
     */
    private function generateBitcoinAddress(int $userId, string $trx): array
    {
        try {
            // Using BitWasp Bitcoin library
            $network = \BitWasp\Bitcoin\Bitcoin::getNetwork();
            
            // Generate HD wallet derivation path based on user ID
            $path = "m/44'/0'/0'/0/{$userId}";
            
            // In production, derive from master seed
            // For now, generate unique address per deposit
            $privateKey = \BitWasp\Bitcoin\Key\PrivateKeyFactory::create(true);
            $publicKey = $privateKey->getPublicKey();
            $address = $publicKey->getAddress($network)->getAddress();

            Log::info('Bitcoin address generated', [
                'user_id' => $userId,
                'trx' => $trx,
                'address' => $address
            ]);

            return [
                'address' => $address,
                'index' => $userId
            ];

        } catch (\Exception $e) {
            Log::error('Bitcoin address generation failed: ' . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Generate Monero subaddress for user deposit
     */
    private function generateMoneroSubaddress(int $userId, string $trx): array
    {
        try {
            $monero = new \MoneroIntegrations\MoneroPhp\walletRPC(
                config('crypto.monero.rpc_host'),
                config('crypto.monero.rpc_port')
            );

            // Create subaddress for this specific deposit
            $label = "User_{$userId}_TRX_{$trx}";
            $subaddress = $monero->create_address(0, $label);

            Log::info('Monero subaddress generated', [
                'user_id' => $userId,
                'trx' => $trx,
                'address' => $subaddress['address'],
                'index' => $subaddress['address_index']
            ]);

            return [
                'address' => $subaddress['address'],
                'index' => $subaddress['address_index']
            ];

        } catch (\Exception $e) {
            Log::error('Monero subaddress generation failed: ' . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Get current Bitcoin to USD rate
     */
    private function getBitcoinRate(): float
    {
        try {
            $response = file_get_contents("https://blockchain.info/ticker");
            $rates = json_decode($response, true);
            return $rates['USD']['last'] ?? 50000; // Fallback rate
        } catch (\Exception $e) {
            Log::error('Failed to fetch BTC rate: ' . $e->getMessage());
            return 50000; // Fallback rate
        }
    }

    /**
     * Get current Monero to USD rate
     */
    private function getMoneroRate(): float
    {
        try {
            $response = file_get_contents("https://api.coingecko.com/api/v3/simple/price?ids=monero&vs_currencies=usd");
            $data = json_decode($response, true);
            return $data['monero']['usd'] ?? 150; // Fallback rate
        } catch (\Exception $e) {
            Log::error('Failed to fetch XMR rate: ' . $e->getMessage());
            return 150; // Fallback rate
        }
    }

    /**
     * Check Monero transaction on blockchain
     */
    private function checkMoneroTransaction(Deposit $deposit): array
    {
        try {
            $monero = new \MoneroIntegrations\MoneroPhp\walletRPC(
                config('crypto.monero.rpc_host'),
                config('crypto.monero.rpc_port')
            );

            $transfers = $monero->get_transfers([
                'in' => true,
                'subaddr_indices' => [$deposit->subaddress_index]
            ]);

            if (!empty($transfers['in'])) {
                foreach ($transfers['in'] as $transfer) {
                    if ($transfer['amount'] >= ($deposit->crypto_amount * 1e12)) {
                        $deposit->txid = $transfer['txid'];
                        $deposit->confirmations = $transfer['confirmations'];
                        $deposit->save();

                        return [
                            'verified' => true,
                            'confirmations' => $transfer['confirmations']
                        ];
                    }
                }
            }

            return ['verified' => false, 'confirmations' => 0];

        } catch (\Exception $e) {
            Log::error('Monero transaction check failed: ' . $e->getMessage());
            return ['verified' => false, 'confirmations' => 0];
        }
    }

    /**
     * Check Bitcoin transaction on blockchain
     */
    private function checkBitcoinTransaction(Deposit $deposit): array
    {
        try {
            // Check using blockchain.info API
            $url = "https://blockchain.info/unspent?active={$deposit->crypto_address}";
            $response = @file_get_contents($url);
            
            if ($response) {
                $data = json_decode($response, true);
                
                if (!empty($data['unspent_outputs'])) {
                    foreach ($data['unspent_outputs'] as $output) {
                        if ($output['value'] >= ($deposit->crypto_amount * 1e8)) {
                            $deposit->txid = $output['tx_hash'];
                            $deposit->confirmations = $output['confirmations'] ?? 0;
                            $deposit->save();

                            return [
                                'verified' => true,
                                'confirmations' => $output['confirmations'] ?? 0
                            ];
                        }
                    }
                }
            }

            return ['verified' => false, 'confirmations' => 0];

        } catch (\Exception $e) {
            Log::error('Bitcoin transaction check failed: ' . $e->getMessage());
            return ['verified' => false, 'confirmations' => 0];
        }
    }

    /**
     * Auto-approve deposit when verified on blockchain
     */
    private function autoApproveDeposit(Deposit $deposit): void
    {
        if ($deposit->status !== 0) {
            return; // Already processed
        }

        try {
            $deposit->status = 1;
            $deposit->verified_at = now();
            $deposit->save();

            $user = User::find($deposit->user_id);
            $newBalance = $user->balance + $deposit->amount;

            createTransaction(
                "Deposit via {$deposit->crypto_type}",
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
                $depositRequest->save();
            }

            // Award referral commission
            levelCommision($deposit->user_id, $deposit->amount);

            $gnl = General::first();
            $shortCodes = [
                'trx' => $deposit->trx,
                'amount' => $deposit->amount,
                'currency' => $gnl->currency,
                'crypto_type' => $deposit->crypto_type,
                'crypto_amount' => $deposit->crypto_amount,
            ];

            @send_email($user, 'DEPOSIT_COMPLETE', $shortCodes);

            Log::info('Crypto deposit auto-approved', [
                'deposit_id' => $deposit->id,
                'user_id' => $user->id,
                'crypto_type' => $deposit->crypto_type
            ]);

        } catch (\Exception $e) {
            Log::error('Auto-approval failed: ' . $e->getMessage());
        }
    }

    /**
     * Generate QR code for crypto address
     */
    private function generateQRCode(string $address, float $amount, string $cryptoType): string
    {
        if ($cryptoType === 'BTC') {
            $uri = "bitcoin:{$address}?amount={$amount}";
        } else { // XMR
            $uri = "monero:{$address}?tx_amount={$amount}";
        }

        // Return QR code API URL (you can use any QR code service)
        return "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=" . urlencode($uri);
    }
}
