<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Model\Tour;
use Faker\Generator as Faker;

$factory->define(Tour::class, function (Faker $faker) {
    return [
        'TourName' => $faker->sentence($nbWords = 6, $variableNbWords = true),
        'TourDescription' => $faker->paragraph($nbSentences = 3, $variableNbSentences = true),
        'DateDeparture' => $faker->dateTimeThisYear($max = '+3 day')->format('Y-m-d H:i:s'),
        'DateBack' => $faker->dateTimeThisYear($max = '+7 day')->format('Y-m-d H:i:s'),
        'Note' => $faker->sentence($nbWords = 6, $variableNbWords = true),
        'ImageUrl' => $faker->imageUrl($width = 640, $height = 480, 'nature'),
        'NumberPerson' => $faker->numberBetween(10,20),
        'PriceAdult' => $faker->numberBetween(300000,15000000),
        'PriceKid' => $faker->numberBetween(300000,350000),
        'Unit' => 'VND'
    ];
});
