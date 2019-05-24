<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateScheduleTourGuiderPivotTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('schedule_tour_guider', function (Blueprint $table) {
            $table->integer('schedule_id')->unsigned()->index();
            $table->foreign('schedule_id')->references('id')->on('schedules')->onDelete('cascade');
            $table->integer('tour_guider_id')->unsigned()->index();
            $table->foreign('tour_guider_id')->references('GuiderID')->on('tour_guiders')->onDelete('cascade');
            $table->dateTime('StartTime');
            $table->dateTime('EndTime');
            $table->text('Contents');
            $table->timestamps();
            $table->primary(['schedule_id', 'tour_guider_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('schedule_tour_guider');
    }
}
