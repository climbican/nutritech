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
Route::get('user/app/deficiency/fetch/all', 'DeficiencyController@fetchList');
Route::get('user/app/deficiency/fetch/single/{id}', 'DeficiencyController@fetchDeficiency');

Route::group(['namespace' => 'api'], function () {
	Route::post( 'community/add/deficiency/image', array('middleware'=>'cors', 'uses'=>'DeficiencyApiController@add_new_image' ));
	Route::get('user/app/crop/fetch/list', array('middleware' => 'cors', 'uses' => 'CropApiController@fetchAppList'));
	Route::get('user/app/deficiency/fetch/list/{id}', array('middleware'=> 'cors', 'uses'=> 'DeficiencyApiController@fetch_list_from_crop_id'));
	Route::get('users/app/deficiency/fetch/single/{id}', array('middleware'=> 'cors', 'uses'=> 'DeficiencyApiController@deficiency_detail'));
});