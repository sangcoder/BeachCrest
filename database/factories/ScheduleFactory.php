<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Model\Tour;
use App\Model\Schedule;
use App\Model\TourGuider;
use Faker\Generator as Faker;

$factory->define(Schedule::class, function (Faker $faker) {
    return [
        'Contents' => $faker->text(150)
    ];
});
