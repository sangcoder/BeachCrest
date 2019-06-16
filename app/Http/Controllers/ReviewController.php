<?php

namespace App\Http\Controllers;

use Validator;
use App\Model\Tour;
use App\Model\Review;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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
        return ReviewSource::collection($tour->reviews()->where('spam', 0)->orderBy('created_at', 'desc')->paginate(10));
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
                // dd($review);
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
    public function getPermision($idRole) {
        return DB::table('role_has_permissions')->where('role_id','=', $idRole)->get();
    }
    public function store(Request $request)
    {
        // dd($request->TourID);
        $validator = Validator::make($request->all(), [
            'Rating' => 'required|numeric',
            'Contents' => 'required|string:min:3'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE, 
                'errors'=>$validator->errors()
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }

        $user = auth()->user();
        $role = DB::table('model_has_roles')->select('role_id')->where('model_id', '=' , $user->id)->get();
        $arrPer = array();
        foreach($role as $rol) {
            array_push($arrPer, $this->getPermision($rol->role_id));
        }
        $arrPermission = array();
        foreach ($arrPer as $per) {
            for ($i = 0; $i < sizeof($per); $i++) {
                array_push($arrPermission,$per[$i]->permission_id);
            }
            // array_push($arrPermission, $per->permission_id);
        }
        // dd($arrPermission);
        // Nếu có quyền ko kiểm duyệt sẽ xuất hiện ngay khi comment 
        if (in_array(5, $arrPermission)) {
            $review = new Review([
                'user_id' => $user->id,
                'tour_id' => $request->TourID,
                'Rating' =>  $request->Rating,
                'Contents' => $request->Contents,
                'spam' => 0,
                'approve_by' => $user->id
            ]);
            $review->save();
        }
        else {
            $review = new Review([
                'user_id' => $user->id,
                'tour_id' => intval($request->TourID),
                'Rating' =>  $request->Rating,
                'Contents' => $request->Contents,
                'spam' => 1
            ]);
            $review->save();
        }
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $review
        ]);
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
        // dd($request->all(), $review);
        $validator = Validator::make($request->all(), [
            'Contents' => 'required|string',
            'Rating' => 'required|numeric'
        ]);
        $user = auth()->user();
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ]);
        }
        // pass
        $review->update([
            'spam' => 0,
            'approve_by' =>  $user->id
        ]);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $review
        ]);
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
