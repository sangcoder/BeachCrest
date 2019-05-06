<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateScenicCulturesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('scenic__cultures', function (Blueprint $table) {
            $table->increments('ScenicID');
            $table->integer('place_id')->unsigned()->index();
            $table->foreign('place_id')->references('PlaceID')->on('places')->onDelete('cascade');
            $table->string('Description');
            $table->text('Contents');
            $table->unsignedBigInteger('HitCount')->default(0);
            $table->string('ImgUrl');
            $table->tinyInteger('state');
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
        Schema::dropIfExists('scenic__cultures');
    }
}
