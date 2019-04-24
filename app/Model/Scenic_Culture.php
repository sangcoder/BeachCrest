<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Scenic_Culture extends Model
{
    protected $fillable = [
        'PlaceID', 'Description', 'Contents', 'HitCount', 'ImgUrl', 'state'
    ];
    public $timestamp = false;
    public function place() {
        return $this->belongsTo(Place::class);
    }
}
