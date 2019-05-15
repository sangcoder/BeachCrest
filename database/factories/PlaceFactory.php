<?php

use Faker\Generator as Faker;

$factory->define(App\Model\Place::class, function (Faker $faker) {
    return [
        'PlaceName' => $faker->state,
        'Description' => $faker->text(150),
        'Contents' => $faker->paragraph,
        'Region' => $faker->randomElement(['MienBac', 'MienTrung', 'MienNam','TayNguyen','TayBac']), 
        'ImgUrl' => $faker->ImageUrl(800, 600, 'city')
    ];
});
