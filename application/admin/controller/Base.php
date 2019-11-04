<?php

namespace app\admin\controller;

use think\Controller;

class Base extends Controller
{
    public function _initialize()
    {
        if (!$this->isLogin()) {
            return $this->redirect('login/login');
        }
    }

    // 判断用户是否登录
    public function isLogin()
    {
        $user = session(config('app_config.admin_session'), '', config('app_config.admin_session_scope'));
        if ($user && $user->id) {
            return true;
        }
        return true;
    }
}
