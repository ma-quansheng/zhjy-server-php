<?php

namespace app\common\model;

use think\Model;

class Base extends Model
{
    // protected $autoWriteTimestamp = true;
    protected $resultSetType = 'collection';

    public function add($data)
    {
        if (!is_array($data)) {
            exception('数据不合法');
        }
        $this->allowField(true)->save($data);
        return $this->id;
    }

    public function getCreateTimeAttr($value)
    {
        return $value;
    }

    public function getUpdateTimeAttr($value)
    {
        return $value;
    }
}
