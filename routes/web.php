<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/index', [\App\Http\Controllers\IndexController::class, 'index']);

Route::post('/42yUojv1YQPOssPEpn5i3q6vjdhh7hl7djVWDIAVhFDRMAwZ1tj0Og2v4PWyj342/webhook', function () {
//    $update = Telegram::commandsHandler(true);
//    \App\Services\TelegramService::handleWebhook($update);
    return 'ok';
});
