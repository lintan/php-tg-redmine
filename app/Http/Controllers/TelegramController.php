<?php

namespace App\Http\Controllers;
use App\Services\TelegramService;
use SergiX44\Nutgram\Nutgram;

class TelegramController extends Controller
{
    /**
     * Handle the request.
     */
    public function __invoke(Nutgram $bot)
    {

//        $bot->setRunningMode(Webhook::class);
        TelegramService::handleRed($bot);

        $bot->run();
         // start to listen to updates, until stopped
    }
}
