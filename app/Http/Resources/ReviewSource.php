<?php

namespace App\Http\Resources;

use App\User;
use Illuminate\Http\Resources\Json\Resource;

class ReviewSource extends Resource
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
        $user = User::find($this->approve_by);
        if (isset($user)) {
            $userName =$user->name;
        } else {
          $isFalse = false;
        }
        
        return [
            'ReviewID' => $this->ReviewID,
            'Rating' => $this->Rating,
            'spam' => $this->spam,
            'Contents' => $this->Contents,
            'created_at' => $this->created_at,
            'ApproveBy' => isset($this->approve_by) ? $userName: $isFalse,
            'user' => [
                'id' => $this->users->id,
                'name' => $this->users->name,
                'photo' => $this->users->photo  
            ],
            'tour' => [
                'TourID' => $this->tours->TourID,
                'TourName' => $this->tours->TourName
            ]
        ];
    }
}
