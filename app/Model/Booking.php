<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $primaryKey = "BookingID";
    protected $fillable = [
        'NumberPerson', 'DateBooking', 'Note', 'State', 'tour_id', 'user_id', 'approved_by'
    ];
    public $timestamps = true;
    //
    public function customers() {
        return $this->hasMany('App\Model\Customers', 'booking_id');
    }
    public function payment() {
        return $this->hasOne('App\Model\Payment', 'booking_id','BookingID');
    }
    public function tour() {
        return $this->belongsTo(Tour::class, 'tour_id');
    }
    public function user() {
        return $this->belongsTo(User::class);
    }
}
