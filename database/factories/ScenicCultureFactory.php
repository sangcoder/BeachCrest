<?php

use Faker\Generator as Faker;
use App\Model\Place;

$factory->define(App\Model\Scenic_Culture::class, function (Faker $faker) {
    return [
        'place_id' => function () {
            return Place::all()->random()->PlaceID;
        },
        'ScenicName' => $faker->country,
        'Description' => $faker->text(150),
        'Contents' => $faker->paragraph,
        'HitCount' => $faker->numberBetween(0,1000),
        'ImgUrl' => $faker->ImageUrl(800, 600, 'nature'),
        'state' => $faker->numberBetween(0, 2)
    ];
});
