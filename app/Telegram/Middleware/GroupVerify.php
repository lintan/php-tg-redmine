<?php

namespace App\Telegram\Middleware;

use App\Models\AuthGroup;
use Illuminate\Support\Facades\Log;
use SergiX44\Nutgram\Nutgram;

class GroupVerify
{

    public function __invoke(Nutgram $bot, $next): void
    {
        Log::info('消息日志：'.json_encode($bot->message()));
        //check if user has permssion using $this->permission
        $list = AuthGroup::query()->where('status',1)->get();
        $groupIds = array_column($list->toArray(),'group_id');
        if(in_array($bot->message()->chat->id,$groupIds)){
            $next($bot);
        }else{
            $bot->sendMessage('未授权');
        }

    }
}
