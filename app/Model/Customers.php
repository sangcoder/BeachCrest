<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Customers extends Model
{
    public function bookings() {
        return $this->belongsTo('App\Model\Booking');
      }
}
