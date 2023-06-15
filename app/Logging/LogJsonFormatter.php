<?php //LogJsonFormatter
declare(strict_types=1);

namespace App\Logging;

use Monolog\Formatter\JsonFormatter;
use Monolog\Processor\UidProcessor;


/**
 * Class CustomizeJsonFormatter
 * @package App\Logging
 * @author  wei
 */
class LogJsonFormatter extends JsonFormatter
{
    /**
     * 日志唯一ID
     *
     * @var null|string
     */
    private static $_uid = null;

    /**
     * {@inheritdoc}
     */
    public function format(array $record): string
    {
        $normalized = $this->customizeNormalize($record);
        $normalized = array_merge(["date" => date("Y-m-d H:i:s")],$normalized);

        if (isset($normalized['context']) && $normalized['context'] === []) {
            if ($this->ignoreEmptyContextAndExtra) {
                unset($normalized['context']);
            } else {
                $normalized['context'] = new \stdClass;
            }
        }
        if (isset($normalized['extra']) && $normalized['extra'] === []) {
            if ($this->ignoreEmptyContextAndExtra) {
                unset($normalized['extra']);
            } else {
                if ($normalized["level_name"] == "ERROR") {
                    $backtrace = debug_backtrace(1,10);
                    $temp = [];
                    foreach ($backtrace as $value) {
                        if (isset($value['file']) && isset($value['line'])) {
                            $temp[] = "file:{$value['file']} line:{$value['line']}";
                        }
                    }

                    $normalized['extra'] = $temp;
                }
            }
        }

        return $this->toJson($normalized, true) . ($this->appendNewline ? PHP_EOL : '');
    }


    /**
     * Normalizes given $data.
     *
     * 自定义一些自己想要个参数
     *
     * @param mixed $data
     *
     * @return mixed
     */
    protected function customizeNormalize($data)
    {
        $normalized = $this->normalize($data);

        $normalized['url'] = request()->url();
        $normalized['log_id'] = self::getLogId();
        $normalized['server_ip'] = request()->server('SERVER_ADDR', '');
        $normalized['run'] = app()->runningInConsole() ? 'cli' : 'web';
        $normalized['client_id'] = request()->ip();
        $normalized['method'] = request()->method();

        return $normalized;
    }


    /**
     * @return string|null
     */
    public static function getLogId()
    {
        if (empty(self::$_uid)) {
            $oUid = new UidProcessor(32);
            self::$_uid = $oUid->getUid();
        }

        return self::$_uid;
    }

    /**
     * @return string|null
     */
    public static function clearLogId() {
        self::$_uid = '';
        $oUid = new UidProcessor(32);
        self::$_uid = $oUid->getUid();
        return self::$_uid;
    }
}



