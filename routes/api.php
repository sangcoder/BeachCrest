<?php

use App\Http\AppResponse;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/
// Định các route register, login
// Route::get('/redirect/facebook', 'SocialAuthController@redirectFacebook');

Route::group([
    // api/auth/
    'prefix' => 'auth'
], function() {
    Route::post('register', 'AuthController@register');
    Route::post('checkUnique', 'AuthController@checkUniqueEmail');
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
Route::get('tour/getById/{tour}', 'TourController@show');
// Find Tour
Route::get('tour/findAndFilter', 'TourController@findTour');

// Review
Route::get('review/getReviewById/{tour}', 'ReviewController@index')->name('reviews.index');
Route::get('review/getAll', 'ReviewController@getAll');
Route::post('review/acceptReview/{review}', 'ReviewController@update');
Route::post('review/addReview', 'ReviewController@store');
// Delete a review
Route::delete('review/deleleReview/{review}', 'ReviewController@destroy');
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
Route::get('place/getSelect', 'API\PlaceController@getListPlaceValue');


// Place
Route::get('place/statsCultures', 'API\PlaceController@statsDestination');

Route::group([
    'middleware' => 'jwt.auth'
], function () {
    // Add Role for User
    Route::post('user/addRoleModel', 'API\UserController@addModelRole');

    Route::get('permission/getAll', 'AuthorizationController@getAllPermission');
    Route::get('roles/getAll', 'AuthorizationController@getListRoles');
    Route::get('permission/getAllPermission/{id}', 'AuthorizationController@getPermissionByRole');
    Route::post('permission/addPermissionToRole', 'AuthorizationController@addPermissionToRole');
    Route::post('roles/addNewRole', 'AuthorizationController@addNewRole');
    Route::delete('role/DeleteRole/{role}', 'AuthorizationController@deleteRoles');
    Route::delete('tourguider/deletemore', 'TourGuiderController@removeMore');

    // Booking
    Route::get('booking', 'BookingController@index');
    Route::get('booking/{booking}', 'BookingController@show');
    Route::get('bookingStats', 'BookingController@statsBookingAll');
    Route::post('booking/addNewBooking', 'BookingController@Booking');
    Route::post('booking/acceptPaypal', 'BookingController@addPaymentPaypals');
    Route::post('booking/acceptBooking', 'BookingController@acceptBooking');
    Route::delete('booking/{booking}', 'BookingController@destroy');
    // Add khuyến mãi
    Route::post('tour/addPromotion/{tour}', 'TourController@addPromotion');
    // Search khuyen mai
    Route::get('promotion/search', 'PromotionController@search');
    Route::get('cultures/getAllSelect', 'API\ScenicCultureController@getListTourValue');

    // User
    Route::get('user/getAllRole/{id}', 'API\UserController@getAllRoleByUser');
    Route::post('user/deleteRole/{id}', 'API\UserController@deleteRoleById');

    // CRUD New
    Route::get('news', 'NewsController@index');
    Route::post('news', 'NewsController@store');
    Route::put('news/{news}', 'NewsController@update');
    Route::delete('news/{news}', 'NewsController@destroy');
    // API CRUD
    Route::apiResources([
        'user' =>'API\UserController',
        'place' => 'API\PlaceController',
        'promotion' => 'PromotionController',
        'tourguider' => 'TourGuiderController',
        'cultures' => 'API\ScenicCultureController'
    ]);
});
Route::get('news/getbyId/{news}', 'NewsController@show');

Route::post('uploadImage', 'API\UploadImage@upload');
Route::post('uploadJson','API\UploadImage@uploadJson');
Route::post('upload/tinymce', 'API\UploadImage@uploadMCE');


Route::get('getRate', 'BookingController@getRateDolar');