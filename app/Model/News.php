<?php

namespace App\Model;

use App\User;
use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $primaryKey = "NewsID";
    protected $fillable = [
        'Title', 'Contents', 'ImgUrl', 'Contents','State','user_id'
    ];
    public function user() {
        return $this->belongsTo(User::class, 'user_id');
    }
}
