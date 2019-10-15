<?php

namespace App\Http;

use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    /**
     * The application's global HTTP middleware stack.
     *
     * These middleware are run during every request to your application.
     *
     * @var array
     */
    protected $middleware = [
        \Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode::class,
    ];

    /**
     * The application's route middleware groups.
     *
     * @var array
     */
    protected $middlewareGroups = [
        'web' => [
            \App\Http\Middleware\EncryptCookies::class,
            \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
            \Illuminate\Session\Middleware\StartSession::class,
            \App\Http\Middleware\Language::class,
            \Illuminate\View\Middleware\ShareErrorsFromSession::class,
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
            \App\Http\Middleware\VerifyCsrfToken::class,
        ],

        'api' => [
            'throttle:60,1',
            'bindings',
        ],
    ];

    /**
     * The application's route middleware.
     *
     * These middleware may be assigned to groups or used individually.
     *
     * @var array
     */
    protected $routeMiddleware = [
        'auth' => \Illuminate\Auth\Middleware\Authenticate::class,
        'bindings' => \Illuminate\Routing\Middleware\SubstituteBindings::class,
        'can' => \Illuminate\Auth\Middleware\Authorize::class,
        'can'         => \Illuminate\Foundation\Http\Middleware\Authorize::class,
        'guest'       => \App\Http\Middleware\RedirectIfAuthenticated::class,
        'throttle'    => \Illuminate\Routing\Middleware\ThrottleRequests::class,
        'editown'     => \App\Http\Middleware\EditOwn::class,
        'disabledemo' => \App\Http\Middleware\DisableDemo::class,
        'editgroup'   => \App\Http\Middleware\EditGroup::class,
        'editpage'    => \App\Http\Middleware\EditPage::class,
        'role'        => \Zizaco\Entrust\Middleware\EntrustRole::class,
        'permission'  => \Zizaco\Entrust\Middleware\EntrustPermission::class,
        'ability'     => \Zizaco\Entrust\Middleware\EntrustAbility::class,
        'cors'        => \App\Http\Middleware\Cors::class,
        'editevent'   => \App\Http\Middleware\EditEvent::class,
        'jwt.verify'  => \App\Http\Middleware\JwtMiddleware::class
    ];
}
