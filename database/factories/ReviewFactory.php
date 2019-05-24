<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\User;
use App\Model\Tour;
use App\Model\Review;
use App\Model\TourGuider;
use Faker\Generator as Faker;

$factory->define(Review::class, function (Faker $faker) {
    return [
        'user_id' => function () {
            return User::all()->random();
        },
        'Contents' => 'Đây là nội dung bình luận về Tour. Bình luận test thử đi nào',
        'Rating' => $faker->numberBetween(1,5),
        'tour_id' => function () {
            return Tour::all()->random()->TourID;
        },
        'Contents' => $faker->text(150)
    ];
});
