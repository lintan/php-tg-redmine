<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLuckyMoneyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lucky_money', function (Blueprint $table) {
            $table->increments('id');
            $table->bigInteger('sender_id')->nullable()->comment('发送用户id');
            $table->decimal('amount')->nullable()->comment('红包金额');
            $table->decimal('received')->default('0.00')->nullable()->comment('被领取金额');
            $table->integer('number')->nullable()->comment('红包个数');
            $table->tinyInteger('lucky')->nullable()->comment('是否随机');
            $table->integer('thunder')->nullable()->comment('雷');
            $table->string('chat_id')->nullable()->comment('群组id');
            $table->json('red_list')->nullable()->comment('红包数组');
            $table->string('sender_name')->nullable()->comment('发送者名称');
            $table->decimal('lose_rate')->nullable()->comment('红包倍数');
            $table->tinyInteger('status')->default('1')->nullable()->comment('状态:1=正常;2=已领完;3=已过期');
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
        Schema::dropIfExists('lucky_money');
    }
}
