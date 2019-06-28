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
use App\Http\Requests\BookingRequest;
use App\Http\Resources\BookingResource;
use App\Http\Resources\PaymentResource;
use App\Http\Resources\BookingMemberResource;
use GuzzleHttp\Exception\RequestException;

class BookingController extends Controller
{
    public function __construct () {
        $this->middleware('jwt.auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request )
    {
        $booking = (new Booking)->newQuery();
        if($request->exists('type')) {
            if ($request->type == 'all') {
                $result = BookingResource::collection($booking->orderBy('created_at', 'desc')->paginate(10));
            }
            if ($request->type == 'inprocess') {
                $listbooking = $booking->whereNull('approved_by')->orderBy('created_at', 'desc')->paginate(10);
                $result =  BookingResource::collection($listbooking);
                // dd($review);
            }
            if ($request->type == 'nonprocess') {
                $listbooking = $booking->where('approved_by', '<>', 'NULL')->orderBy('created_at', 'desc')->paginate(10);
                $result = BookingResource::collection($listbooking);
            }
        } else {
            $result = BookingResource::collection($booking->orderBy('created_at', 'desc')->paginate(10));
        }
        return $result; 
        // return BookingResource::Collection($booking->paginate(10));
    }
    public function statsBookingAll () {
        $query1 = (new Booking)->newQuery();
        $query2 = (new Booking)->newQuery();
        // dd($booking->get());
        $accepted = $query1->where('approved_by', '<>', 'NULL')->count();
        $processing = $query2->whereNull('approved_by')->count();
        return [
            'Accepted' => $accepted,
            'Processing' => $processing
        ];
    }
    // Thống kê Dashboard Member
    public function statMembers() {
        // $booking = (new Booking)->newQuery();
        $user = auth()->user();
        $total = 0;
        $acceptBooking = $user->bookings()->where('approved_by', '<>', 'NULL')->get()->count();
        if ($user) {
            foreach ( $user->bookings as $booking) {
                $total += $booking->payment['PaymentAmount'];
            }
            // dd($total);
            return response()->json([
                'NumberBooking' => $user->bookings()->count(),
                'TotalPrice' => $total,
                'AccepBooking' => $acceptBooking
            ]);
        }
    }
    public function statAdmin () {
        $payment = (new Payment)->newQuery();
        $booking = (new Booking)->newQuery();
        $query2 = (new Booking)->newQuery();
        $datte = Carbon::now();
        $monthCount = $payment->whereMonth('updated_at', '=', $datte->month)->count();
        $monthTotal = $payment->whereMonth('updated_at', '=', $datte->month)->sum('PaymentAmount');
        $monthTotalToday = $payment->whereDate('updated_at', '=', $datte)->sum('PaymentAmount');
        $notAccept = $booking->whereNull('approved_by')->count();
        $totalBooking = $query2->count();

        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => [
                'ThisMonth' => $monthCount,
                'MonthTotal' => $monthTotal,
                'TotalPriceToday' => $monthTotalToday,
                'NotAccept' => $notAccept,
                'TotalBooking' => $totalBooking
            ]
        ]);
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
        }
        else {
            $delegate = $booking->customers()->where('delegatePerson', '!=', 1)->get();
        }
        if ($request->exists('type') && $request->type == 'payment') {
           return new PaymentResource($booking->payment);
        }
        return $delegate;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function destroy(Booking $booking)
    {
        $booking->delete();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }

