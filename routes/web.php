<?php

use App\Exports\TourGuiderExport;
use Maatwebsite\Excel\Facades\Excel;

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

// Login social network
Route::get('/redirect/facebook', 'SocialAuthController@redirectFacebook');
Route::get('/redirect/facebook/callback', 'SocialAuthController@callbackFacebook');

// Check out paypal
Route::get('checkout/paypal', 'PaypalController@index');
Route::get('paypal/status', 'PayPalTestController@status');
Route::get('paypal/payment/list', 'PayPalTestController@paymentList');
Route::get('paypal/payment/detail', 'PayPalTestController@paymentDetail');
Route::post('checkout-paypal', 'PaypalController@checkoutPaypal');



Route::get('/client', function () {
    return view('home');
});

Route::get('/test','HomeController@test');

// Admin route
Route::group(['prefix' => 'admin'], function () {

});
Route::get('/{vue_capture?}', 'AdminController@index')
->middleware(['speed'])
->where('vue_capture', '[\/\w\.\,\-]*');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::post('/home',['as' => 'search', 'use' => 'HomeController@search'] );

// Export Excel
Route::get('/download/tourguider', function () {
    return Excel::download(new TourGuiderExport, 'danh-sach-huong-dan-vien.xlsx');
});