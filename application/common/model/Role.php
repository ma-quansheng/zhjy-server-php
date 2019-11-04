<?php

namespace app\common\model;

use app\common\model\Base;
use think\Model;

class Role extends Base
{
    protected $table = 'role';
    protected $pk = 'id';
    protected $readonly = ['name'];

    public function getStatusAttr($k)
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
