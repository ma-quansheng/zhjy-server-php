<?php

namespace app\common\model;

use app\common\model\Base;

class Admin extends Base
{
    protected $table = 'admin';
    protected $pk = 'id';
    protected $readonly = ['username'];

    public function setPasswordAttr($value)
    {
        return md5($value);
    }
}
