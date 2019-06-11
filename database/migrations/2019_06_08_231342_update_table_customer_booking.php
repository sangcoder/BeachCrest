<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTableCustomerBooking extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('customers', function (Blueprint $table) {
            $table->string('PhoneNumber')->nullable();
            $table->date('Birthday')->nullable()->change();
            $table->boolean('delegatePerson')->default(false);
            $table->string('Email')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('customers', function (Blueprint $table) {
            $table->string('PhoneNumber')->nullable();

            $table->date('Birthday')->nullable()->change();
            $table->boolean('delegatePerson')->default(false);
            $table->string('Email')->nullable();
        });
    }
}
