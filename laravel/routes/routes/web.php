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
/*
Route::get('salud', function () {
    return view('prueba.saludo');
});
*/

Route::get('contacto/{nombre}', function ($nombre){
    return view('contacto', array("nombre"=>$nombre));
    
});

