<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Promotion extends Model
{
    protected $primaryKey = "PromotionID";
    protected $fillable = [
        'Contents'
    ];
    public function tours() {
        return $this->belongsToMany('App\Model\Tour');
    }
}
