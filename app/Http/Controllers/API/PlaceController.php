<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Model\Place;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\PlaceCollection;

class PlaceController extends Controller
{
    public function __construct()
    {
        $this->middleware('jwt.auth')->except(['index','getListPlaceValue', 'statsDestination']);
    }
    public function testBase($s)
    {
          return (bool) preg_match('~data:\w+/.*;base64,.*~', $s);
    }
        /**
    * @OA\Get(
    *         path="/api/place",
    *         tags={"Place"},
    *         summary="Get list place",
    *         description="Get list place",
    *         operationId="index",
    *         @OA\Response(
    *             response=200,
    *             description="Thành công"
    *         ),
    *         @OA\Response(
    *             response=500,
    *             description="Server error"
    *         ),
    * )
    */
    /**
     * Định nghĩa theo chuẩn Restful API
     * GET api/place
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        // Phân trang 10 địa điểm trên 1 trang
        $place = Place::paginate(10);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $place
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Ràng buộc dữ liệu
        $validator = Validator::make($request->all(), [
            'PlaceName' => 'required|string|max:150',
            'Description' => 'required|string|max:150',
            'Contents' => 'required'
        ]);
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' =>  $validator->errors()
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }

        if ($request->ImageUrl  && $this->testBase($request->ImageUrl)) {
            $imageName = preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$request->ImageUrl,$matched);
            $ext = isset($matched[1][0]) ? $matched[1][0] : false;
            $imageName = sha1(time()) . '.' .$ext;
            \Image::make($request->ImageUrl)->save(public_path().'/images/place/'.$imageName);
        }
        else {
            return 'Image error';
        }
        $place = new Place([
            'PlaceName' => $request->PlaceName,
            'Description' => $request->Description,
            'Contents' => $request->Contents,
            'ImgUrl' => $imageName,
            'Region' => $request->Region
        ]);
        $place->save();

        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $place
        ]);
    }
    public function getListPlaceValue() {
        return PlaceCollection::collection(Place::all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Place  $place
     * @return \Illuminate\Http\Response
     */
    public function show(Place $place)
    {
        return $place;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Place  $place
     * @return \Illuminate\Http\Response
     */
    public function edit(Place $place)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Place  $place
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Place $place)
    {
        // Ràng buộc dữ liệu
        $validator = Validator::make($request->all(), [
            'PlaceName' => 'required|string',
            'Description' => 'required',
            'Contents' => 'required'
        ]);
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' =>  $validator->errors()
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        if ($request->ImageUrl && $this->testBase($request->ImageUrl)) {
            $imageName = preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$request->ImageUrl,$matched);
            $ext = isset($matched[1][0]) ? $matched[1][0] : false;
            $imageName = sha1(time()) . '.' .$ext;
            \Image::make($request->ImageUrl)->save(public_path().'/images/place/'.$imageName);
            $place->update([
                'Contents' => $request->Contents,
                'Description' => $request->Description,
                'ImgUrl' => $imageName,
                'PlaceName' => $request->PlaceName,
                'Region' => $request->Region
            ]);
        }
        else {
            $place->update([
                'Contents' => $request->Contents,
                'Description' => $request->Description,
                'ImgUrl' => $request->ImageUrl ,
                'PlaceName' => $request->PlaceName,
                'Region' => $request->Region
            ]);
        }

        return response()->json([
            'sucess' => true,
            'data' => $place
        ], 200);


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Place  $place
     * @return \Illuminate\Http\Response
     */
    public function destroy(Place $place)
    {
        $place->delete();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ],AppResponse::HTTP_OK);
    }

    public function statsDestination () {
        $place = DB::table('places')
                ->select(DB::raw('count(*) as number, PlaceName, places.ImgUrl, PlaceID'))
                ->join('scenic__cultures', 'PlaceID', '=', 'place_id')
                ->groupBy('PlaceID')
                ->orderBy('number', 'desc')
                ->take(8)
                ->get();
        return $place;
    }
}
