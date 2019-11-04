<?php

namespace app\admin\controller;

use app\admin\controller\Base;

class System extends Base
{
    public function addUserType()
    {
        $list = model('Usertype')->select();
        $this->assign('list', $list);
        return $this->fetch('system/add');
    }
}
