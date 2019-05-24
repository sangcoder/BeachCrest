<?php

namespace App\Http\Controllers;

use Validator;
use Carbon\Carbon;
use App\Http\AppResponse;
use App\Model\TourGuider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TourGuiderController extends Controller
{
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
        // $tourguider = TourGuider::paginate(10);
        $guider = (new TourGuider)->newQuery();
        if ($request->exists('guiderid') && $request->guiderid == 'ascend') {
            $guider->orderBy('GuiderID', 'asc');
        }
        if ($request->exists('guiderid') && $request->guiderid == 'descend') {
            $guider->orderBy('GuiderID', 'desc');
        }
        
        if ($request->exists('Gender')) {
            $guider->where('Gender', $request->Gender);
        }
        if ($request->exists('type') && $request->type == 'all') {
            $result = $guider->get();
        } else {
            $result = $guider->paginate(10);
        }
        // dd($request->all());
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $result
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
        $validator = Validator::make($request->all(), [
            'GuiderName' => 'required|string',
            'PhoneNumner' => 'required',
            'Address' => 'required'
        ]);
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ],AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        if($request->ImgUrl && $this->testBase($request->ImgUrl)) {
            $imageName = preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$request->ImgUrl,$matched);
            $ext = isset($matched[1][0]) ? $matched[1][0] : false;
            $imageName = sha1(time()) . '.' .$ext;
            \Image::make($request->ImgUrl)->save(public_path().'/images/place/'.$imageName);

            $guider = new TourGuider([
                'Address' => $request->Address,
                'Birthday' => Carbon::parse($request->Birthday),
                'GuiderName' => $request->GuiderName,
                'PhoneNumner' => $request->PhoneNumner,
                'ImgUrl' => $imageName,
                'Gender' => $request->Gender
            ]);
        }
        else {
            return 'Image Error';
        }
        $guider->save();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $guider
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\TourGuider  $tourGuider
     * @return \Illuminate\Http\Response
     */
    public function show(TourGuider $tourguider)
    {
        return $tourguider;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\TourGuider  $tourGuider
     * @return \Illuminate\Http\Response
     */
    public function edit(TourGuider $tourguider)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\TourGuider  $tourGuider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TourGuider $tourguider)
    {
        $validator = Validator::make($request->all(), [
            'GuiderName' => 'required|string',
            'PhoneNumner' => 'required',
            'Address' => 'required'
        ]);
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ],AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }

        if($request->ImgUrl && $this->testBase($request->ImgUrl)) {
            $imageName = preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$request->ImgUrl,$matched);
            $ext = isset($matched[1][0]) ? $matched[1][0] : false;
            $imageName = sha1(time()) . '.' .$ext;
            \Image::make($request->ImgUrl)->save(public_path().'/images/place/'.$imageName);

            $tourguider->update([
                'Address' => $request->Address,
                'Birthday' => Carbon::parse($request->Birthday),
                'Gender' => $request->Gender,
                'GuiderName' => $request->GuiderName,
                'ImgUrl' => $imageName
            ]);
        }
        else {
            $tourguider->update([
                'Address' => $request->Address,
                'Birthday' => Carbon::parse($request->Birthday),
                'Gender' => $request->Gender,
                'GuiderName' => $request->GuiderName,
                'ImgUrl' => $request->ImgUrl
            ]);
        }
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $tourguider
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\TourGuider  $tourGuider
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        DB::table('tour_guiders')->where('GuiderID', $id)->delete();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ],AppResponse::HTTP_OK);
    }

    public function removeMore(Request $request) {
        // dd($request->all());
        if($request->ids) {
            foreach($request->ids as $idGuider) {
                DB::table('tour_guiders')->where('GuiderID', $idGuider)->delete();
            }
        }
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ], AppResponse::HTTP_OK);
    }
}
