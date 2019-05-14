<?php

namespace App\Model;

use App\Model\Schedule;
use Illuminate\Database\Eloquent\Model;

class TourGuider extends Model
{
    protected $fillable = [
        'GuiderName', 'Birthday', 'Address', 'PhoneNumner', 'ImgUrl','Gender'
    ];
    public $timestamp = false;
    protected $primaryKey = "GuiderID";

    // Relationship ORM
    public function schedules() {
        $this->hasMany(Schedule::class, 'guider_id');
    }
}
