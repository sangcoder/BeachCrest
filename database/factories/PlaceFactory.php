<?php

use Faker\Generator as Faker;

$factory->define(App\Model\Place::class, function (Faker $faker) {
    return [
        'PlaceName' => $faker->word,
        'Description' => $faker->text(150),
        'Contents' => $faker->paragraph,
        'Region' => $faker->name, 
        'ImgUrl' => $faker->ImageUrl(800, 600, 'city')
    ];
});
