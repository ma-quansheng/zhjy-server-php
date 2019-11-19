<?php

namespace app\admin\controller;

use think\Controller;

class Base extends Controller
{
    public function _initialize()
    {
        if (!getCurrentUser()) {
            return $this->redirect('login/login');
        }
    }
}
