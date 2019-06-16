<?php

namespace App\Model;

use App\User;
use App\Model\Tour;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $primaryKey = "ReviewID";
    protected $fillable = [
        'Rating', 'Contents', 'spam', 'approve_by','tour_id','user_id'
    ];

    public function tours() {
        return $this->belongsTo(Tour::class, 'tour_id');
    }
    public function users() {
        return $this->belongsTo(User::class, 'user_id');
    }
}
