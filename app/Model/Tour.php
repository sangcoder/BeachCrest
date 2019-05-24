<?php

namespace App\Model;

use App\Model\Review;
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
        'Unit',
        'schedule_id'
    ];

    public function promotions() {
        return $this->belongsToMany('App\Model\Promotion','promotion_tour','tour_id','promotion_id')
        ->withPivot('Discount','ExpiredDate');
    }
    public function scenics() {
        return $this->belongsToMany(Scenic_Culture::class, 'scenic__culture_tour','scenic_id','tour_id');
    }   
    public function reviews() {
        return $this->hasMany(Review::class, 'tour_id');
    }
    public function schedules() {
        return $this->hasOne('App\Model\Schedule', 'id', 'schedule_id');
    }
}
