<?php

namespace App\Services;

use App\Models\Config;
use Illuminate\Support\Facades\Log;

class ConfigService
{

    public function __construct()
    {

    }

    public static function getConfigValue($groupId,$name){
        //>本项目免费开源，有问题联系 [@cody](https://t.me/cody0512) (不常登，请耐心等候)
        $value =  Config::query()->where('group_id', $groupId)->where('name', $name)->value('value');
        if($value){
            return $value;
        }else if(config('tgbot.'.$name) >0){
            return config('tgbot.'.$name);
        }else{
            return null;
        }
    }
}
