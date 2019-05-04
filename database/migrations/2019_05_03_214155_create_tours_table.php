<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateToursTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tours', function (Blueprint $table) {
            $table->increments('TourID');
            $table->string('TourName');
            $table->text('TourDescription');
            $table->dateTime('DateDeparture');
            $table->dateTime('DateBack');
            $table->string('Note');
            $table->string('ImageUrl');
            $table->integer('NumberPerson');
            $table->bigInteger('PriceAdult');
            $table->bigInteger('PriceKid');
            $table->string('Unit');
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
        Schema::dropIfExists('tours');
    }
}
