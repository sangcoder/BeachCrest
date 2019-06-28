<?php

namespace App\Http\Controllers;

use stdClass;
use Validator;
use Carbon\Carbon;
use App\Model\Tour;
use App\Model\Place;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\TourResource;
use App\Http\Resources\TourCollection;
use Illuminate\Pagination\LengthAwarePaginator;
use App\Http\Resources\BookingResource;

class TourController extends Controller
{
    public function __construct()
    {
        $this->middleware('jwt.auth')->except(['index', 'show','findTour']);
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
        if ($request->exists('type') && $request->type == 'promotion') {
            // dd($pro);
            $pro = DB::table('tours')->join('promotion_tour', 'promotion_tour.tour_id', '=', 'tours.TourID')
            ->get();
            $arrayPromotion = array();
            foreach ( $pro as  $item) {
                if(strtotime($item->ExpiredDate) > strtotime(Carbon::now())) {
                    array_push($arrayPromotion, $item);
                } 
            }
            return  array_slice($arrayPromotion, 0, 5, true);

        }
        if($request->exists('pageresult')){
            $result = TourCollection::collection($tour->paginate($request->pageresult));

        } else {
            // $result = $tour->paginate(10);
            $result = TourCollection::collection($tour->orderBy('updated_at', 'desc')->paginate(8));
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
            'Unit' => $request->Unit,
            'schedule_id' => $request->ScheduleId
        ]);
        // dd($tour, $request->all());
        $arrayCultures = array();
        foreach ($request->ListCultures as $cultureId) {
            array_push($arrayCultures, $cultureId['value']);
        }
        // dd();
        $tour->save();
        $tour->scenics()->sync($arrayCultures);
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
        // dd($tour->first());
        // $t = Tour::find($tour->TourID);
        // return $tour;
        // dd($t);
        return new TourResource($tour);
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
                'Unit' => $request->Unit,
                'schedule_id' => $request->ScheduleId
            ]);
        
        // Save to data base
        $arrayCultures = array();
        foreach ($request->ListCultures as $cultureId) {
            array_push($arrayCultures, $cultureId['value']);
        }
        $tour->save();
        $tour->scenics()->sync($arrayCultures);
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
        $tour->promotions()->sync([
            $request->PromotionID => [
                'Discount' => $request->Discount,
                'ExpiredDate' => $request->ExpriedDate
            ]

        ]);
        // dd($tour->promotions[0]->pivot->Discount);
    }

    function my_array_unique($array, $keep_key_assoc = false){
        $duplicate_keys = array();
        $tmp = array();       
    
        foreach ($array as $key => $val){
            // convert objects to arrays, in_array() does not support objects
            if (is_object($val))
                $val = (array)$val;
    
            if (!in_array($val, $tmp))
                $tmp[] = $val;
            else
                $duplicate_keys[] = $key;
        }
    
        foreach ($duplicate_keys as $key)
            unset($array[$key]);
    
        return $keep_key_assoc ? $array : array_values($array);
    }
    function unique_multidim_array($array, $key) { 
        $temp_array = array(); 
        $i = 0; 
        $key_array = array(); 
        
        foreach($array as $val) { 
            if (!in_array($val[$key], $key_array)) { 
                $key_array[$i] = $val[$key]; 
                $temp_array[$i] = $val; 
            } 
            $i++; 
        } 
        return $temp_array; 
      }
    public function findTour (Request $request) {
        // dd($request->all());
        $tour = (new Tour)->newQuery();
        if ($request->exists('q')) {
            $result = $tour->where('TourName', 'LIKE', '%'.$request->q.'%');
            return TourCollection::collection($result->paginate(10));
        }
        if ($request->exists('dateDeparture') && isset($request->dateDeparture[0])) {
            // dd('bay');
            $tour->whereBetween('DateDeparture', [$request->dateDeparture[0], $request->dateDeparture[1]]);

            if($request->exists('filters')) {
                // dd('vao');
                $currentPage = LengthAwarePaginator::resolveCurrentPage();
                $tour = $this->filterPrice($tour->get(), $request->filters);
                // dd($tour);
                $perPage = 10;
                $currentPageItems = $tour->slice(($currentPage * $perPage) - $perPage, $perPage)->all();
                $paginatedItems= new LengthAwarePaginator($currentPageItems , count($tour), $perPage);
                $paginatedItems->setPath($request->url());
                $tour = TourCollection::collection($paginatedItems);
            } 
            // dd($tour->get());
        } 

        if ($request->exists('diemden') && $request->diemden != -1) {
            // dd('vao');
            if (isset($request->dateDeparture[0])) {
                $place = Place::find($request->diemden);
                $arrayTour = array();
                // dd($place->scenicCultures);
                foreach($place->scenicCultures as $scenic) {
                    // array_push($arrayScenic, $scenic->tours->TourID);
                    foreach ($scenic->tours as $t) {
                        // dd($t);     
                        array_push($arrayTour, $t);
                    }
                }

                $uniqueTour = $this->unique_multidim_array($arrayTour, 'TourID');
                $currentPage = LengthAwarePaginator::resolveCurrentPage();
                $itemCollection = collect($uniqueTour);
                $itemCollectionfilter =  $itemCollection->whereBetween('DateDeparture', [$request->dateDeparture[0], $request->dateDeparture[1]]);
                if($request->exists('filters')) {
                    // dd('vao');
                    $itemCollectionfilter = $this->filterPrice($itemCollectionfilter, $request->filters);
                } 
                $perPage = 10;
                $currentPageItems = $itemCollectionfilter->slice(($currentPage * $perPage) - $perPage, $perPage)->all();
                $paginatedItems= new LengthAwarePaginator($currentPageItems , count($itemCollectionfilter), $perPage);
                $paginatedItems->setPath($request->url());

                $tour = TourCollection::collection($paginatedItems);
                // dd($tour);

            } else {
                $place = Place::find($request->diemden);
                $arrayTour = array();
                foreach($place->scenicCultures as $scenic) {
                    foreach ($scenic->tours as $t) {
                        array_push($arrayTour, $t);
                    }
                }
                $uniqueTOur = $this->unique_multidim_array($arrayTour, 'TourID');
                $currentPage = LengthAwarePaginator::resolveCurrentPage();
                $itemCollection = collect($uniqueTOur);
                if($request->exists('filters')) {
                    $itemCollection = $this->filterPrice($itemCollection, $request->filters);
                    // dd('day');
                }
                // dd($itemCollection);
                $perPage = 10;
                $currentPageItems = $itemCollection->slice(($currentPage * $perPage) - $perPage, $perPage)->all();
                $paginatedItems= new LengthAwarePaginator($currentPageItems , count($itemCollection), $perPage);
                $paginatedItems->setPath($request->url());
    
                
                $tour = TourCollection::collection($paginatedItems);
            }
            
        } 
        else {
            if($request->exists('filters')) {
                $currentPage = LengthAwarePaginator::resolveCurrentPage();
                // dd('day', $tour->get());
                $tour = $this->filterPrice($tour->get(), $request->filters);
                // dd($tour);
                // dd('xuong');
                $perPage = 10;
                $currentPageItems = $tour->slice(($currentPage * $perPage) - $perPage, $perPage)->all();
                $paginatedItems= new LengthAwarePaginator($currentPageItems , count($tour), $perPage);
                $paginatedItems->setPath($request->url());
                $tour = TourCollection::collection($paginatedItems);
            } else {
                $tour = TourCollection::collection($tour->paginate(10));
            }
        }
        // if ($request->exists('dateDeparture') && empty($request->dateDeparture[0]) && $request->exists('diemden') && $request->diemden != -1) {
        //     $tour = TourCollection::collection($tour->paginate(10));
        //     // dd('ecc');
        // }
        // dd($tour->get());
        return $tour;
        
    }
    public function filterPrice ($filterCollection, $valuePrice) {
        // Duoi 500 nghin
        // dd('khong qua', $valuePrice);
        switch ($valuePrice) {
            case 'small500':
                $filterCollectionDone = $filterCollection->filter(function ($value, $key) {
                    // dd($value);
                    return $this->getPricePromotion($value->TourID) <= 500000;
                });
                break;
            case '500to1000':
                $filterCollectionDone = $filterCollection->filter(function ($value, $key) {
                    return $this->getPricePromotion($value->TourID) > 500000 && $this->getPricePromotion($value->TourID) <= 1000000;
                });
                break;
            case '1000to2000':
                $filterCollectionDone = $filterCollection->filter(function ($value, $key) {
                    return $this->getPricePromotion($value->TourID) > 1000000 && $this->getPricePromotion($value->TourID) <= 2000000;
                });
                break;
            case '2000to5000':
                $filterCollectionDone = $filterCollection->filter(function ($value, $key) {
                    return $this->getPricePromotion($value->TourID) > 2000000 && $this->getPricePromotion($value->TourID) <= 5000000;
                });
                break;
            case 'big5000':
                $filterCollectionDone = $filterCollection->filter(function ($value, $key) {
                    return $this->getPricePromotion($value->TourID) > 5000000;
                });
                break;
            default: 
                return $filterCollection;
                break;
        }
        // dd($filterCollectionDone);
        return $filterCollectionDone;
    }
    public function getPricePromotion ($idTour) {
        $promotion = 0;
        $ExpiredDate = "";
        $tour = Tour::find($idTour);
        foreach ( $tour->promotions as  $item) {
            if(strtotime($item->pivot->ExpiredDate) > strtotime(Carbon::now())) {
                $promotion = $item->pivot->Discount;
                $ExpiredDate = $item->pivot->ExpiredDate;
            } else {
                $promotion = 0;
            }
        }
        return round((1 - $promotion/ 100) * $tour->PriceAdult,2);
    }
}
