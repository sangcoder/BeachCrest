<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\Resource;

class SchedulesCollection extends Resource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        return [
            'id' => $this->id,
            'Contents'=> $this->Contents,
            'created_at' => Carbon::parse($this->created_at),
            'updated_at' => Carbon::parse($this->updated_at)
        ];
    }
}
