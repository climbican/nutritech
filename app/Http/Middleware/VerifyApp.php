<?php

namespace App\Http\Middleware;

use Closure;
use App\VersionEnvModel;
class VerifyApp
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next) {
    	$v = null;
	    if(isset(getallheaders()['EnvironmentID']) && getallheaders()['EnvironmentID'] != '') {
		    $application_id = getallheaders()['EnvironmentID'];
		    $v = VersionEnvModel::where('version_num', '=', $application_id)
			    ->where('active', '=', '1');

		    if($v->create_dte !== '' && $v->create_dte !== null){
		    	return true;
		    }
		    else return false;
	    }
	    else return false;
    }
}
