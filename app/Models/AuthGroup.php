<?php

namespace App\Models;

use App\Traits\DateTrait;
use Illuminate\Database\Eloquent\Model;

class AuthGroup extends Model
{
    use  DateTrait;
    protected $table = 'auth_group';
    protected $fillable = [

    ];


}
