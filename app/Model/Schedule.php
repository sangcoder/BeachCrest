<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $fillable = [
        'StartTime', 'EndTime', 'guider_id', 'tour_id'
    ];
    public $timestamp = false;

    public function guider() {
        return $this->belongsTo('App\Model\TourGuider','guider_id')
    }
}
