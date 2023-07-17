<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLuckyHistoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lucky_history', function (Blueprint $table) {
            $table->increments('id');
            $table->bigInteger('user_id')->comment('领取用户id');
            $table->integer('lucky_id')->comment('红包id');
            $table->tinyInteger('is_thunder')->nullable()->comment('是否中雷');
            $table->decimal('amount')->nullable()->comment('领取金额');
            $table->decimal('lose_money')->default('0.00')->nullable()->comment('损失金额');
            $table->string('first_name')->nullable()->comment('用户名');
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
        Schema::dropIfExists('lucky_history');
    }
}
