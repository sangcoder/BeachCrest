<?php

namespace App\Http\Controllers;

use App\Model\Promotion;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use Validator;
class PromotionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $promotion = (new Promotion)->newQuery();
        if ($request->exists('sortById') && $request->sortById == 'ascend') {
            $promotion->orderBy('PromotionID', 'asc');
        }
        if ($request->exists('sortById') && $request->sortById == 'descend') {
            $promotion->orderBy('PromotionID', 'desc');
        }

        $result = $promotion->paginate(10);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $result
        ], AppResponse::HTTP_OK);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() 
    {

    }
/**
 * Find a record
 * Method : GET api/promotion/search
 * Return list promotion 
 */
    public function search(Request $request) {
        // Mọi request gửi lên server đều đọc được bởi biến request
        // Khai báo 1 query
        $search = (new Promotion)->newQuery();
        if($request->exists('q')) {
            // Nếu request gửi lệnh có query dạng api/promotion/search?q=<keyword>
            // Thì sẽ thực hiện câu truy vấn
            $search->where('Contents', 'LIKE','%'.$request->q.'%'); 
        }
        // Nếu có query q => trả về kết quả tìm kiềm 
        // Nếu không get tất cả danh sách ra
        $result = $search->get();
        return response()->json([
            'data' => $result
        ]);
    }
    /**
     * Store a newly created resource in storage.
     * Method: POST api/promotion
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Ràng buộc dữ liệu
        $validator = Validator::make($request->all(), [
            'Contents' => 'required|string'
        ]);
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        $pro = new Promotion([
            'Contents' => $request->Contents
        ]);
        $pro->save();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $pro
        ],201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Promotion  $promotion
     * @return \Illuminate\Http\Response
     */
    public function show(Promotion $promotion)
    {
        return $promotion;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Promotion  $promotion
     * @return \Illuminate\Http\Response
     */
    public function edit(Promotion $promotion)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     * Method PUT api/promotion/{promotion}
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Promotion  $promotion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Promotion $promotion)
    {
        // Ràng buộc dữ liệu
        $validator = Validator::make($request->all(), [
            'Contents' => 'required|string'
        ]);
        // Nếu thất bại báo lỗi
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        $promotion->update([
            'Contents' => $request->Contents
        ]);
        // Sửa thành công
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $promotion
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     * Method: DELTE api/promotion/{promtion}
     * @param  \App\Model\Promotion  $promotion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Promotion $promotion)
    {
        $promotion->delete();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }
}
