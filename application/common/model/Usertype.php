<?php

namespace app\common\model;

use app\common\model\Base;
use think\Model;

class Usertype extends Base
{
    protected $table = 'usertype';
    protected $pk = 'id';

    public function getStatusAttr($k)
    {
        $map = [-1 => '删除', 0 => '禁用', 1 => '正常'];
        return $map[$k];
    }
}
