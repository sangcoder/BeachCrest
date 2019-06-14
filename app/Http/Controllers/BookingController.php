<?php

namespace App\Http\Controllers;

use Validator;
use Carbon\Carbon;
use App\Model\Tour;
use App\Model\Booking;
use App\Model\Payment;
use GuzzleHttp\Client;
use App\Model\Customers;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Http\Resources\BookingResource;

class BookingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $booking = (new Booking)->newQuery();

        return BookingResource::Collection($booking->paginate(10));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function show(Booking $booking, Request $request)
    {
        if ($request->exists('delegate')) {
            $delegate = $booking->customers()->where('delegatePerson', '=', 1)->get();
            return $delegate;
        }
        else {
            $delegate = $booking->customers()->where('delegatePerson', '!=', 1)->get();
            return $delegate;
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function edit(Booking $booking)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Booking $booking)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function destroy(Booking $booking)
    {
        //
    }

    public function Booking(Request $request) {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'infoContact.FullName' => 'required|min:3',
            'infoContact.Email' => 'required|email',
            'infoContact.PhoneNumber' => 'required|regex:/[0-9]{9}/',
            'infoContact.Address' => 'required',
            'listCustomer.0.*.NameCustomner' => 'required',
            'listCustomer.0.*.Gender' => 'required',
            'listCustomer.0.*.BirthDay' => 'required|olderThan:16',
            'listCustomer.1.*.NameCustomner' => 'required',
            'listCustomer.1.*.Gender' => 'required',
            'listCustomer.1.*.BirthDay' => 'required|smallerThan:16|olderThan:6'
        ]);
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors() 
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        // dd('pass');
        // Tính tổng số người
        $NumberPersion = 0;
        foreach($request->listCustomer as $customer) {
            $NumberPersion += sizeof($customer);
        }
        $user = auth()->user();
        // dd($user->id);
        // create a new Booking
        $booking = new Booking([
            'NumberPerson' => $NumberPersion,
            'DateBooking' => Carbon::now(),
            'Note' => $request->infoContact['Note'],
            'user_id' => $user->id,
            'tour_id' => $request->TourID
        ]);
        $booking->save();
        //  Save list Customer
        // Đầu tiên lưu người đại diện
        // dd($request->all());
        $customer = new Customers ([
            'CustomerName' =>  $request->infoContact['FullName'],
            'Email' => $request->infoContact['Email'],
            'Gender' => 0,
            'PhoneNumber' => $request->infoContact['PhoneNumber'],
            'Address' => $request->infoContact['Address'],
            'CustomerType' => 0,
            'booking_id' => $booking->BookingID,
            'state' => 0,
            'delegatePerson' => true
        ]);
        $customer->save();
        // Lưu danh sách customer vào
        foreach($request->listCustomer as $customer) {
            foreach ($customer as $list) {
                $listCustomer = new Customers ([
                    'CustomerName' =>  $list['NameCustomner'],
                    'Gender' => $list['Gender'],
                    'Birthday' => $list['BirthDay'],
                    'Address' => $request->infoContact['Address'],
                    'CustomerType' => $list['CustomType'] == 'adult' ? 1 : 0,
                    'booking_id' => $booking->BookingID,
                    'state' => 0
                ]);
                $listCustomer->save();
            }
        }
        // dd($request->all());
        // $bk = Booking::find($booking->BookingID);
        $infoCotact = $booking->customers()->where('delegatePerson', '=', 1)->get();
        $listCustomer = $booking->customers()->where('delegatePerson', '<>', 1)->get();
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
        $Numberkid = $booking->customers()->where('delegatePerson', '<>', 1)->where('CustomerType', '=', 0)->get()->count();
        $numberAdult = $booking->customers()->where('delegatePerson', '<>', 1)->where('CustomerType', '=', 1)->get()->count();
        $priceAdult = round((1 - $promotion/ 100) * $tour->PriceAdult,2);
        $PriceKid = round((1 - $promotion/ 100) * $tour->PriceKid,2);

        $TotalAmout = $Numberkid * round($PriceKid/23000, 2) + round($priceAdult/23000, 2) * $numberAdult;
        $AmountVND =  ($Numberkid * $PriceKid) + ($numberAdult * $priceAdult);
        // dd($AmountVND,  $Numberkid, $PriceKid, $numberAdult, $numberAdult);
        $data = array();
        foreach($listCustomer as $item)
        {
            array_push($data, [
                'sku' => $item->CustomerID,
                'name'=> $item->CustomerName,
                'description' => $item->CustomerType == 1 ? 'Người lớn' : 'Trẻ nhỏ',
                'quantity' => 1,
                'price' => $item->CustomerType == 1 ? round($priceAdult/23000, 2) : round($PriceKid/23000, 2),
                'currency'=> 'USD'
                ]);
        }

        // Save payment
        $payment = new Payment;
        $payment->PaymentAmount = $AmountVND; 
        $payment->PaymentDate = Carbon::now();
        $payment->PaymentType = 1;  // 1 thanh toán tại văn phòng / thanh toán paypal 2
        $booking->payment()->save($payment);

        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'infoContact' => $infoCotact,
            'listCustomer' => $listCustomer,
            'listPaypal' => $data,
            'TotalAmount' => round($TotalAmout, 2),
            'AmountVND' => $AmountVND,
            'infoBooking' => [
                'BookingID' => $booking->BookingID,
                'NumberPerson' => $booking->NumberPerson,
                'DateBooking' => $booking->DateBooking,
                'Note' => $booking->Note,
                'user_id' => $booking->user_id,
                'tour' => $booking->tour->TourName
            ]
            // 'listCustomer' => $booking->customers
        ]);
    }
    public function addPaymentPaypals () {

    }
    public function getRateDolar (Request $req) {
        // dd($req['currencyName']);
        $client = new Client;
        $results = $client->request('GET', 'https://www.vietcombank.com.vn/exchangerates/ExrateXML.aspx');
        $xml = simplexml_load_string($results->getBody(),'SimpleXMLElement',LIBXML_NOCDATA);
        $json = json_encode($xml);
        $array = json_decode($json, true);
        // $array_dot = array_dot($array);
        $collection = collect($array);
        $data =  array();
        if ($req->exists('currencyName')) {
            foreach($collection['Exrate'] as $rate) {
                foreach($rate as $item) {
                    if ($item['CurrencyCode'] == $req['currencyName']) {
                        array_push($data, [
                            'CurrencyCode' => $item['CurrencyCode'],
                            'Rate' => $item['Buy'],
                            'TimeUpdate' => $collection['DateTime']
                        ]);
                        break;
                    }
                }
            }
        } else {
            foreach($collection['Exrate'] as $rate) {
                foreach($rate as $item) {
                    if ($item['CurrencyCode'] == 'USD') {
                        array_push($data, [
                            'CurrencyCode' => $item['CurrencyCode'],
                            'Rate' => $item['Buy'],
                            'TimeUpdate' => $collection['DateTime']
                        ]);
                        break;
                    }
                }
            }
        }
        // dump($collection);

        return $data[0];
    }
}
