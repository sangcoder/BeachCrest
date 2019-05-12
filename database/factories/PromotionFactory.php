<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Model\Promotion;
use Faker\Generator as Faker;

$factory->define(Promotion::class, function (Faker $faker) {
    return [
        'Contents' => $faker->paragraph
    ];
});
