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


/* form 1*/
Route::get('agregar','SystemController@formulario');
Route::post('guardar','SystemController@guardar');
Route::get('records','SystemController@showrecords');
Route::get('deleterow/{id}','SystemController@deleterow');
Route::get('editrow/{id}','SystemController@editrow');
Route::post('updaterow/{id}','SystemController@updaterow');

/* form 2*/
Route::get('agregar2','SystemController@formulario2');
Route::post('guardar2','SystemController@guardar2');
Route::get('records2','SystemController@showrecords2');
Route::get('editrow2/{id}','SystemController@editrow2');
Route::post('updaterow2/{id}','SystemController@updaterow2');
