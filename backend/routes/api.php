<?php

use App\Http\Controllers\NotificationController;
use App\Http\Controllers\ReportsController;
use App\Models\pharmacist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\MedcineController;
use App\Http\Controllers\PharmacistController;

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

Route::middleware('auth:sanctum')->group(function(){
    Route::apiResource('reportts', ReportsController::class);
    Route::get('reports',[ReportsController::class,'getReport']);
    Route::get('monthlyReport',[ReportsController::class,'pharmacySales']);
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register',[PharmacistController::class,'register']);
Route::post('login',[PharmacistController::class,'login']);
Route::post('webLogin',[PharmacistController::class,'webLogin']);
Route::get('category',[MedcineController::class,'getCat']);

Route::middleware('auth:sanctum')->group(function(){
    Route::apiResource('medcines', MedcineController::class);
    Route::post('/medcines/{medcineId}/add-to-favorites', [MedcineController::class, 'addToFavorites']);
    Route::get('/favourites',[MedcineController::class,'viewFav']);
    Route::delete('/favourites/{medcineId}',[MedcineController::class,'removeFav']);
});

Route::middleware('auth:sanctum')->group(function(){
    Route::apiResource('orders', OrderController::class);
    //Route::delete('orders/{order}',[OrderController::class,'destroy']);
    Route::post('placeOrder', [OrderController::class,'placeOrder']);
    Route::get('viewOrders',[OrderController::class,'viewAllOrders']);
    Route::patch('orderStatus/{orderId}',[OrderController::class,'updateStatus']);
    Route::patch('billingStatus/{orderId}',[OrderController::class,'updateBillingStatus']);
    Route::get('/notifications',[NotificationController::Class,'getPharmacistNotifications']);
    Route::get('/notifications',[NotificationController::Class,'getAdminNotifications']);
});
