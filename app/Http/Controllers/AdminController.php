<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('api');
    }
    public function index() {
        return view('backend.layouts.master');
    }
}
