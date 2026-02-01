<?php

/*
 * AnonOdds - The First Anonymous SportsBook
 * Copyright (c) 2026 Skotos
 * All rights reserved.
 */

return [

    /*
    |--------------------------------------------------------------------------
    | Monero Configuration
    |--------------------------------------------------------------------------
    |
    | Configuration for Monero wallet RPC and daemon connections.
    | Ensure monero-wallet-rpc and monerod are running.
    |
    */

    'monero' => [
        'rpc_host' => env('MONERO_WALLET_RPC_HOST', '127.0.0.1'),
        'rpc_port' => env('MONERO_WALLET_RPC_PORT', 18082),
        'daemon_host' => env('MONERO_DAEMON_HOST', '127.0.0.1'),
        'daemon_port' => env('MONERO_DAEMON_PORT', 18081),
        'wallet_password' => env('MONERO_WALLET_PASSWORD'),
        'required_confirmations' => env('MONERO_CONFIRMATIONS', 10),
        'network' => env('MONERO_NETWORK', 'mainnet'), // mainnet, testnet, stagenet
    ],

    /*
    |--------------------------------------------------------------------------
    | Bitcoin Configuration
    |--------------------------------------------------------------------------
    |
    | Configuration for Bitcoin Core RPC connection.
    | Ensure bitcoind is running with RPC enabled.
    |
    */

    'bitcoin' => [
        'rpc_host' => env('BITCOIN_RPC_HOST', '127.0.0.1'),
        'rpc_port' => env('BITCOIN_RPC_PORT', 8332),
        'rpc_user' => env('BITCOIN_RPC_USER'),
        'rpc_password' => env('BITCOIN_RPC_PASSWORD'),
        'required_confirmations' => env('BITCOIN_CONFIRMATIONS', 3),
        'network' => env('BITCOIN_NETWORK', 'mainnet'), // mainnet, testnet
    ],

    /*
    |--------------------------------------------------------------------------
    | Rate Update Frequency
    |--------------------------------------------------------------------------
    |
    | How often to fetch fresh cryptocurrency exchange rates (in minutes).
    |
    */

    'rate_cache_minutes' => env('CRYPTO_RATE_CACHE', 5),

    /*
    |--------------------------------------------------------------------------
    | Auto-Approval Settings
    |--------------------------------------------------------------------------
    |
    | Enable automatic deposit approval when confirmations are met.
    |
    */

    'auto_approve_deposits' => env('CRYPTO_AUTO_APPROVE', true),

];
