<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
class UploadImage extends Controller
{
    public function upload(Request $request) {
        // $request->validate([
        //     'file' => 'image|required|is_image:jpg,png',
        // ]);
        $file = $request->file('file');
        $path = 'upload/images';
        if ($request->hasFile('file')) {
            $name = sha1(time()).'.'.$file->getClientOriginalExtension();
            $file->move($path,$name);
        }
        $urlFull =env('APP_URL').'/'. $path.'/'.$name;
        return $urlFull;

    }
    public function uploadJson(Request $request) {
        return response()->json([
            'url' => 'abc'
        ]);
    }
}
