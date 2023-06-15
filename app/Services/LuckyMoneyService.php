<?php

namespace App\Services;

use App\Models\Config;
use App\Models\LuckyHistory;
use App\Models\LuckyMoney;
use App\Models\TgUser;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class LuckyMoneyService
{

    public function __construct()
    {

    }

    public static function add($senderId, $senderName, $amount, $thunder, $chatId, $luckyTotal)
    {
        DB::beginTransaction();
        $totalAmount = $amount; // 红包总金额
        $totalCount = $luckyTotal; // 红包总个数
        $minAmount = 0.01; // 每个红包最小金额
        $maxAmount = $totalAmount / $totalCount * 2; // 每个红包最大金额

        $redEnvelopes = red_envelope($totalAmount, $totalCount, $minAmount, $maxAmount);
        $insert = [
            'sender_id' => $senderId,
            'sender_name' => $senderName,
            'amount' => $amount,
            'number' => $totalCount,
            'lucky' => 1,
            'received' => 0,
            'thunder' => $thunder,
            'chat_id' => $chatId,
            'lose_rate' => ConfigService::getConfigValue($chatId, 'lose_rate'),
            'red_list' => json_encode($redEnvelopes),
        ];
        $rs = LuckyMoney::query()->create($insert);
        if ($rs) {
            $rs2 = TgUser::query()->where('tg_id', $senderId)->decrement('balance', $amount);
            if (!$rs2) {
                DB::rollBack();
            }
            DB::commit();
            return $rs->id;
        }
        return false;
    }

    public static function getLuckyHistory($luckyId)
    {
        return LuckyHistory::query()->where('lucky_id', $luckyId)->get();
    }

    public static function getMoney($luckyId, $userId)
    {
        $lucky = LuckyMoney::query()->where('id', $luckyId)->first();
        $historyList = LuckyHistory::query()->where('lucky_id', $luckyId)->get();
        $totalNum = count($historyList);
        if ($totalNum >= $lucky->number) {
            return ['state' => 0, 'msg' => '该红包已全部被领取'];
        }
        foreach ($historyList as $item) {
            if ($item->user_id == $userId) {
                return ['state' => 0, 'msg' => '您已领取该红包，无法再领取'];
            }
        }
        DB::beginTransaction();
        $redList = json_decode($lucky->red_list, true);
        $redAmount = $redList[$totalNum];
        $is_thunder = 0;
        $lastNum = substr($redAmount, strlen($redAmount) - 1, 1);
        $loseMoney = 0;
        if ($lastNum == $lucky->thunder) {
            $is_thunder = 1;
            $loseRate = ConfigService::getConfigValue($lucky->chat_id, 'lose_rate');
            $loseRate = $loseRate>0?$loseRate:1.8;
            $loseMoney = $lucky->amount * $loseRate;
            $rs1 = TgUser::query()->where('tg_id', $userId)->decrement('balance', $loseMoney);
            $rs2 = TgUser::query()->where('tg_id', $lucky->sender_id)->increment('balance', $loseMoney);
            if (!$rs1 || !$rs2) {
                DB::rollBack();
                return ['state' => 0, 'msg' => '领取失败'];
            }
            $text = "中雷，领取 {$redAmount} U，损失 {$loseMoney} U";
        } else {
            $rs1 = TgUser::query()->where('tg_id', $userId)->increment('balance', $redAmount);
            if (!$rs1) {
                DB::rollBack();
                return ['state' => 0, 'msg' => '领取失败'];
            }
            $text = "未中雷，领取 {$redAmount} U";
        }
        $first_name = TgUser::query()->where('tg_id', $userId)->value('first_name');
        $insert = [
            'user_id' => $userId,
            'first_name' => $first_name,
            'lucky_id' => $luckyId,
            'is_thunder' => $is_thunder,
            'amount' => $redAmount,
            'lose_money' => $loseMoney,
        ];
        $rs = LuckyHistory::query()->create($insert);
        if ($rs) {
            //更新领取金额
            $lucky->received = $lucky->received + $redAmount;
            $rsR = $lucky->save();
            if (!$rsR) {
                DB::rollBack();
                return ['state' => 0, 'msg' => '领取失败'];
            }
            DB::commit();
            return ['state' => 1, 'msg' => $text, 'luckyInfo' => $lucky->toArray(), 'open_num' => $totalNum + 1];
        } else {
            DB::rollBack();
            return ['state' => 0, 'msg' => '领取失败'];
        }
    }

    public static function checkBalance($luckyId, $userId)
    {
        $lucky = LuckyMoney::query()->where('id', $luckyId)->first();
        $user = TgUser::query()->where('tg_id', $userId)->first();
        if (!$user) {
            return ['state' => 0, 'msg' => '用户未注册，请先注册!命令：/register'];
        }

        if (!$lucky) {
            return ['state' => 0, 'msg' => '数据有误！红包不存在'];
        }
        if (!$user->status) {
            return ['state' => 0, 'msg' => '用户已禁用，请联系管理员处理'];
        }
        $loseRate = ConfigService::getConfigValue($lucky->chat_id, 'lose_rate');
        $lowestAmount = $lucky->amount * $loseRate;
        if ($user->balance < $lowestAmount) {
            return ['state' => 0, 'msg' => '你至少需要有' . $lowestAmount . 'U才能抢这个红包~'];
        }
        return ['state' => 1];
    }

    public static function getValidList()
    {
        $configList = Config::query()->where('name', 'valid_time')->get();
        $list = [];
        foreach ($configList as $val) {
            $luckyList = LuckyMoney::query()->where('chat_id', $val['group_id'])->where('status',1)->whereColumn('amount','>','received')
                ->where('created_at','<',date('Y-m-d H:i:s',strtotime("- {$val['value']}seconds")))->get();
            if(!$luckyList->isEmpty()){
                foreach ($luckyList->toArray() as $lucy){
                    $list[] = $lucy;
                }
            }

        }


        return $list;
    }
}
