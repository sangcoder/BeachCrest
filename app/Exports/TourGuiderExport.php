<?php

namespace App\Exports;

use App\Model\TourGuider;
use Maatwebsite\Excel\Concerns\FromCollection;

class TourGuiderExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        // dd( TourGuider::all());

        return TourGuider::all();
    }
}
