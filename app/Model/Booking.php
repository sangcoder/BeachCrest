<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $primaryKey = "BookingID";
    public $timestamps = true;
    //
    public function customers() {
        return $this->hasMany('App\Model\Customers');
    }
    public function payments() {
        return $this->hasMany('App\Model\Payment');
    }
    public function tour() {
        return $this->belongsTo(Tour::class);
    }
    public function user() {
        return $this->belongsTo(User::class);
    }
}
