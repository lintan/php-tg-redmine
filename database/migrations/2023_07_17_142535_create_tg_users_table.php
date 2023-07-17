<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTgUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tg_users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('username')->nullable()->comment('用户名');
            $table->string('first_name')->nullable()->comment('用户名');
            $table->bigInteger('tg_id')->nullable()->comment('tgId');
            $table->decimal('balance')->default('0.00')->nullable()->comment('余额');
            $table->tinyInteger('status')->default('1')->nullable()->comment('状态:1=正常;0=离开');
            $table->integer('invite_user')->nullable()->comment('邀请人id');
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
        Schema::dropIfExists('tg_users');
    }
}
