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

Route::get('task','Taskcontroller@index');
Route::get('task/{id}','Taskcontroller@show');
Route::get('task1/{color}','Taskcontroller@show1');
Route::post('task','Taskcontroller@store');
Route::put('task/{id}','Taskcontroller@update');
Route::delete('task/{id}','Taskcontroller@delete');
