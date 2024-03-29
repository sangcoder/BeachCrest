<?php

namespace App\Http\Resources;

use DateTime;
use Carbon\Carbon;
use App\Model\Place;
use Illuminate\Http\Resources\Json\Resource;

class TourCollection extends Resource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    function my_array_unique($array, $keep_key_assoc = false){
        $duplicate_keys = array();
        $tmp = array();       
    
        foreach ($array as $key => $val){
            // convert objects to arrays, in_array() does not support objects
            if (is_object($val))
                $val = (array)$val;
    
            if (!in_array($val, $tmp))
                $tmp[] = $val;
            else
                $duplicate_keys[] = $key;
        }
    
        foreach ($duplicate_keys as $key)
            unset($array[$key]);
    
        return $keep_key_assoc ? $array : array_values($array);
    }
    public function toArray($request)
    {
        // return parent::toArray($request);
        $promotion = 0;
        $ExpiredDate = "";
        foreach ( $this->promotions as  $item) {
            if(strtotime($item->pivot->ExpiredDate) > strtotime(Carbon::now())) {
                $promotion = $item->pivot->Discount;
                $ExpiredDate = $item->pivot->ExpiredDate;
            } else {
                $promotion = 0;
            }
        }
        // dd(strtotime(Carbon::now()), strtotime('2019-05-24 22:27:00'));
        $date1 = new DateTime($this->DateDeparture);
        $date2 = new DateTime($this->DateBack);
        $numberOfNights= $date1->diff($date2)->format("%a");
        $newSchedule = array();

        $listPlace = array();
        foreach($this->scenics as $scenic) {
            $place = Place::find($scenic->place_id);
            array_push($listPlace, [
                'PlaceID' => $place->PlaceID,
                'PlaceName' => $place->PlaceName,
                ]);
            }
            $placeUnique = $this->my_array_unique($listPlace);
            
        foreach($this->schedules->guiders as $item) {
            array_push($newSchedule, [
                'GuiderName' => $item->GuiderName,
                'StartTime' => $item->pivot->StartTime,
                'EndTime' => $item->pivot->EndTime,
                'Contents' => $item->pivot->Contents
            ]);
        }
        // Số người còn lại của Tour
        $totalNum = 0;
        foreach($this->bookings as $num) {
            // dd($num);
            $totalNum += $num->NumberPerson;
        } 

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
            'ScheduleId' => $this->schedule_id,
            'Discount' => $promotion,
            'ExpiredDate' => $ExpiredDate,
            'TourExists' => ($this->NumberPerson - $totalNum) >= 0 ? $this->NumberPerson - $totalNum : 0,
            'OnsaleAdult' => round((1 - $promotion/ 100) * $this->PriceAdult,2),
            'OnsaleKid' => round((1 - $promotion/ 100) * $this->PriceKid,2),
            'Cultures' => CultureResouce::collection($this->scenics),
            'listPlace' => $placeUnique,
            'TourTime' => $numberOfNights == 0 ? $numberOfNights + 1 .' ngày' : $numberOfNights + 1 .' ngày '. $numberOfNights.' đêm',
            'Rating' => [
                'NumberRating' =>  $this->reviews->count() > 0 ? floor(($this->reviews->sum('Rating') / $this->reviews->count()) * 2) / 2 : 0,
                'Count' => $this->countReview,
                'NumberReview' => $this->reviews->count(),
            ],
            'href' => [
                'reviews' => route('reviews.index', $this->TourID)
            ]
        ];
    }
}
