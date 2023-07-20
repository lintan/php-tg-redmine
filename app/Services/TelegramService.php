<?php

namespace App\Services;

use App\Models\AuthGroup;
use App\Telegram\Middleware\GroupVerify;
use Illuminate\Support\Facades\Log;
use SergiX44\Nutgram\Nutgram;
use SergiX44\Nutgram\RunningMode\Polling;
use SergiX44\Nutgram\Telegram\Attributes\ParseMode;
use SergiX44\Nutgram\Telegram\Types\Keyboard\InlineKeyboardButton;
use SergiX44\Nutgram\Telegram\Types\Keyboard\InlineKeyboardMarkup;

class TelegramService
{

    public static function handleRed(Nutgram $bot)
    {

        $bot->group(GroupVerify::class, function (Nutgram $bot) {

            // Your handlers here
            // Called when a message contains the command "/start someParameter"
//            $bot->onCommand('start {parameter}', function (Nutgram $bot, $parameter) {
//                $bot->sendMessage("The parameter is {$parameter}");
//            });
            // ex. called when a message contains "My name is Mario"

            $bot->onText('(发[包]*)*([0-9]+)[-/]([0-9]+)', function (Nutgram $bot, $ac, $num, $mine) {
                if ($num < 5) {
                    $bot->sendMessage('红包金额不能小于5U');
                    return;
                }
                if (!$mine || $mine > 9 || $mine < 1) {
                    $bot->sendMessage('指令有误，雷数应是1~9之间');
                    return;
                }
                $num = (int)$num;
                $mine = (int)$mine;
                $sendUserId = $bot->user()->id;
                //检查余额
                $checkRs = TgUserService::checkBalance($sendUserId, $num);
                if (!$checkRs['state']) {
                    $bot->sendMessage($checkRs['msg']);
                    return;
                }
                $luckyTotal = ConfigService::getConfigValue($bot->message()->chat->id, 'lucky_num');
                //添加红包
                $luckyId = LuckyMoneyService::add($sendUserId,$bot->message()->from->first_name, $num, $mine, $bot->message()->chat->id, $luckyTotal);
                if ($luckyId) {
                    $photo = get_photo($bot->message()->chat->id);
                    $InlineKeyboardMarkup = InlineKeyboardMarkup::make()->addRow(
                        InlineKeyboardButton::make("🧧抢红包[{$luckyTotal}/0]总{$num}U 💥雷{$mine}", callback_data: "qiang-" . $luckyId),
                    );
                    $data = [
                        'caption' => "[ <code>" . format_name($bot->message()->from->first_name) . "</code> ]发了个 {$num} U红包，快来抢！",
                        'parse_mode' => ParseMode::HTML,
                        'reply_markup' => common_reply_markup($bot->message()->chat->id,$InlineKeyboardMarkup)
                    ];

                    $bot->sendPhoto($photo, $data);
                }

            });
            $bot->onText('(1$|查$|余额$)', function (Nutgram $bot, $ac) {
                if ($ac == 1 || $ac == '查' || $ac == '余额' || $ac == '查余额') {
                    $userInfo = TgUserService::getUserById($bot->user()->id);
                    $bot->sendMessage("[ <code>{$bot->user()->first_name}</code> ] 余额：{$userInfo->balance}  U", ['parse_mode' => ParseMode::HTML]);
                }
            });

            $bot->onCallbackQueryData('balance', function (Nutgram $bot) {
                $userInfo = TgUserService::getUserById($bot->user()->id);
                $bot->answerCallbackQuery([
                    'text' => "[ <code>{$bot->user()->first_name}</code> ] \n-----------------------------\n余额：{$userInfo->balance}  U",
                    'parse_mode' => ParseMode::HTML,
                    'show_alert' => true
                ]);
            });
            $bot->onCallbackQueryData('qiang-{luckyid}', function (Nutgram $bot, $luckyid) {
                $userId = $bot->user()->id;
                $rs = LuckyMoneyService::checkBalance($luckyid, $userId);
                if (!$rs['state']) {
                    $bot->answerCallbackQuery([
                        'text' => $rs['msg'],
                        'show_alert' => true
                    ]);
                } else {
                    $rs1 = LuckyMoneyService::getMoney($luckyid, $userId);
                    if ($rs1['state']) {
                        if ($rs1['luckyInfo']['number'] > $rs1['open_num']) {
                            $groupInfo =  AuthGroup::query()->where('status',1)->where('group_id',$bot->message()->chat->id)->first()->toArray();
                            $rs1['luckyInfo']['amount'] = (int)$rs1['luckyInfo']['amount'];
                            $InlineKeyboardMarkup = InlineKeyboardMarkup::make()->addRow(
                                InlineKeyboardButton::make("🧧抢红包[{$rs1['luckyInfo']['number']}/{$rs1['open_num']}]总{$rs1['luckyInfo']['amount']}U 💥雷{$rs1['luckyInfo']['thunder']}", callback_data: "qiang-" . $luckyid),
                            );
                            $data = [
                                'message_id' => $bot->message()->message_id,
                                'caption' => "[ <code>" . format_name($rs1['luckyInfo']['sender_name']) . "</code> ]发了个 {$rs1['luckyInfo']['amount']} U红包，快来抢！",
                                'parse_mode' => ParseMode::HTML,
                                'reply_markup' => common_reply_markup($bot->message()->chat->id,$InlineKeyboardMarkup)
                            ];
                            $bot->editMessageCaption($data);
                        } else {
                            $list = LuckyMoneyService::getLuckyHistory($luckyid);
                            $details = '';
                            $loseMoneyTotal = 0;
                            foreach ($list as $key =>$val){
                                if($val['is_thunder']!=1){
                                    $details.= ($key+1).".[💵] <code>".round($val['amount'],2)."</code> U <code>".format_name($val['first_name'])."</code>\n";
                                }else{
                                    $details.= ($key+1).".[💣] <code>".round($val['amount'],2)."</code> U <code>".format_name($val['first_name'])."</code>\n";
                                    $loseMoneyTotal += $val['lose_money'];
                                }
                            }
                            $profit = $loseMoneyTotal - $rs1['luckyInfo']['amount'];
                            $profitTxt = $profit>=0?'+'.$profit:$profit;
                            $caption = "[ <code>" . format_name($rs1['luckyInfo']['sender_name']) . "</code> ]的红包已被领完！\n
🧧红包金额：".$rs1['luckyInfo']['amount']." U
🛎红包倍数：".round($rs1['luckyInfo']['lose_rate'],2)."
💥中雷数字：{$rs1['luckyInfo']['thunder']}\n
--------领取详情--------\n
".$details."
<pre>💹 中雷盈利： ".$loseMoneyTotal."</pre>
<pre>💹 发包成本：-".round($rs1['luckyInfo']['amount'],2)."</pre>
<pre>💹 包主实收：{$profitTxt}</pre>";
                            $data = [
                                'message_id' => $bot->message()->message_id,
                                'caption' => $caption,
                                'parse_mode' => ParseMode::HTML,
                                'reply_markup' => common_reply_markup($bot->message()->chat->id)];
//                            Log::info('$data='.json_encode($data));
                            $bot->editMessageCaption($data);
                        }

                    }
                    $bot->answerCallbackQuery([
                        'text' => $rs1['msg'],
                        'show_alert' => true
                    ]);
                }
            });

            $bot->onCallbackQueryData('today_data', function (Nutgram $bot) {
                $result = TgUserService::getTodayData($bot->user()->id,$bot->message()->chat->id);
                $bot->answerCallbackQuery([
                    'text' => "今日盈利：{$result['todayProfit']}
-----------
发包支出：-{$result['redPayTotal']}
发包盈收：+{$result['sendProfitTotal']}
-----------
抢包收入：+{$result['getProfitTotal']}
抢包中雷：-{$result['loseTotal']}
-----------
邀请获利：+0
下级返点：+0
福利活动：+0
",
                    'show_alert' => true
                ]);
            });

            $bot->onCallbackQueryData('share_data', function (Nutgram $bot) {
//                $result = TgUserService::getTodayData($bot->user()->id,$bot->message()->chat->id);
                $bot->answerCallbackQuery([
                    'text' => "今日邀请：0
本月邀请：0
累计邀请：0
-----------
",
                    'show_alert' => true
                ]);
            });

            $bot->onNewChatMembers(function (Nutgram $bot) {
                $groupId = $bot->message()->chat->id;
                $Member = $bot->message()->new_chat_members[0];
                $Member->group_id = $groupId;
                $Member->invite_user = !$bot->message()->from->is_bot ? $bot->message()->from->id : 0;
                TgUserService::addUser($Member);
            });
            $bot->onLeftChatMember(function (Nutgram $bot) {
                $groupId = $bot->message()->chat->id;
                $Member = $bot->message()->left_chat_member;
                $Member->group_id = $groupId;
                TgUserService::leftUser($Member);
            });
            $bot->onCommand('register', function (Nutgram $bot) {
                $groupId = $bot->message()->chat->id;
                $Member = $bot->user();
//                Log::info('$Member::'.json_encode($Member));
                $Member->group_id = $groupId;
                $Member->invite_user = 0;
                $rs = TgUserService::addUser($Member);
                if ($rs['state'] == 1) {
                    $bot->sendMessage("注册成功");
                } else {
                    $bot->sendMessage($rs['msg']);
                }

            });
            // Called on command "/help"
        });
    }

}
