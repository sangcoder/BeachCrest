<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\User;
use App\Model\News;
use Faker\Generator as Faker;

$factory->define(News::class, function (Faker $faker) {
    return [
        'Title' => $faker->text($maxNbChars = 10),
        // 'ImgUrl' => $faker->imageUrl($width = 640, $height = 480),
        // 'Contents' => $faker->paragraphs($nb = 3, $asText = false),
        'State' => 0,
        'user_id' => function () {
            return User::all()->random()->id;
        }
    ];
});
