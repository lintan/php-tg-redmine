<?php

namespace App\Console\Commands;


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

class TestCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'tgtest';

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
//        $bot = new Nutgram($_ENV['TOKEN']); // new instance
        $bot->setRunningMode(Polling::class);
        $bot->sendMessage("<pre>123</pre>
<pre>222</pre>
<pre>333</pre>", ['chat_id' => -821134288,'parse_mode' => ParseMode::HTML]);


        $bot->run(); // start to listen to updates, until stopped
    }
}
