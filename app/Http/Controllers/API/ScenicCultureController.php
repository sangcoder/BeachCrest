<?php

namespace App\Http\Controllers\API;

use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Model\Scenic_Culture;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\CultureResouce;

class ScenicCultureController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = DB::table('scenic__cultures')
            ->join('places', 'place_id', '=','PlaceID')
            ->select('ScenicID','scenic__cultures.ScenicName','scenic__cultures.Description','scenic__cultures.Contents','scenic__cultures.ImgUrl','State','PlaceName','scenic__cultures.created_at');
        if ($request->exists('sortById') && $request->sortById == 'ascend') {
            $query->orderBy('ScenicID', 'asc');
        }
        if ($request->exists('sortById') && $request->sortById == 'descend') {
            $query->orderBy('ScenicID', 'desc');
        }
        if ($request->exists('filterLastest') && $request->filterLastest == 'lastest') {
            $query->orderBy('scenic__cultures.created_at', 'asc');
        }
        if ($request->exists('filterOldest') && $request->sortById == 'oldest') {
            $query->orderBy('scenic__cultures.created_at', 'desc');
        }

        $result = $query->paginate(10);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $result
        ]);
    }
    
    public function getListTourValue() {
        $culture = Scenic_Culture::all();
        return CultureResouce::collection(Scenic_Culture::all());
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
     * @param  \App\Model\Scenic_Culture  $scenic_Culture
     * @return \Illuminate\Http\Response
     */
    public function show(Scenic_Culture $culture)
    {
        return $culture;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Scenic_Culture  $scenic_Culture
     * @return \Illuminate\Http\Response
     */
    public function edit(Scenic_Culture $culture)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Scenic_Culture  $scenic_Culture
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Scenic_Culture $culture)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Scenic_Culture  $scenic_Culture
     * @return \Illuminate\Http\Response
     */
    public function destroy(Scenic_Culture $culture)
    {
        //
    }
}
