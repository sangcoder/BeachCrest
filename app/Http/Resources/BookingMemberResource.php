<?php

namespace App\Http\Resources;

use App\User;
use Illuminate\Http\Resources\Json\Resource;

class BookingMemberResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
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
            'updated_at' => $this->updated_at,
            'infoTour' => [
                'id' => $this->tour_id,
                'name' => $this->tour->TourName
            ],
            'infoMember' => [
                'id' => $this->user_id,
                'name' => $this->user->name
            ],
            'infoStaff' => [
                'name' => isset($this->approved_by) ? $userName: $isFalse,
            ]
        ];
    }
}
