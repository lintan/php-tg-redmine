<?php

namespace App\Console\Commands;


use App\Models\AuthGroup;
use App\Models\LuckyMoney;
use App\Services\ConfigService;
use App\Services\LuckyMoneyService;
use App\Services\TgUserService;
use App\Telegram\Middleware\GroupVerify;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use SergiX44\Nutgram\Nutgram;
use SergiX44\Nutgram\RunningMode\Polling;
use SergiX44\Nutgram\Telegram\Attributes\MessageTypes;
use SergiX44\Nutgram\Telegram\Attributes\ParseMode;
use SergiX44\Nutgram\Telegram\Types\Keyboard\InlineKeyboardButton;
use SergiX44\Nutgram\Telegram\Types\Keyboard\InlineKeyboardMarkup;

class ValidCheckCommand extends Command
{
    /**
     * 红包过期判断
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'validcheck';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';
    protected $telegram;

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle(Nutgram $bot)
    {
        $this->info('开始...');
        $i = 0;
        while (true){

            $list = LuckyMoneyService::getValidList();
            if(count($list)>0){
                foreach ($list as $item){

                    $list = LuckyMoneyService::getLuckyHistory($item['id']);
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
                    $profit = $loseMoneyTotal - $item['amount'];
                    $profitTxt = $profit>=0?'+'.$profit:$profit;
                    $caption = "[ <code>" . format_name($item['sender_name']) . "</code> ]的红包已过期！\n
🧧红包金额：".$item['amount']." U
🛎红包倍数：".round($item['lose_rate'],2)."
💥中雷数字：{$item['thunder']}\n
--------领取详情--------\n
".$details."
<pre>💹 中雷盈利： ".$loseMoneyTotal."</pre>
<pre>💹 发包成本：-".round($item['amount'],2)."</pre>
<pre>💹 包主实收：{$profitTxt}</pre>\n
温馨提示：[ <code>" . format_name($item['sender_name']) . "</code> ]的红包已过期！";

                    $photo = get_photo($item['chat_id']);
                    $data = [
                        'chat_id' => $item['chat_id'],
                        'caption' => $caption,
                        'parse_mode' => ParseMode::HTML,
                        'reply_markup' => common_reply_markup($item['chat_id'])
                    ];
                    $rs = $bot->sendPhoto($photo, $data);
                    if($rs){
                        LuckyMoney::query()->where('id',$item['id'])->update(['status'=>3,'updated_at'=>date('Y-m-d H:i:s')]);
                    }else{
                        Log::error('过期红包，发送失败');
                    }

                }
            }
            sleep(10);
            $i++;
            $this->info("循环{$i}");
        }


        //$bot->run(); // start to listen to updates, until stopped
    }
}
