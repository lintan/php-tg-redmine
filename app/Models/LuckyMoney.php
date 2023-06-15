<?php

namespace App\Models;

use App\Traits\DateTrait;
use Illuminate\Database\Eloquent\Model;

class LuckyMoney extends Model
{
    use  DateTrait;
    protected $table = 'lucky_money';
    protected $fillable = [
        'sender_id',
        'sender_name',
        'amount',
        'received',
        'number',
        'lucky',
        'thunder',
        'chat_id',
        'red_list',
        'lose_rate',
    ];


}
