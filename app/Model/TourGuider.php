<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class TourGuider extends Model
{
    protected $fillable = [
        'GuiderName', 'Birthday', 'Address', 'PhoneNumner', 'ImgUrl'
    ];
    public $timestamp = false;
    protected $primaryKey = "GuiderID";

    // Relationship ORM
}
