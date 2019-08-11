<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
	return redirect('/login');
});

/**Route::get('/passport', function() {
	return view('passport-issue');
});**/

Auth::routes();

Route::get('logout', function(){
	Auth::logout();
	return redirect('/login');
});

Route::get('/home', 'HomeController@index')->name('home');
// PRODUCTS
Route::get('admin/product/list', 'ProductController@index');
Route::get('admin/product/create', 'ProductController@create');
Route::post('admin/product/save', 'ProductController@save');
Route::get('admin/product/update/{id}', 'ProductController@updateForm');
Route::post('admin/product/update/{id}', 'ProductController@update');
Route::get('admin/product/delete/{id}', 'ProductController@delete');
Route::get('admin/product/lookup/{id}', 'ProductController@autoComplete');
Route::post('admin/product/elements/lookup/{id}', 'ProductController@fetchProductElements');
// TODO: LEFT OFF HERE.....
Route::get('admin/product/json-list', 'ProductController@fetch_all_prod_page');
// this one just pulls the data via AJAX
Route::get('admin/product/json_data/', 'ProductController@fetchList');
//CROPS
Route::get('admin/crop/list', 'CropController@index');
Route::post('admin/crop/list', 'CropController@fetchList');
Route::get('admin/crop/create', 'CropController@create');
Route::post('admin/crop/save', 'CropController@save');
Route::get('admin/crop/update/{id}', 'CropController@updateForm');
Route::post('admin/crop/update/{id}', 'CropController@update');
Route::get('admin/crop/delete/{id}', 'CropController@delete');
//ELEMENTS
Route::get('admin/element/list',  'ElementController@index');
Route::post('admin/element/list', 'ElementController@fetchList');
Route::get('admin/element/create', 'ElementController@create');
Route::post('admin/element/save', 'ElementController@save');
Route::get('admin/element/update/{id}', 'ElementController@updateForm');
Route::post('admin/element/update/{id}', 'ElementController@update');
Route::get('admin/element/delete/{id}', 'ElementController@delete');
Route::get('admin/element/lookup/{id}', 'ElementController@autoComplete');
//COMPATIBILITY
Route::get('admin/compatibility/list', 'CompatibilityController@index');
Route::get('admin/compatibility/create', 'CompatibilityController@create');
Route::post('admin/compatibility/save', 'CompatibilityController@save');
Route::get('admin/compatibility/update/{id}', 'CompatibilityController@updateForm');
Route::post('admin/compatibility/update/{id}', 'CompatibilityController@update');
Route::get('admin/compatibility/delete/{id}', 'CompatibilityController@delete');
Route::post('admin/compatibility/fetch', 'CompatibilityController@fetchList');

//DEFICIENCY
Route::get('admin/deficiency/list', 'DeficiencyController@index');
Route::post('admin/deficiency/list', 'DeficiencyController@fetchList');
Route::post('admin/deficiency/lookup/{id}', 'DeficiencyController@fetchDeficiency');
Route::get('admin/deficiency/create', 'DeficiencyController@create');
Route::post('admin/deficiency/save', 'DeficiencyController@save');
Route::get('admin/deficiency/update/{id}', 'DeficiencyController@updateForm');
Route::post('admin/deficiency/update/{id}', 'DeficiencyController@update');
Route::get('admin/deficiency/delete/{id}',  'DeficiencyController@delete');
Route::post('admin/deficiency/remove/image/{number}/{id}', 'DeficiencyController@removeImage');

//SUFFICIENCY
Route::get('admin/sufficiency/list', 'SufficiencyController@index');
Route::get('admin/sufficiency/create', 'SufficiencyController@create');
Route::post('admin/sufficiency/save', 'SufficiencyController@save');
Route::get('admin/sufficiency/update/{id}', 'SufficiencyController@updateForm');
Route::post('admin/sufficiency/update/{id}', 'SufficiencyController@update');
Route::get('admin/sufficiency/delete/{id}', 'SufficiencyController@delete');
Route::get('admin/sufficiency/json-list', 'SufficiencyController@fetch_all_suff_page');
// this one just pulls the data via AJAX
Route::get('admin/sufficiency/json_data/', 'SufficiencyController@fetch_all_suff');

//UPDATE USER PASSWORD
Route::get('admin/profile/form/{id}', 'ProfileController@updateForm');
Route::post('admin/profile/update/{id}', 'ProfileController@updateUser');

//PROFILE ADMIN
Route::get('admin/profile/list', 'ProfileController@index');
Route::get('admin/profile/create', 'ProfileController@create');
Route::post('admin/profile/save', 'ProfileController@save');
Route::get('admin/profile/update/{id}', 'ProfileController@updateForm');
Route::post('admin/profile/update/{id}', 'ProfileController@update');
Route::get('admin/profile/delete/{id}', 'ProfileController@delete');
Route::post('admin/profile/fetch/{id}', 'ProfileController@fetchUser');
