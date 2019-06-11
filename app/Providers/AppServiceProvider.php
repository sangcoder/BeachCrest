<?php

namespace App\Providers;

use DateTime;
use Validator;
use Carbon\Carbon;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
        Validator::extend('is_image', function ($attribute, $value, $parameters, $validator) {
            preg_match_all('/([^\.]+)\.([a-zA-Z]+)/',$value,$matchedExt);
            if (isset($matchedExt[2][0]) && in_array($matchedExt[2][0],$parameters)) return true;
            preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$value,$matched);
            $ext = isset($matched[1][0]) ? $matched[1][0] : false;
            print_r($value);
            return in_array($ext,$parameters) ? true : false;
         });
        Validator::extend('olderThan', function($attribute, $value, $parameters)
            {
                $minAge = ( ! empty($parameters)) ? (int) $parameters[0] : 13;
                // return (new DateTime)->diff(new DateTime($value))->y >= $minAge;

               // or the same using Carbon:
                return Carbon::now()->diff(new Carbon($value))->y >= $minAge;
            });
            Validator::extend('smallerThan', function($attribute, $value, $parameters)
            {
                $minAge = ( ! empty($parameters)) ? (int) $parameters[0] : 13;
                // return (new DateTime)->diff(new DateTime($value))->y >= $minAge;

               // or the same using Carbon:
                return Carbon::now()->diff(new Carbon($value))->y < $minAge;
            });
    }
}
