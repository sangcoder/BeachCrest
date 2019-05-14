<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Model\TourGuider;
use Faker\Generator as Faker;

$factory->define(TourGuider::class, function (Faker $faker) {
    return [
        'GuiderName' => $faker->name,
        'Birthday' => $faker->dateTimeThisYear($max = '+1 year')->format('Y-m-d H:i:s'),
        'Address' => $faker->streetAddress,
        'PhoneNumner' => $faker->e164PhoneNumber,
        'ImgUrl' => $faker->imageUrl(640, 480, 'people'),
        'Gender' => $faker->numberBetween(0,1)
    ];
});
