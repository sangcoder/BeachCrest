<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $fillable = [
        'StartTime', 'EndTime', 'guider_id', 'Contents'
    ];
    public $timestamp = false;

    public function guider() {
        return $this->belongsTo('App\Model\TourGuider','guider_id');
    }
    public function tours() {
        return $this->belongsto('App\Model\Tour', 'schedule_id');
    }
}
