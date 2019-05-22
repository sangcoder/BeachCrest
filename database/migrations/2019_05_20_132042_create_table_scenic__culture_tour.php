<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableScenicCultureTour extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('scenic__culture_tour', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('scenic_id')->unsigned();
            $table->foreign('scenic_id')->references('ScenicID')->on('scenic__cultures')->onDelete('cascade');
            $table->integer('tour_id')->unsigned();
            $table->foreign('tour_id')->references('TourID')->on('tours')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('scenic__culture_tour');
    }
}
