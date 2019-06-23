<?php

namespace App\Http\Controllers;

use Validator;
use App\Model\News;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Http\Resources\NewsCollection;

class NewsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $news = News::paginate(5);
        // return $news;
        return NewsCollection::collection($news);
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
    public function testBase($s)
    {
          return (bool) preg_match('~data:\w+/.*;base64,.*~', $s);
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
            'Title' => 'required|string|min:5',
            'Contents' => 'required|string',
            'State' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ]);
        }
        $user = auth()->user();
        if ($request->ImgUrl  && $this->testBase($request->ImgUrl)) {
            $imageName = preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$request->ImgUrl,$matched);
            $ext = isset($matched[1][0]) ? $matched[1][0] : false;
            $imageName = sha1(time()) . '.' .$ext;
            \Image::make($request->ImgUrl)->save(public_path().'/images/news/'.$imageName);
            $news = new News([
                'Title' => $request->Title,
                'Contents' => $request->Contents,
                'State' => $request->State,
                'ImgUrl' => '/images/news/'.$imageName,
                'user_id' => $user->id
            ]);
            $news->save();
    
            return response()->json([
                'success' => AppResponse::STATUS_SUCCESS,
                'data' => $news
            ]);
        }
        else {
            return 'Image error';
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\News  $news
     * @return \Illuminate\Http\Response
     */
    public function show(News $news)
    {
        return new NewsCollection($news);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\News  $news
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, News $news)
    {
        $validator = Validator::make($request->all(), [
            'Title' => 'required|string|min:5',
            'Contents' => 'required|string',
            'State' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ]);
        }
        $user = auth()->user();
        if ($request->ImgUrl && $this->testBase($request->ImgUrl)) {
            $imageName = preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$request->ImgUrl,$matched);
            $ext = isset($matched[1][0]) ? $matched[1][0] : false;
            $imageName = sha1(time()) . '.' .$ext;
            \Image::make($request->ImgUrl)->save(public_path().'/images/cultures/'.$imageName);
            $news->update([
                'Title' => $request->Title,
                'Contents' => $request->Contents,
                'State' => $request->State,
                'ImgUrl' => '/images/news/'.$imageName,
                'user_id' => $user->id
            ]);
        }
        else {
            $news->update([
                'Title' => $request->Title,
                'Contents' => $request->Contents,
                'State' => $request->State,
                'user_id' => $user->id
            ]);
        }
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $news
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\News  $news
     * @return \Illuminate\Http\Response
     */
    public function destroy(News $news)
    {
        $news->delete();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }
}
