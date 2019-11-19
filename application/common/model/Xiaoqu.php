<?php

namespace app\common\model;

use app\common\model\Base;
use think\Model;

class Xiaoqu extends Base
{
    protected $table = 'xiaoqu';
    protected $pk = 'id';

    public function getStatusMap($k)
    {
        $map = [-1 => '删除', 0 => '禁用', 1 => '正常'];
        return $map[$k];
    }
	
	public function getList(){
		$where=[
			'status'=>1
		];
		
		return $this->where($where)->select();
	}
}
