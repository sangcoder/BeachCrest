<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Model\Tour;
use App\Model\Schedule;
use App\Model\TourGuider;
use Faker\Generator as Faker;

$factory->define(Schedule::class, function (Faker $faker) {
    return [
        'StartTime' => $faker->dateTimeThisYear($max = '+1 day')->format('Y-m-d H:i:s'),
        'EndTime' => $faker->dateTimeThisYear($max = '+3 day')->format('Y-m-d H:i:s'),
        'guider_id' => function () {
            return TourGuider::all()->random()->GuiderID;
        },
        'Contents' => $faker->text(150)
    ];
});
