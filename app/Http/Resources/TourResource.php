<?php

namespace App\Http\Resources;

use DateTime;
use Carbon\Carbon;
use App\Model\Place;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\CultureResouce;
use Illuminate\Http\Resources\Json\JsonResource;

class TourResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
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
        $newSchedule = array();
        foreach($this->schedules->guiders as $item) {
            array_push($newSchedule, [
                'GuiderName' => $item->GuiderName,
                'StartTime' => $item->pivot->StartTime,
                'EndTime' => $item->pivot->EndTime,
                'Contents' => $item->pivot->Contents
            ]);
        }
            $full = array();
            foreach($this->countReview as $rev) {
                array_push($full, [
                    'Rating' => $rev->Rating,
                    'Total' => $rev->total,
                    'percent' => round(($rev->total * 100) / $this->reviews->count(), 2)
                ]);
            }

        // Số người còn lại của Tour
        $totalNum = 0;
        foreach($this->bookings as $num) {
            $totalNum += $num->NumberPerson;
        } 
        $listScenic = array();
        $listPlace = array();
        // Danh sách địa danh
        foreach($this->scenics as $scenic) {
            $place = Place::find($scenic->place_id);
            array_push($listScenic, [
                'Scenic_Name' => $scenic->ScenicName,
                'Scenic_ID' => $scenic->ScenicID,
                'ImgUrl' =>  $scenic->ImgUrl,

            ]);
           array_push($listPlace, [
            'PlaceID' => $place->PlaceID,
            'PlaceName' => $place->PlaceName,
           ]);
        }
        // dd(($this->NumberPerson - $totalNum) <= 0);
        // dd($full);
        return [
            'TourID' => $this->TourID,
            'TourName' => $this->TourName,
            'TourDescription' => $this->TourDescription,
            'DateDeparture' =>$this->DateDeparture,
            'DateBack' => $this->DateBack,
            'Note' => $this->Note,
            'ImageUrl' => $this->ImageUrl,
            // 'NumberPerson' => $this->NumberPerson,
            'PriceAdult' => $this->PriceAdult,
            'PriceKid' => $this->PriceKid,
            'Unit' => $this->Unit,
            'Discount' => $promotion,
            'TourExists' => ($this->NumberPerson - $totalNum) >= 0 ? $this->NumberPerson - $totalNum : 0,
            'listCultures' => $listScenic,
            'listPlace' => $listPlace,
            'OnsaleAdult' => round((1 - $promotion/ 100) * $this->PriceAdult,2),
            'OnsaleKid' => round((1 - $promotion/ 100) * $this->PriceKid,2),
            'TourTime' => $numberOfNights == 0 ? $numberOfNights + 1 .' ngày' : $numberOfNights + 1 .' ngày '. $numberOfNights.' đêm',
            'CultureOfTour' => CultureResouce::collection($this->scenics),
            'Rating' => [
                'NumberRating' =>  $this->reviews->count() > 0 ? floor(($this->reviews->sum('Rating') / $this->reviews->count()) * 2) / 2 : 0,
                'Score' => $full,
                'NumberReview' => $this->reviews->count(),
                'href' => [
                    'reviews' => route('reviews.index', $this->TourID)
                ]
            ],
            'Schedule' => 
            $this->schedules->guiders->count() > 0 ? $newSchedule : 'Chưa có lịch trình cho Tour này!',

        ];    
    }
}
