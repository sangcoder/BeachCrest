<?php

namespace App\Http\Resources;

use DateTime;
use Illuminate\Http\Resources\Json\Resource;

class TourBookingResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $date1 = new DateTime($this->DateDeparture);
        $date2 = new DateTime($this->DateBack);
        $numberOfNights= $date1->diff($date2)->format("%a");
        return [
            'TourName' => $this->TourName,
            'TourTime' => $numberOfNights == 0 ? $numberOfNights + 1 .' ngày' : $numberOfNights + 1 .' ngày '. $numberOfNights.' đêm',
            'Image' => $this->ImageUrl
        ];
    }
}
