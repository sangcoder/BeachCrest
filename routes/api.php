<?php

use App\Http\AppResponse;
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

// Tour
Route::get('tour/getAll', 'TourController@index');
Route::post('tour/addNewTour', 'TourController@store');
Route::put('tour/updateTour/{tour}', 'TourController@update');
Route::delete('tour/deleteTour/{tour}', 'TourController@destroy');

// Review
Route::get('review/getReviewById/{tour}', 'ReviewController@index')->name('reviews.index');

// Schedule
Route::get('schedules/getAll', 'ScheduleController@index');
Route::get('schedules/getById', 'ScheduleController@findSchedulesById');
Route::get('schedules/getListGuider/{id}', 'ScheduleController@getListGuiderBySchedule');
// Add guider to schedule
Route::post('schedules/addGuiderToSchedule/{schedule}', 'ScheduleController@addGuiderToSchedule');
Route::post('schedules/deleteGuiderToSchedule/{schedule}', 'ScheduleController@deleteGuiderSchedule');

// CRUD
Route::post('schedules/addNew', 'ScheduleController@store');
Route::put('schedules/updateSchedule/{schedule}', 'ScheduleController@update');
Route::delete('schedules/deleteSchedule/{schedule}', 'ScheduleController@destroy');

Route::group([
    'middleware' => 'jwt.auth'
], function () {
    Route::get('permission/getAll', 'AuthorizationController@getAllPermission');
    Route::get('roles/getAll', 'AuthorizationController@getListRoles');
    Route::get('permission/getAllPermission/{id}', 'AuthorizationController@getPermissionByRole');
    Route::delete('tourguider/deletemore', 'TourGuiderController@removeMore');

    // Add khuyến mãi
    Route::post('tour/addPromotion/{tour}', 'TourController@addPromotion');
    // Search khuyen mai
    Route::get('promotion/search', 'PromotionController@search');

    // API CRUD
    Route::apiResources([
        'user' =>'API\UserController',
        'place' => 'API\PlaceController',
        'promotion' => 'PromotionController',
        'tourguider' => 'TourGuiderController',
        'cultures' => 'API\ScenicCultureController'
    ]);
});


Route::post('uploadImage', 'API\UploadImage@upload');
Route::post('uploadJson','API\UploadImage@uploadJson');