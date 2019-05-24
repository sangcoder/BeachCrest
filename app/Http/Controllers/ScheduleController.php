<?php

namespace App\Http\Controllers;

use App\Model\Schedule;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Http\Resources\SchedulesCollection;
use App\Http\Resources\ScheduleSearchCollection;
use Validator;
class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return SchedulesCollection::collection(Schedule::paginate(10));
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
            'Contents' => 'required|string'
        ]);
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ], ApppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        $schedule = new Schedule([
            'Contents' => $request->Contents
        ]);
        $schedule->save();

        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $schedule
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function show(Schedule $schedule)
    {
        //
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Schedule $schedule)
    {
        $validator = Validator::make($request->all(), [
            'Contents' => 'required|string'
        ]);
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ], ApppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }

        $schedule->update([
            'Contents' => $request->Contents
        ]);

        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $schedule
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function destroy(Schedule $schedule)
    {
        $schedule->delete();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }

    public function findSchedulesById (Request $request) {
        $schedule = (new Schedule)->newQuery();
        if ($request->exists('q')) {
            $schedule->where('id', '=' ,$request->q);
        }
        return ScheduleSearchCollection::collection($schedule->get());
    }
    public function getListGuiderBySchedule($id) {
        $schedule = Schedule::find($id);
        $guider = array();
        foreach ($schedule->guiders as $item) {
            array_push($guider, [
                'GuiderID' => $item->GuiderID,
                'GuiderName' => $item->GuiderName,
                'StartTime' =>$item->pivot->StartTime,
                'EndTime' => $item->pivot->EndTime,
                'Contents' => $item->pivot->Contents
            ]);
        }
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $guider
        ]);
    }
    public function addGuiderToSchedule(Request $request, Schedule $schedule) {
        $schedule->guiders()->syncWithoutDetaching([
            $request->GuiderID => [
                'StartTime' => $request->StartTime,
                'EndTime' => $request->EndTime,
                'Contents' => $request->Contents
            ]

        ]);
    }

    public function deleteGuiderSchedule (Request $request, Schedule $schedule) {
        $schedule->guiders()->detach($request->GuiderID);
    }
}
