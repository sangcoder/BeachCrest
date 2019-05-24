<?php

namespace App\Http\Resources;

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
            'StartTime' => $this->StartTime,
            'EndTime' => $this->EndTime,
            'ByGuider' => [
                'GuiderID' => $this->guider->GuiderID,
                'GuiderName' => $this->guider->GuiderName
            ],
            'Contents'=> $this->Contents
        ];
    }
}
