<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/
// Định các route register, login
Route::group([
    // api/auth/
    'prefix' => 'auth'
], function() {
    Route::post('register', 'AuthController@register');
    Route::post('login', 'AuthController@login');
    Route::get('register/activate/{token}','AuthController@activate');
    // Phải xác thực mới được thực hiện
    Route::group([
        'middleware' => 'jwt.auth'
    ], function () {
        Route::get('logout', 'AuthController@logout');
        Route::get('getUser', 'AuthController@getUser');
    });
    // Giới hạn số lần request/s cho các route 60s/req
    Route::group([
        'middleware' => 'api'
    ], function() {
        Route::post('password/token/create','AuthController@createPasswordResetToken');
    });
});

// API
Route::apiResources([
    'user' =>'API\UserController',
    'place' => 'API\PlaceController',
    'promotion' => 'PromotionController'
]);

Route::post('uploadImage', 'API\UploadImage@upload');
Route::post('uploadJson','API\UploadImage@uploadJson');