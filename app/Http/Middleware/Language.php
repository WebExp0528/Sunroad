<?php
// app/Http/Middleware/Language.php

namespace App\Http\Middleware;

use App\Setting;
use Closure;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request;
use Illuminate\Routing\Redirector;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Session;

class Language
{
    public function handle($request, Closure $next)
    {
        if(Schema::hasTable('settings')) {
            if(Auth::user())
            {
                if(Auth::user()->language != null)
                {
                    App::setLocale(Auth::user()->language);
                }
                else
                {
                    App::setLocale(Setting::get('language', 'en'));    
                }
            }
            else
            {
                App::setLocale(Setting::get('language', 'en'));
            }
                
        }
        else {
            App::setLocale('en');
        }
         return $next($request);
    }
}
?>