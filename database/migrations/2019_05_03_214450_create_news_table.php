<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('news', function (Blueprint $table) {
            $table->bigIncrements('NewsID');
            $table->string('Title');
            $table->string('ImgUrl');
            $table->text('Contents');
            $table->tinyInteger('State');
            $table->integer('event_id')->unsigned();
            $table->foreign('event_id')->references('EventID')->on('events')->onDelete('cascade');
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
        Schema::dropIfExists('news');
    }
}
