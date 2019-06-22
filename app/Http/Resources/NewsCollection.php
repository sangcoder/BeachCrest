<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class NewsCollection extends Resource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // dd($this->NewsID);
        return [
            'NewsID' => $this->NewsID,
            'Title' => $this->Title,
            'ImgUrl' => $this->ImgUrl,
            'Contents' => $this->Contents,
            'State' => $this->State,
            'info' => [
                'id' => $this->user->id,
                'name' => $this->user->name,
                'photo' => $this->user->photo
            ],
            'updated' => $this->updated_at
        ];
    }
}
