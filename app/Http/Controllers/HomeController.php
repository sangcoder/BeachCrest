<?php

namespace App\Http\Controllers;

use App\Model\Tour;
use App\Model\Schedule;
use App\Model\Promotion;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    public function search(Request $request){
        // dd($request);
       echo 'Hello';
    }

    public function test() {
        $schedule = Schedule::find(51);
        // dd($schedule->guiders);
        // foreach ($schedule->guiders as $item) {
        //     echo $item->pivot->Contents;
        //     echo '<br />';
        //     echo $item->GuiderName;
        // }
        $schedule->guiders()->attach(10, [
            'StartTime' => '2019-05-11 16:10:34',
            'EndTime' => '2019-05-11 16:10:34',
            'Contents' => 'This is Test'
        ]);
        dd($schedule->guiders);

        // $tour = Tour::find(48);
        // dd($tour->schedules->guiders);

        // $schedule = Schedule::find(1);
        // dd(Schedule::all()->random());
        // dd($tour->schedules);
        // echo $tour->schedules;
        // // $tour->scenics()->detach(31);
        // // dd($tour->scenics);

       // $promotion = Promotion::find(16);
        // $tour->promotions()->attach(19, [
        //     'Discount' => '10',
        //     'ExpiredDate' => '2019-05-11 16:10:34'
        // ]);
        // dd($tour->promotions[0]->pivot->Discount);
        // foreach($tour->promotions as $pro) {
        //     echo $pro->pivot->Discount;
        // }
        // dd($tour->promotions);
       // dd($promotion->tours);
    //    foreach ($tour->promotions as $promotion)
    //    {
    //        echo $promotion->Discount;
    //        echo '</br>';
    //    }
        return view('welcome');
    }
}
