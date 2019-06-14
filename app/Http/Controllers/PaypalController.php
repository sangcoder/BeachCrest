<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Model\Tour;
use App\Model\Booking;
use Illuminate\Http\Request;
use App\Http\Resources\TourResource;
use App\Services\PayPalService as PayPalSvc;

class PaypalController extends Controller
{
    private $paypalSvc;

    public function  __construct(PayPalSvc $paypalSvc)
    {
        // parent::__construct();

        $this->paypalSvc = $paypalSvc;
    }

    public function checkoutPaypal () {

        $paymentStatus = $this->paypalSvc->getPaymentStatus();
        if ( $paymentStatus) {
            dd('thanh toán thành công', $paymentStatus);
        } else {
            dd('thanh toán thất bại');
        }
    }

    public function index (Request $request) {
        $booking = Booking::find($request->BookingID);
        $listCustomer = $booking->customers()->where('delegatePerson', '<>', 1)->get();
        $tourName = $booking->tour->TourName;
        $tour = Tour::find($booking->tour->TourID);
        $promotion = 0;
        foreach ( $tour->promotions as  $item) {
            if(strtotime($item->pivot->ExpiredDate) > strtotime(Carbon::now())) {
                $promotion = $item->pivot->Discount;
                $ExpiredDate = $item->pivot->ExpiredDate;
            } else {
                $promotion = 0;
            }
        }

        $priceAdult = round((1 - $promotion/ 100) * $tour->PriceAdult,2);
        $PriceKid = round((1 - $promotion/ 100) * $tour->PriceKid,2);

        $data = array();
        foreach($listCustomer as $item)
        {
            array_push($data, [
                'name'=> $item->CustomerName,
                'sku' => $item->CustomerID,
                'quantity' => 1,
                'price' => $item->CustomerType == 1 ? round($priceAdult/23000, 2) : round($PriceKid/23000, 2)
            ]) ;
        }

        // $t = new TourResource($tour);
        // dd($data);
        $transactionDescription = $tourName;

        $paypalCheckoutUrl = $this->paypalSvc
        // ->setCurrency('eur')
        ->setReturnUrl(url('/paypal/status'))
        // ->setCancelUrl(url('paypal/status'))
        ->setItem($data)
        // ->setItem($data[0])
        // ->setItem($data[1])
        ->createPayment($transactionDescription);
        
        if ($paypalCheckoutUrl) {
            // dd($paypalCheckoutUrl);
            return $paypalCheckoutUrl;
        } else {
            dd(['Error']);
        }
    }
}
