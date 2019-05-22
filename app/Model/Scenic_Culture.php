<?php

namespace App\Model;

use App\Model\Place;
use App\Model\Scenic_Culture;
use Illuminate\Database\Eloquent\Model;

class Scenic_Culture extends Model
{
    protected $fillable = [
        'place_id', 'Description', 'Contents', 'HitCount', 'ImgUrl', 'state'
    ];
    public $timestamp = false;
    protected $primaryKey = "ScenicID";
    public function place() {
        return $this->belongsTo(Place::class, 'place_id');
    }
    public function tours() {
        return $this->belongsToMany('App\Model\Tour');
    }
}
