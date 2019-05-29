<?php

namespace App\Http\Resources;

use DateTime;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
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
        // $t = DB::table('reviews')
        //     ->selectRaw('Rating, count(*) as Total')
        //     ->rightJoin('tours', 'reviews.tour_id', '=', 'tours.TourID')
        //     ->where('TourID', '=', $this->TourID)
        //     // ->where('tour.TourID', '=', $this->TourID)
        //     ->groupBy('Rating')
        //     ->get();
            $full = array();
            foreach($this->countReview as $rev) {
                array_push($full, [
                    'Rating' => $rev->Rating,
                    'Total' => $rev->total,
                    'percent' => round(($rev->total * 100) / $this->reviews->count(), 2)
                ]);
            }
        // dd($full);
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
            'Onsale' => round((1 - $promotion/ 100) * $this->PriceAdult,2),
            'TourTime' => $numberOfNights == 0 ? $numberOfNights + 1 .' ngày' : $numberOfNights + 1 .' ngày '. $numberOfNights.' đêm',
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
