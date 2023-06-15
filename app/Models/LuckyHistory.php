<?php

namespace App\Models;

use App\Traits\DateTrait;
use Illuminate\Database\Eloquent\Model;

class LuckyHistory extends Model
{
    use  DateTrait;
    protected $table = 'lucky_history';
    protected $fillable = [
        'user_id',
        'first_name',
        'lucky_id',
        'is_thunder',
        'amount',
        'lose_money',
    ];


}
