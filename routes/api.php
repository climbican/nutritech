<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


// USER ROUTES FOR ADDING DEFICIENCIES
// need to secure this one.
Route::post( 'community/add/deficiency/image', 'DeficiencyController@add_new_image' );
Route::get('user/app/deficiency/fetch/all', 'DeficiencyController@fetchList');
Route::get('user/app/deficiency/fetch/single/{id}', 'DeficiencyController@fetchDeficiency');

Route::group(['namespace' => 'api'], function () {
	Route::get('user/app/crop/fetch/list', 'CropApiController@fetchAppList'); //production
	//Route::get('user/app/crop/fetch/list', array('middleware' => 'cors', 'uses' => 'CropApiController@fetchAppList'));
});