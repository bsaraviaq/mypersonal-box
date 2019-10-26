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

/*Route::get('saludo', function () {
    return view('prueba.saludo');
});
*/

Route::get('productos', function ($nombre){
    return view('productos');    
});

