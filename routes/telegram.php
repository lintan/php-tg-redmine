<?php
/** @var SergiX44\Nutgram\Nutgram $bot */

use SergiX44\Nutgram\Nutgram;
use SergiX44\Nutgram\Telegram\Attributes\ParseMode;

/*
|--------------------------------------------------------------------------
| 本项目免费开源，有问题联系 [@cody](https://t.me/cody0512) (不常登，请耐心等候)
|--------------------------------------------------------------------------
|
| Here is where you can register telegram handlers for Nutgram. These
| handlers are loaded by the NutgramServiceProvider. Enjoy!
|
*/

//$bot->onCommand('start', function (Nutgram $bot) {
//    return $bot->sendMessage('Hello, world!');
//})->description('The start command!');
$bot->onText('(群信息|获取群信息|查看群信息)', function (Nutgram $bot,$ac) {
    $bot->sendMessage("群ID：<code>{$bot->message()->chat->id}</code>\n用户ID：<code>{$bot->user()->id}</code>", ['parse_mode' => ParseMode::HTML,'reply_to_message_id'=>$bot->message()->message_id]);
});
$bot->onPhoto(function (Nutgram $bot) {
    if ($bot->chat()->type == 'private') {
        $fileId = $bot->message()->photo[1]->file_id;
        $bot->sendMessage("图片ID：<code>$fileId</code>", ['parse_mode' => ParseMode::HTML,'reply_to_message_id'=>$bot->message()->message_id]);
    }
});
$bot->onCommand('help', function (Nutgram $bot) {
    $text = "注册：<code>/register</code>\n发红包：<code>发10-1</code>或<code>10-1</code>\n查余额：<code>查</code>或<code>1</code>\n获取ID：<code>获取群信息</code>";
    $bot->sendMessage($text, ['parse_mode' => ParseMode::HTML]);
});
$bot->onCommand('start', function (Nutgram $bot) {
    $text = "开始游戏";
    $bot->sendMessage($text, ['parse_mode' => ParseMode::HTML]);
});
