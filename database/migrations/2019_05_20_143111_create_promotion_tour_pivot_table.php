<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePromotionTourPivotTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('promotion_tour', function (Blueprint $table) {
            $table->integer('promotion_id')->unsigned()->index();
            $table->foreign('promotion_id')->references('PromotionID')->on('promotions')->onDelete('cascade');
            $table->integer('tour_id')->unsigned()->index();
            $table->foreign('tour_id')->references('TourID')->on('tours')->onDelete('cascade');
            $table->float('Discount');
            $table->dateTime('ExpiredDate');
            $table->primary(['promotion_id', 'tour_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('promotion_tour');
    }
}
