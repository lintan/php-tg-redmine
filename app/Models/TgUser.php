<?php

namespace App\Models;

use App\Traits\DateTrait;
use Illuminate\Database\Eloquent\Model;

class TgUser extends Model
{
    use  DateTrait;
    protected $table = 'tg_users';
    protected $fillable = [
        'username',
        'first_name',
        'tg_id',
        'balance',
        'group_id',
        'status',
        'invite_user',
    ];


}
