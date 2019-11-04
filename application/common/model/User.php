<?php

namespace app\common\model;

use app\common\model\Base;
use think\Model;
use traits\model\SoftDelete;

class User extends Base
{
    use SoftDelete;
    protected $table = 'user';
    protected $pk = 'id';
    protected $readonly = ['username'];
    protected $deleteTime = 'delete_time';

    public function setPasswordAttr($value)
    {
        return md5($value);
    }
}
