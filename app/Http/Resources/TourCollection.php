<?php

namespace App\Http\Resources;

use DateTime;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\Resource;

class TourCollection extends Resource
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
        $promotion = 0;
        foreach ( $this->promotions as  $item) {
            if(strtotime($item->pivot->ExpiredDate) < strtotime(Carbon::now())) {
                $promotion = 0;
            } else {
                $promotion = $item->pivot->Discount;
            }
        }
        $date1 = new DateTime($this->DateDeparture);
        $date2 = new DateTime($this->DateBack);
        $numberOfNights= $date1->diff($date2)->format("%a"); 
        return [
            'TourID' => $this->TourID,
            'TourName' => $this->TourName,
            'TourDescription' => $this->TourDescription,
            'DateDeparture' =>$this->DateDeparture,
            'DateBack' => $this->DateBack,
            'Note' => $this->Note,
            'ImageUrl' => $this->ImageUrl,
            'NumberPerson' => $this->NumberPerson,
            'PriceAdult' => $this->PriceAdult,
            'PriceKid' => $this->PriceKid,
            'Unit' => $this->Unit,
            'Discount' => $promotion,
            'TourTime' => $numberOfNights + 1 .' ngày '. $numberOfNights.' đêm'
        ];
    }
}
