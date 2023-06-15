<?php

namespace App\Listeners;

use DateTime;
use Illuminate\Database\Events\QueryExecuted;
class QueryListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  QueryExecuted  $event
     * @return void
     */
    public function handle(QueryExecuted $event)
    {
        try{
            $sql = str_replace("?", "%s", $event->sql);
            foreach ($event->bindings as $i => $binding) {
                if ($binding instanceof DateTime) {
                    $event->bindings[$i] = $binding->format('\'Y-m-d H:i:s\'');
                } else {
                    if (is_string($binding)) {
                        $event->bindings[$i] = "'$binding'";
                    }
                }
            }

            $log = vsprintf($sql, $event->bindings);
            //排除time_log_jdp表
//            if(strpos($log,'time_log_jdp') !== false){
//                return ;
//            }
            $log = $log.'  [ RunTime:'.$event->time.'ms ] ';
            if (config('app.write_select_log') == true) {
                add_log($log,'sql','sql/sql');
            }else{
                //查询不写入日志
                $action = strtolower(substr($log, 0, 6));
                if ($action == 'update' || $action == 'delete' || $action == 'insert' ) {
                    if(strpos($log,'activity_log') === false){
                        $log = $log.'  [ RunTime:'.$event->time.'ms ] ';
                        add_log($log,'sql','sql/sql');
                    }
                }
            }
        }catch (\Exception $exception){
            add_log($exception->getMessage(),'sql日志生成异常','business_err/err');
        }

    }
}
