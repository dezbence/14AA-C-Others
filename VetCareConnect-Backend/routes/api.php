<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Controllers\AuthController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::get('/vet-all', [MainController::class, 'getAllVet']);

Route::get('/owner-data/{id}', [MainController::class, 'getOwnerData']);
Route::get('/vet-data/{id}', [MainController::class, 'getVetData']);

Route::get('/pets/{id}', [MainController::class, 'getPets']);

Route::get('/openings/{id}', [MainController::class, 'getOpenings']);

Route::get('/cure-types-all', [MainController::class, 'getCureTypes']);

Route::get('/owner-appointments/{id}', [MainController::class, 'getOwnerAppointments']);




Route::post('/register',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);
//Route::post('/logout',[AuthController::class,'logout']);

Route::middleware('auth:sanctum')->group(function(){
    Route::post('logout',[AuthController::class,'logout']);

});
