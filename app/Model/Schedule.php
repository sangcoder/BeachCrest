<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    // protected $primaryKey = 'schedule_id';
    protected $fillable = [
         'Contents'
    ];
    public $timestamp = false;
    public function tours() {
        return $this->belongsto('App\Model\Tour', 'id', 'schedule_id');
    }
    public function guiders() {
        return $this->belongsToMany('App\Model\TourGuider', 'schedule_tour_guider','schedule_id','tour_guider_id')
        ->withPivot('StartTime','EndTime','Contents')->withTimestamps();
    }

}
