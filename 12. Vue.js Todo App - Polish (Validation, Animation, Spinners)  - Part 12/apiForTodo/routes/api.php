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
Route::middleware('auth:api')->group(function() {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::get('/todos', 'TodoController@index');
    Route::post('/todos', 'TodoController@store');
    Route::patch('/todos/{todo}', 'TodoController@update');
    Route::delete('/todos/{todo}', 'TodoController@destroy');

    Route::patch('/todosCheckAll', 'TodoController@updateAll');
    Route::delete('/todosDeleteCompleted', 'TodoController@destroyCompleted');

    Route::post('/logout', 'AuthController@logout');
});

Route::post('/login', 'AuthController@login');
Route::post('/register', 'AuthController@register');






