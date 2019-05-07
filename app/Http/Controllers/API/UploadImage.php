<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UploadImage extends Controller
{
    public function upload(Request $request) {
        $file = $request->file;
        $path = 'upload/images';
        if ($file) {
            $name = sha1(time()).'.'.$file->getClientOriginalExtension();
            $file->move($path,$name);
        }
        $urlFull =env('APP_URL').'/'. $path.'/'.$name;
        return $urlFull;

    }
}
