<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAuthGroupTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('auth_group', function (Blueprint $table) {
            $table->increments('id');
            $table->bigInteger('group_id')->nullable()->comment('群组id');
            $table->string('remark')->nullable()->comment('备注');
            $table->tinyInteger('status')->default('0')->nullable()->comment('状态');
            $table->string('service_url')->nullable()->comment('客服链接');
            $table->string('recharge_url')->nullable()->comment('充值链接');
            $table->string('channel_url')->nullable()->comment('频道链接');
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
        Schema::dropIfExists('auth_group');
    }
}
