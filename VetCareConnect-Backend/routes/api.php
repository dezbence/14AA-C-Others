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

Route::get('/pets', [MainController::class, 'getPets']);
Route::get('/ownerData', [MainController::class, 'getOwnerData']);
Route::get('/owner-appointments', [MainController::class, 'getOwnerAppointmentsORM']);
Route::get('/ownerAppointmentsSQL', [MainController::class, 'getOwnerAppointmentsSQL']);
Route::get('/vetData', [MainController::class, 'getVetData']);
Route::get('/openings', [MainController::class, 'getOpenings']);


Route::post('/register',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);

