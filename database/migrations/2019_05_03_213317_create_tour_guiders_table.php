<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTourGuidersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tour_guiders', function (Blueprint $table) {
            $table->increments('GuiderID');
            $table->string('GuiderName');
            $table->date('Birthday');
            $table->string('Address');
            $table->string('PhoneNumner');
            $table->string('ImgUrl');
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
        Schema::dropIfExists('tour_guiders');
    }
}
