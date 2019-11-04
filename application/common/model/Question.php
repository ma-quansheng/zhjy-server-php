<?php

namespace app\common\model;

use app\common\model\Base;
use think\Model;

class Question extends Base
{
    protected $table = 'question';
    protected $pk = 'id';

    public function getStatusAttr($k)
    {
        $map = [-1 => '删除', 0 => '结贴', 1 => '正常'];
        return $map[$k];
    }
	
	public function getTypeAttr($k){
		$map=[1=> '咨询', 2=> '投诉', 3=> '建议', 4=> '表扬'];
		return $map[$k];
	}
}
