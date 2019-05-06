<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSchedulesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('schedules', function (Blueprint $table) {
            $table->increments('id');
            $table->dateTime('StartTime');
            $table->dateTime('EndTime');
            $table->integer('guider_id')->unsigned();
            $table->foreign('guider_id')->references('GuiderID')->on('tour_guiders')->onDelete('cascade');
            $table->integer('tour_id')->unsigned();
            $table->foreign('tour_id')->references('TourID')->on('tours')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('schedules');
    }
}
