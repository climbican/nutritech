<?php

namespace App\Providers;

use App\Providers\TelescopeServiceProvider;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
    	// TODO: REMOVE THIS WHEN DEPLOYING TO PRODUCTION.  IT CRASHES THE SITE.
	    if ($this->app->isLocal()) {
		    $this->app->register(TelescopeServiceProvider::class);
	    }
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
