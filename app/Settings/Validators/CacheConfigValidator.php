<?php

namespace Common\Settings\Validators;

use Cache;
use Exception;
use Throwable;
use Illuminate\Support\Arr;

class CacheConfigValidator
{
    const KEYS = ['cache_driver'];

    public function fails($settings)
    {
        try {
            $driverName = Arr::get($settings, 'cache_driver', config('cache.default'));
            $driver = Cache::driver($driverName);
            $driver->put('foo', 'bar');
        } catch (Exception $e) {
            return $this->getErrorMessage($e);
        } catch (Throwable $e) {
            return $this->getErrorMessage($e);
        }
    }

    /**
     * @param Exception|Throwable $e
     * @return array
     */
    private function getErrorMessage($e)
    {
        $message = $e->getMessage();

        if (str_contains($message, 'apc_fetch')) {
            return ['cache_group' => 'PHP APC module needs to be enabled before "apc" cache method can be used.'];
        } else if (str_contains($message, 'Memcached')) {
            return ['cache_group' => 'PHP Memcached extensions needs to be enabled before "memcached" cache method can be used.'];
        } else if (str_contains($message, 'Connection refused')) {
            return ['cache_group' => 'Could not connect to redis server.'];
        } else {
            return ['cache_group' => 'Could not enable this cache method.'];
        }
    }
}