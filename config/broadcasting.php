<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Default Broadcaster
    |--------------------------------------------------------------------------
    |
    | This option controls the default broadcaster that will be used by the
    | framework when an event needs to be broadcast. You may set this to
    | any of the connections defined in the "connections" array below.
    |
    */

    'default' => env('BROADCAST_DRIVER', 'pusher'),

    /*
    |--------------------------------------------------------------------------
    | Broadcast Connections
    |--------------------------------------------------------------------------
    |
    | Here you may define all of the broadcast connections that will be used
    | to broadcast events to other systems or over websockets. Samples of
    | each available type of connection are provided inside this array.
    |
    */

    'connections' => [

        'pusher' => [
            'driver' => 'pusher',
            'key' => env('PUSHER_APP_KEY'),
            'secret' => env('PUSHER_APP_SECRET'),
            'app_id' => env('PUSHER_APP_ID'),
            'options' => [
              'cluster' => env('PUSHER_APP_CLUSTER'),
              'encrypted' => false,
            ],
        ],

        'redis' => [
            'driver'     => 'redis',
            'connection' => 'default',
        ],

        'log' => [
            'driver' => 'log',
        ],

        'apn' => [
            'is_production' => env('APP_ENV') === 'production',
            'key_id' => env('APN_KEY_ID'), // The Key ID of the p8 file (available at https://developer.apple.com/account/ios/authkey/)
            'team_id' => env('APN_TEAM_ID'), // The Team ID of your Apple Developer Account (available at https://developer.apple.com/account/#/membership/)
            'app_bundle_id' => env('APN_APP_BUNDLE_ID'), // The Bundle ID of your application. For example, "com.company.application"
            'private_key_path' => env('APN_PRIVATE_KEY', storage_path('AuthKey_54RHYNWG49.p8')),
            'private_key_secret' => env('APN_PRIVATE_KEY_SECRET'),
        ],

    ],

];
