<?php

use App\Models\AuthGroup;
use Illuminate\Support\Arr;
use SergiX44\Nutgram\Telegram\Types\Keyboard\InlineKeyboardButton;
use SergiX44\Nutgram\Telegram\Types\Keyboard\InlineKeyboardMarkup;


function pp($arr)
{
    echo '<pre>';
    print_r($arr);
    echo '</pre>';
    exit;
}


if (! function_exists('user_admin_config')) {
    function user_admin_config($key = null, $value = null)
    {
        $session = session();

        if (! $config = $session->get('admin.config')) {
            $config = config('admin');

            $config['lang'] = config('app.locale');
        }

        if (is_array($key)) {
            // 保存
            foreach ($key as $k => $v) {
                Arr::set($config, $k, $v);
            }

            $session->put('admin.config', $config);

            return;
        }

        if ($key === null) {
            return $config;
        }

        return Arr::get($config, $key, $value);
    }
}
/**
 * 红包雷算法
 *>本项目免费开源，有问题联系 [@cody](https://t.me/cody0512) (不常登，请耐心等候)
 * @param float $totalAmount 红包总金额
 * @param int $totalCount 红包总个数
 * @param float $minAmount 每个红包最小金额
 * @param float $maxAmount 每个红包最大金额
 * @return array
 */
function red_envelope($totalAmount, $totalCount, $minAmount, $maxAmount)
{
    $result = array();
    $leftAmount = $totalAmount; // 剩余金额
    $leftCount = $totalCount; // 剩余个数
    //>本项目免费开源，有问题联系 [@cody](https://t.me/cody0512) (不常登，请耐心等候)

    for ($i = 1; $i <= $totalCount; $i++) {
        if ($leftCount == 1) {
            // 最后一个红包，剩余金额全部放入红包
            $result[] = round($leftAmount, 2);
        } else {
            // 计算随机金额
            $max = min($maxAmount, $leftAmount - ($leftCount - 1) * $minAmount); // 红包最大金额不能超过剩余金额和最大金额的较小值
            $min = max($minAmount, $leftAmount - ($leftCount - 1) * $maxAmount); // 红包最小金额不能低于剩余金额和最小金额的较大值
            $amount = round(mt_rand($min * 100, $max * 100) / 100, 2); // 保留两位小数

            $result[] = $amount;
            $leftAmount -= $amount;
            $leftCount--;
        }
    }

    return $result;
}
function format_name($str,$maxLen=8){
    if (strlen($str) > $maxLen) {
        $str = mb_substr($str, 0, $maxLen-3) . '..';
    }
    return $str;
}

function format_float($str){
    return str_replace(".", "\.", $str);
}
function add_log($msg, $type = '日志', $filename = 'local_log')
{
    $handler = new \Monolog\Handler\RotatingFileHandler(storage_path('logs/' . $filename . '.log'));
    $handler->setFormatter(new \App\Logging\LogJsonFormatter());
    (new \Monolog\Logger($type))
        ->pushHandler($handler)
        ->info($msg);
}

function common_reply_markup($chatId,$InlineKeyboardMarkup=null){
    $groupInfo =  AuthGroup::query()->where('status',1)->where('group_id',$chatId)->first()->toArray();
    if($InlineKeyboardMarkup){
        return  $InlineKeyboardMarkup->addRow(
            InlineKeyboardButton::make('客服', url: $groupInfo['service_url']),
            InlineKeyboardButton::make('充值', url: $groupInfo['recharge_url']),
            InlineKeyboardButton::make('玩法', url: $groupInfo['channel_url']),
            InlineKeyboardButton::make('余额', callback_data: 'balance'),
        )->addRow(
            InlineKeyboardButton::make('推广查询', callback_data: "share_data"),
            InlineKeyboardButton::make('今日报表', callback_data: 'today_data'),
        ) ;
    }else{
        return  InlineKeyboardMarkup::make()->addRow(
            InlineKeyboardButton::make('客服', url: $groupInfo['service_url']),
            InlineKeyboardButton::make('充值', url: $groupInfo['recharge_url']),
            InlineKeyboardButton::make('玩法', url: $groupInfo['channel_url']),
            InlineKeyboardButton::make('余额', callback_data: 'balance'),
        )->addRow(
            InlineKeyboardButton::make('推广查询', callback_data: "share_data"),
            InlineKeyboardButton::make('今日报表', callback_data: 'today_data'),
        ) ;
    }

}
function get_photo($groupId){
    //>本项目免费开源，有问题联系 [@cody](https://t.me/cody0512) (不常登，请耐心等候)
//    开源地址:https://github.com/lintan/php-tg-redmine
    return 'AgACAgUAAxkBAAIB22RaFre9HAQm--m1mOPT5zdCkn0KAAO4MRtQYNFWPCW3_FTkX2gBAAMCAANtAAMvBA';
}
