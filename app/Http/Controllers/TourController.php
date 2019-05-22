<?php

namespace App\Http\Controllers;

use Validator;
use Carbon\Carbon;
use App\Model\Tour;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Http\Resources\TourCollection;

class TourController extends Controller
{
    public function __construct()
    {
        $this->middleware('jwt.auth')->except('index');
    }
    public function testBase($s)
    {
          return (bool) preg_match('~data:\w+/.*;base64,.*~', $s);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // $tour = Tour::paginate(10);
        // dd($tour);
        // dd($request);
        $tour = (new Tour)->newQuery();
        if ($request->exists('orderById') && $request->orderById == 'ascend') {
            $tour->orderBy('TourID', 'asc');
        }
        if ($request->exists('orderById') && $request->orderById == 'descend') {
            $tour->orderBy('TourID', 'desc');
        }
        if($request->exists('orderByDeparture') && $request->orderByDeparture[0] == 'lastest') {
            $tour->orderBy('DateDeparture','desc');
        }
        if($request->exists('orderByDeparture') && $request->orderByDeparture[0] == 'oldest') {
            $tour->orderBy('DateDeparture','asc');
        }
        if($request->exists('pageresult')){
            $result = TourCollection::collection($tour->paginate($request->pageresult));

        } else {
            // $result = $tour->paginate(10);
            $result = TourCollection::collection($tour->paginate(10));
        }
        return $result;

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->all());
        // validate
        $validator = Validator::make($request->all(), [
            'TourName' => 'required|string',
            'TourDescription' => 'required|string',
            'DateDeparture' => 'required',
            'DateBack' => 'required',
            'NumberPerson' => 'required',
            'PriceAdult' => 'required',
            'PriceKid' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ],AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        $listImage = array();
        if($request->ImageUrl) {
            // dd($request->ImageUrl);
            foreach ($request->ImageUrl as $imgbase) {
                if($imgbase['thumbUrl'] && $this->testBase($imgbase['thumbUrl'])) {
                    $imageName = preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$imgbase['thumbUrl'],$matched);
                    $ext = isset($matched[1][0]) ? $matched[1][0] : false;
                    $imageName = sha1(time()) . '.' .$ext;
                    \Image::make($imgbase['thumbUrl'])->save(public_path().'/images/tour/'.$imageName);
                    array_push($listImage, $imageName);
                }
            }
        }
        // dd(json_encode($listImage));
        // Save to data base
        $tour = new Tour([
            'TourName' => $request->TourName,
            'TourDescription' => $request->TourDescription,
            'DateDeparture' => Carbon::parse($request->DateDeparture),
            'DateBack' => Carbon::parse($request->DateBack),
            'Note' => $request->Note,
            'ImageUrl' => json_encode($listImage),
            'NumberPerson' => $request->NumberPerson,
            'PriceAdult' => $request->PriceAdult,
            'PriceKid' => $request->PriceKid,
            'Unit' => $request->Unit
        ]);
        $tour->save();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $tour
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Tour  $tour
     * @return \Illuminate\Http\Response
     */
    public function show(Tour $tour)
    {
        //
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Tour  $tour
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tour $tour)
    {
        $validator = Validator::make($request->all(), [
            'TourName' => 'required|string',
            'TourDescription' => 'required|string',
            'DateDeparture' => 'required',
            'DateBack' => 'required',
            'NumberPerson' => 'required',
            'PriceAdult' => 'required',
            'PriceKid' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ],AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        $listImage = array();
        if($request->ImageUrl) {
            for($i = 0; $i < count($request->ImageUrl) ; $i++) {
                if($request->ImageUrl[$i] && $this->testBase($request->ImageUrl[$i]['thumbUrl'])) {
                    $imageName = preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$request->ImageUrl[$i]['thumbUrl'],$matched);
                    $ext = isset($matched[1][0]) ? $matched[1][0] : false;
                    $imageName = sha1(time()) . '.' .$ext;
                    \Image::make($request->ImageUrl[$i]['thumbUrl'])->save(public_path().'/images/tour/'.$imageName);
                    array_push($listImage, $imageName);
                } else {
                    $imgpath = explode('/', $request->ImageUrl[$i]['thumbUrl']); 
                    array_push($listImage,end($imgpath));
                }

            }
        }
            $tour->update([
                'TourName' => $request->TourName,
                'TourDescription' =>$request->TourDescription,
                'DateDeparture' =>$request->DateDeparture,
                'DateBack' => $request->DateBack,
                'Note' => $request->Note,
                'ImageUrl' => json_encode($listImage),
                'NumberPerson' => $request->NumberPerson,
                'PriceAdult' => $request->PriceAdult,
                'PriceKid' => $request->PriceKid,
                'Unit' => $request->Unit
            ]);
        
        // Save to data base

        $tour->save();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $tour
        ]);
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Tour  $tour
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tour $tour)
    {
        $tour->delete();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }

    // Them khuyen mai cho tour
    public function addPromotion (Request $request) {
        $tour = Tour::find($request->TourID);
        // dd($request->all());
        $tour->promotions()->syncWithoutDetaching([
            $request->PromotionID => [
                'Discount' => $request->Discount,
                'ExpiredDate' => $request->ExpriedDate
            ]

        ]);
        // dd($tour->promotions[0]->pivot->Discount);
    }

}
