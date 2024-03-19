<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\OwnerController;
use App\Http\Controllers\VetController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\MailController;
use App\Http\Controllers\PasswordController;

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

Route::post('/register',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);
Route::post('/admin-login',[AuthController::class,'adminLogin']);

Route::post('/search-vets', [MainController::class, 'searchVets']);

Route::get('/cure-types-all', [MainController::class, 'getAllCureTypes']);
Route::get('/faq-all', [MainController::class, 'getAllQuestions']);

Route::get('email/verify/{id}', [MailController::class, 'verify'])->name('verification.verify');
Route::get('email/resend/{email}', [MailController::class, 'resend'])->name('verification.resend');

Route::post('/forgot-password', [PasswordController::class, 'forgotPassword']);
Route::patch('/reset-password', [PasswordController::class, 'resetPassword']);

Route::middleware('auth:sanctum')->group(function(){

    Route::post('/logout',[AuthController::class,'logout']);
    Route::post('/logout-all-device',[AuthController::class,'logoutAllDevice']);

    Route::get('/user-data', [MainController::class, 'getUserData']);
    Route::put('/modify-user-data',[MainController::class,'modifyUserData']);

    Route::get('/vet-all', [MainController::class, 'getAllVet']);
    Route::get('/owner-all', [MainController::class, 'getAllOwner']);

    Route::middleware('only-admin')->group(function(){

        Route::delete('/delete-vet/{id}', [AdminController::class, 'deleteVet']);
        Route::delete('/delete-owner/{id}', [AdminController::class, 'deleteOwner']);
        Route::post('/modify-user-email', [AdminController::class, 'modifyUserEmail']);
    });

    Route::middleware('only-owner')->group(function(){
        //Route::get('/bearer-test',[MainController::class,'bearerTest']);


        Route::get('/pets', [OwnerController::class, 'getPets']);
        Route::post('/new-pet',[OwnerController::class,'addNewPet']);
        Route::put('/modify-pet',[OwnerController::class,'modifyPet']);
        Route::delete('/delete-pet/{id}', [OwnerController::class, 'deletePet']);

        Route::get('/free-appointments/{id}/{date}', [OwnerController::class, 'getFreeAppointments']);
        Route::post('/new-appointment',[OwnerController::class,'addNewAppointment']);
        Route::get('/owner-appointments', [OwnerController::class, 'getOwnerAppointments']);
        Route::delete('/delete-appointment/{id}', [OwnerController::class, 'deleteAppointment']);

    });

    Route::middleware('only-vet')->group(function(){
        Route::get('/vet-appointments/{date}', [VetController::class, 'getVetAppointments']);

        Route::get('/openings', [VetController::class, 'getOpenings']);
        Route::post('/new-openings', [VetController::class, 'addOpenings']);
        Route::put('/modify-opening',[VetController::class,'modifyOpening']);
        Route::delete('/delete-opening/{day}',[VetController::class,'deleteOpening']);

        Route::get('/special-openings', [VetController::class, 'getSpecialOpenings']);
        Route::post('/new-special-openings', [VetController::class, 'addSpecialOpenings']);
        Route::put('/modify-special-opening',[VetController::class,'modifySpecialOpening']);
        Route::delete('/delete-special-opening/{id}',[VetController::class,'deleteSpecialOpening']);
    });

});


