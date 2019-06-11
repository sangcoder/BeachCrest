<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Customers extends Model
{
  protected $primaryKey = "CustomerID";
  protected $fillable = [
    'CustomerName', 'Birthday', 'Gender', 'Address', 'CustomerType', 'booking_id', 'delegatePerson', 'Email', 'PhoneNumber'
  ];
    public function bookings() {
        return $this->belongsTo('App\Model\Booking', 'booking_id');
      }
}
