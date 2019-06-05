<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class CultureResouce extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'name' => $this->ScenicName,
            'value' => $this->ScenicID
        ];
    }
}
