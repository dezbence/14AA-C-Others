<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Controllers\OwnerController;
use App\Http\Controllers\VetController;
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



Route::post('/register',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);

Route::post('/search-vets', [MainController::class, 'searchVets']);
Route::get('/vet-all', [MainController::class, 'getAllVet']);
Route::get('/cure-types-all', [MainController::class, 'getAllCureTypes']);

Route::middleware('auth:sanctum')->group(function(){

    Route::post('/logout',[AuthController::class,'logout']);
    Route::get('/user-data', [MainController::class, 'getUserData']);

    Route::middleware('only-owner')->group(function(){
        //Route::get('/bearer-test',[MainController::class,'bearerTest']);

        Route::get('/pets', [OwnerController::class, 'getPets']);
        Route::post('/new-pet',[OwnerController::class,'addNewPet']);
        Route::post('/delete-pet', [OwnerController::class, 'deletePet']);

        Route::post('/free-appointments', [OwnerController::class, 'getFreeAppointments']);
        Route::post('/new-appointment',[OwnerController::class,'addNewAppointment']);
        Route::get('/owner-appointments', [OwnerController::class, 'getOwnerAppointments']);
        Route::post('/delete-appointment', [OwnerController::class, 'deleteAppointment']);

    });

    Route::middleware('only-vet')->group(function(){
        //Route::get('/bearer-test',[MainController::class,'bearerTest']);
    });

});


