<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
  protected $table = 'payment';

  public $timestamps = true;
  protected $fillable = [
    'PaymentAmount', 'booking_id', 'PaymentDate', 'PaymentType'
  ];
    public function booking() {
      return $this->belongsTo('App\Model\Booking','BookingID', 'booking_id');
    }
}
