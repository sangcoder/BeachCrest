<?php

namespace App\Http\Controllers;

use App\Model\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
class PaymentController extends Controller
{
    public function statsByDate (Request $request) {
        // $payment = (new Payment)->newQuery();
        // $payment->whereDate('updated_at', '>=' , $request->Datestat[0]);
        // $payment->whereDate('updated_at', '<=', $request->Datestat[1]);
        // // $payment->whereBetween('updated_at', [$request->Datestat[0], $request->Datestat[1]]);
        // dd($payment->get());
        // return $pay;
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'dateStart' => 'required',
            'dateEnd' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ]);
        }
        $pay = DB::table('payment')
        ->whereDate('payment.updated_at', '>=' , $request->dateStart)
        ->whereDate('payment.updated_at', '<=', $request->dateEnd)
        ->join('bookings', 'booking_id', '=', 'BookingID')
        // ->groupBy('tour_id')
        ->where('bookings.State', '=', 2)
        ->selectRaw('id, booking_id, PaymentAmount, payment.updated_at as updated_at, PaymentType,tour_id')
        ->get();
        // dd($pay->sum('PaymentAmount'));
        return response()->json([
            'data' => $pay,
            'totalAmount' => $pay->sum('PaymentAmount'),
            'numberCount' => $pay->count()
        ]);
    }
}
