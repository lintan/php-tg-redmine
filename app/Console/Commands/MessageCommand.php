<?php

namespace App\Console\Commands;

use App\Services\TelegramService;
use Illuminate\Console\Command;
use SergiX44\Nutgram\Nutgram;
use SergiX44\Nutgram\RunningMode\Polling;

class MessageCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'message';

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
     * @return void
     */
    public function handle(Nutgram $bot)
    {
        $this->info('开始...');
//        $bot = new Nutgram($_ENV['TOKEN']); // new instance
        $bot->setRunningMode(Polling::class);
        TelegramService::handleRed($bot);
        $bot->run();

         // start to listen to updates, until stopped
    }
}
