<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class PlaceCollection extends Resource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'PlaceID' => $this->PlaceID,
            'PlaceName' => $this->PlaceName
        ];
    }
}
