<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Http\Resources\Json\ResourceCollection;

class UserResource extends Resource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'photo' => $this->photo,
            'bio' => $this->bio,
            'roleName' => $this->getRoleNames(),
            'loginWith' => $this->socialNetWork->count() == 1 ? 'Facebook' : 'Normal',
            'active' =>$this->active,
            'created_at' =>  $this->created_at
        ];
    }
}
