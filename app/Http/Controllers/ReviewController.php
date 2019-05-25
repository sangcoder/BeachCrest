<?php

namespace App\Http\Controllers;

use App\Model\Tour;
use App\Model\Review;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Http\Resources\ReviewSource;
use App\Http\Resources\ReviewCollection;

class ReviewController extends Controller
{
    public function __construct () {
        $this->middleware('jwt.auth')->except(['getAll','index']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    // Get all review on tour
    public function index(Tour $tour)
    {
        return ReviewCollection::collection($tour->reviews);
    }

    public function getAll (Request $request) {
        $query = (new Review)->newQuery();
        if($request->exists('type')) {
            if ($request->type == 'all') {
                $result = ReviewSource::collection($query->orderBy('created_at', 'desc')->paginate(10));
            }
            if ($request->type == 'spam') {
                $review = $query->whereNull('approve_by')->orderBy('created_at', 'desc')->paginate(10);
                $result =  ReviewSource::collection($review);
            }
            if ($request->type == 'approved') {
                $review = $query->where('approve_by', '<>', 'NULL')->orderBy('created_at', 'desc')->paginate(10);
                $result = ReviewSource::collection($review);
            }
        } else {
            $result = ReviewSource::collection($query->orderBy('created_at', 'desc')->paginate(10));
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function show(Review $review)
    {
        //
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Review $review)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function destroy(Review $review)
    {
        $review->delete();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }
}
