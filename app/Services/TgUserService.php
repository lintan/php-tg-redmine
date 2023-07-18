<?php

namespace App\Services;

use App\Models\LuckyHistory;
use App\Models\LuckyMoney;
use App\Models\TgUser;
use Illuminate\Support\Facades\Log;

class TgUserService
{

    public function __construct()
    {

    }

    public static function addUser($memberInfo)
    {
        $info = TgUser::query()->where('tg_id', $memberInfo->id)->first();
        if (!$info) {
            $insert = [
                'username' => $memberInfo->username,
                'first_name' => $memberInfo->first_name,
                'tg_id' => $memberInfo->id,
                'balance' => ConfigService::getConfigValue($memberInfo->group_id, 'default_balance'),
                'status' => 1,
                'invite_user' => $memberInfo->invite_user,
            ];
            $rs =  TgUser::query()->create($insert);
            if(!$rs){
                return ['state'=>0,'msg'=>'注册失败'];
            }
        } else if ($info['status'] == 0) {
//            $info->status = 1;
//            $rs =  $info->save();
            return ['state'=>0,'msg'=>'用户已禁用，请联系管理员'];
        }else if($info['status'] == 1){
            return ['state'=>0,'msg'=>'用户已注册'];
        }
        return ['state'=>1];
    }

    public static function leftUser($memberInfo)
    {
        $info = TgUser::query()->where('tg_id', $memberInfo->id)->first();
        if ($info && $info['status'] == 1) {
            $info->status = 0;
            $info->save();
        }
    }

    public static function checkBalance($id,$amount){
        $info = TgUser::query()->where('tg_id', $id)->first();
        if (!$info) {
            return ['state'=>0,'msg'=>'用户不存在'];
        }else if(!$info->status){
            return ['state'=>0,'msg'=>'用户已禁用，请联系管理员处理'];
        }else if($info->balance < $amount){
            return ['state'=>0,'msg'=>'您的余额已不足发包'];
        }
        return ['state'=>1];
    }
    public static function getUserById($id){
        return TgUser::query()->where('tg_id', $id)->first();

    }
    public static function getTodayData($id,$chatId){
        $info = TgUser::query()->where('tg_id', $id)->first();
        if (!$info) {
            return ['state'=>0,'msg'=>'用户不存在'];
        }else if(!$info->status){
            return ['state'=>0,'msg'=>'用户已禁用，请联系管理员处理'];
        }
        $todayStart = date('Y-m-d 00:00:00');
        $todayEnd = date('Y-m-d H:i:s');
        //红包支出
        $redPayTotal = LuckyMoney::query()->where('sender_id', $id)->where('chat_id', $chatId)
            ->where('created_at', '>=',$todayStart)->where('created_at', '<',$todayEnd)->sum('amount');
        //发包盈收
        $sendProfitTotal = LuckyHistory::query()->where('lucky_history.created_at', '>=',$todayStart)->where('lucky_history.created_at', '<',$todayEnd)
            ->leftJoin('lucky_money as lm','lm.id','=','lucky_history.lucky_id')
            ->where('lm.sender_id',$id)->where('lm.chat_id',$chatId)->sum('lucky_history.lose_money');
        //抢包收入
        $getProfitTotal = LuckyHistory::query()->where('created_at', '>=',$todayStart)->where('created_at', '<',$todayEnd)
            ->where('user_id',$id)->sum('amount');
        $loseTotal = LuckyHistory::query()->where('created_at', '>=',$todayStart)->where('created_at', '<',$todayEnd)
            ->where('user_id',$id)->sum('lose_money');
        $todayProfit = $sendProfitTotal - $redPayTotal + $getProfitTotal - $loseTotal;
        return [
            'redPayTotal'=>round($redPayTotal,2),
            'sendProfitTotal'=>round($sendProfitTotal,2),
            'getProfitTotal'=>round($getProfitTotal,2),
            'loseTotal'=>round($loseTotal,2),
            'todayProfit'=>$todayProfit>0?'+'.round($todayProfit,2):round($todayProfit,2),
        ];

    }
}
