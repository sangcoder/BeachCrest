<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->increments('BookingID');
            $table->tinyInteger('NumberPerson');
            $table->dateTime('DateBooking');
            $table->string('Note');
            $table->tinyInteger('State')->default(0);
            $table->tinyInteger('Payment');
            $table->bigInteger('ApprovedBy')->unsigned();
            $table->foreign('ApprovedBy')->references('id')->on('users')->onDelete('cascade');
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
        Schema::dropIfExists('bookings');
    }
}
