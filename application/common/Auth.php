<?php

namespace app\common;

class Auth
{
    public static function encodeByMd5($str = '')
    {
        return md5($str . config('app_config.crypt_salt'));
    }

    public static function checkSign($sign = '')
    {
        return;
    }

    /**
     * 设置登录唯一token
     */
    public static function setAppLoginToken($value = '')
    {
        return md5(uniqid($value, true));
    }
}
