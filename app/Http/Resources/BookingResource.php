<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class BookingResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        return [
            'BookingID' => $this->BookingID,
            'NumberPerson' => $this->NumberPerson,
            'DateBooking' => $this->DateBooking,
            'Note' => $this->Note,
            'State' => $this->State,
            'byTour' => $this->tour
        ];
    }
}
