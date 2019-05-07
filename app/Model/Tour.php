<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Tour extends Model
{
    protected $primaryKey = "TourID";
    public $timestamps = true;
    protected $fillable = [
        'TourName',
        'TourDescription',
        'DateDeparture',
        'DateBack',
        'Note',
        'ImageUrl',
        'NumberPerson',
        'PriceAdult',
        'PriceKid',
        'Unit'
    ];

    public function promotions() {
        return $this->belongsToMany('App\Model\Promotion', 'promotion_tour', 'promotion_id', 'tour_id')->withPivot('Discount','ExpriredDate');
    }
    public function scenics() {
        return $this->belongsToMany('App\Model\Scenic_Culture', 'scenic__culture_tour','ScenicID','TourID');
    }
    public function users() {
        return $this->belongsToMany('App\User', 'tour_user', 'tour_id', 'user_id')->withPivot('NumberPerson','DateBooking', 'Note', 'State');
    }
}