    public function Booking(BookingRequest $request) {
        // dd($request->all());
/**
 * Trạng thái booking.
 * 1. Chưa thanh toán => Người dùng chọn thanh toán bằng tiền mặt => chuyển khoản hoặc giao dịch trực tiếp,
 *  => nhân viên sẽ hoàn tất thanh toán thông qua trang quản trị
 * 2. Đã thanh toán => Người dùng thanh toán thông qua cổng giao dịch Paypal
 */

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
            'State' => 1,
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
                    'Birthday' => $list['BirthDayFomat'],
                    'Address' => $request->infoContact['Address'],
                    'CustomerType' => $list['CustomType'] == 'adult' ? 1 : 0,
                    'booking_id' => $booking->BookingID
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

        // Get tỷ giá hiện tại
        $rateList = $this->getRateDolar();
        // dd($rateList);
        $TotalAmout = $Numberkid * round($PriceKid/$rateList['Rate'], 2) + round($priceAdult/$rateList['Rate'], 2) * $numberAdult;
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
                'price' => $item->CustomerType == 1 ? round($priceAdult/$rateList['Rate'], 2) : round($PriceKid/$rateList['Rate'], 2),
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
            'infoContact' => $infoCotact[0],
            'listCustomer' => $listCustomer,
            'listPaypal' => $data,
            'TotalAmount' => round($TotalAmout, 2),
            'AmountVND' => $AmountVND,
            'RateList' => $rateList,
            'infoBooking' => [
                'BookingID' => $booking->BookingID,
                'PaymentID' => $booking->payment->id,
                'NumberPerson' => $booking->NumberPerson,
                'DateBooking' => $booking->DateBooking,
                'Note' => $booking->Note,
                'user_id' => $booking->user_id,
                'tour' => $booking->tour->TourName
            ]
            // 'listCustomer' => $booking->customers
        ]);
    }
    public function addPaymentPaypals (Request $request) {
        // dd($request->all());
        $booking = Booking::find($request->BookingID);
        $booking->update([
            'State' => 2
        ]);
        $booking->payment()->update([
            'PaymentType' => 2,
            'PaypalPaymentID' => $request->PaymentPaypalID
        ]);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }
    public function getRateDolar () {
        
        /**
         * VietCombank chi cho request 5phus 1 lần request
        */
        // dd($req['currencyName']);
        $arrayData = array();
        $reload = true;
        $fileVCB = public_path().'/cache/_rateVCB.cache';
        $reload = false;
        $currentTime = Carbon::now();
        // dd(strtotime($currentTime), filemtime($fileVCB)-300);
        if (!file_exists($fileVCB)) {
            $reload = true;
        } else if(filemtime($fileVCB) < strtotime($currentTime) - 900) {
            $reload = true;
        }
        if ($reload) {
            // dd('vao');
            $stringRate = "";
            $client = new Client;
            $results = $client->request('GET', 'https://www.vietcombank.com.vn/exchangerates/ExrateXML.aspx');
            $xml = simplexml_load_string($results->getBody(),'SimpleXMLElement',LIBXML_NOCDATA);
            // dd($xml);
            if ($xml) {
                
                $json = json_encode($xml);
                $array = json_decode($json, true);
                // $array_dot = array_dot($array);
                $collection = collect($array);
                foreach($collection['Exrate'] as $rate) {
                    foreach($rate as $item) {
                        if ($item['CurrencyCode'] == 'USD') {
                            array_push($arrayData, [
                                'CurrencyCode' => $item['CurrencyCode'],
                                'Rate' => $item['Buy'],
                                'TimeUpdate' => $collection['DateTime']
                            ]);
                            break;
                        }
                    }
                }
                $stringRate = serialize($arrayData);
                file_put_contents($fileVCB, $stringRate, LOCK_EX);
                // dd($stringRate);
            }
        } else {
            $stringRate = file_get_contents($fileVCB);
            if (!empty($stringRate)) {
                $arrayData = unserialize($stringRate);
                // dd('data',$arrayData);
            }
        }
        $stringRate = file_get_contents($fileVCB);
        // dd($stringRate);
        return $arrayData[0];


    }
    public function acceptBooking (Request $request) {
        $user = auth()->user();
        if ($user) {
            $booking = Booking::find($request->BookingID);
            $booking->update([
                'State' => 2,
                'approved_by' => $user->id
            ]);
        }
        else {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE
            ]);
        }
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }
    public function getBookingMember (Request $request) {
        $user = auth()->user();
        $listBooking = $user->bookings();
        return BookingMemberResource::collection($listBooking->paginate(10));
        // dd($user->bookings);
    }
}
