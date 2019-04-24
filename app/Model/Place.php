<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Place extends Model
{
    protected $fillable = [
        'PlaceName', 'Description', 'Contents', 'Region', 'ImgUrl'
    ];
    public $timestamp = false;
    protected $primaryKey = "PlaceID";

    public function scenicCultures() {
        return $this->hasMany(Scenic_Culture::class,  'place_id');
    }
}
