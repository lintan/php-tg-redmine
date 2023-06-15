<?php
/** @var SergiX44\Nutgram\Nutgram $bot */

use SergiX44\Nutgram\Nutgram;
use SergiX44\Nutgram\Telegram\Attributes\ParseMode;

/*
|--------------------------------------------------------------------------
| Nutgram Handlers
|--------------------------------------------------------------------------
|
| Here is where you can register telegram handlers for Nutgram. These
| handlers are loaded by the NutgramServiceProvider. Enjoy!
|
*/

//$bot->onCommand('start', function (Nutgram $bot) {
//    return $bot->sendMessage('Hello, world!');
//})->description('The start command!');
$bot->onText('获取群信息', function (Nutgram $bot) {
    $bot->sendMessage("群ID：<code>{$bot->message()->chat->id}</code>\n用户ID：<code>{$bot->user()->id}</code>", ['parse_mode' => ParseMode::HTML]);
});
$bot->onCommand('help', function (Nutgram $bot) {
    $text = "注册：<code>/register</code>\n发红包：<code>发10-1</code>或<code>10-1</code>\n查余额：<code>查</code>或<code>1</code>\n获取ID：<code>获取群信息</code>";
    $bot->sendMessage($text, ['parse_mode' => ParseMode::HTML]);
});
$bot->onCommand('start', function (Nutgram $bot) {
    $text = "开始游戏";
    $bot->sendMessage($text, ['parse_mode' => ParseMode::HTML]);
});
