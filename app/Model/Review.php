<?php

namespace App\Model;

use App\Model\Tour;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $primaryKey = "ReviewID";
    protected $fillable = [
        'Rating', 'Contents', 'spam'
    ];

    public function tours() {
        return $this->belongsTo(Tour::class, 'tour_id');
    }
}
