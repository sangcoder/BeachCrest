<?php

namespace App\Http\Controllers\API;

use App\Model\Place;
use Validator;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PlaceController extends Controller
{
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
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $product = Place::paginate(10);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $product
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
}
