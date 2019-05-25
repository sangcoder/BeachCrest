<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class ReviewCollection extends Resource
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
            'ReviewID' => $this->ReviewID,
            'Rating' => $this->Rating,
            'Contents' => $this->Contents,
            'user_id' => $this->user_id,
            'tour_id' => $this->tour_id,
            'created_at' => $this->created_at,

        ];
    }
}
