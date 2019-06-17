<?php

namespace App\Http\Resources;

use App\User;
use App\Http\Resources\TourBookingResource;
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
        $user = User::find($this->approved_by);
        if (isset($user)) {
            $userName = $user->name;
        } else {
          $isFalse = false;
        }
        return [
            'BookingID' => $this->BookingID,
            'NumberPerson' => $this->NumberPerson,
            'DateBooking' => $this->DateBooking,
            'Note' => $this->Note,
            'State' => $this->State,
            'byTour' => new TourBookingResource($this->tour),
            'approved_by' => isset($this->approved_by) ? $userName: $isFalse
        ];
    }
}
