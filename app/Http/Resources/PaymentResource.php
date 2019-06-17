<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class PaymentResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'PaymentAmount' => $this->PaymentAmount,
            'PaymentDate' => $this->updated_at,
            'PaymentType' => $this->PaymentType,
            'PaypalPaymentID' => $this->PaypalPaymentID
        ];
    }
}
