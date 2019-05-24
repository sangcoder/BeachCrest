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
            if(strtotime($item->pivot->ExpiredDate) > strtotime(Carbon::now())) {
                $promotion = $item->pivot->Discount;
            } else {
                $promotion = 0;
            }
        }
        // dd(strtotime(Carbon::now()), strtotime('2019-05-24 22:27:00'));
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
            'TourTime' => $numberOfNights + 1 .' ngày '. $numberOfNights.' đêm',
            'Rating' => $this->reviews->count() > 0 ? round($this->reviews->sum('Rating') / $this->reviews->count(), 1) : 'Không có review nào',
            'NumberReview' => $this->reviews->count(),
            'Schedule' => $this->schedules->guiders->count() > 0 ? $this->schedules->guiders : 'Chưa có lịch trình cho Tour này!',
            'href' => [
                'views' => route('reviews.index', $this->TourID)
            ]
        ];
    }
}
