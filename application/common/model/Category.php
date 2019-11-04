<?php

namespace app\common\model;

use app\common\model\Base;

class Category extends Base
{
    protected $table = 'category';
    protected $pk = 'id';

    public function getStatusAttr($k)
    {
        $map = [-1 => '删除', 0 => '禁用', 1 => '正常'];
        return $map[$k];
    }

    public function tree($type_id=0)
    {
		$where['status']=1;
		$where['type_id']=$type_id;
        $list = $this->where($where)->select();
        return $this->sort($list);
    }

    public function sort($data, $pid = 0, $level = '')
    {
        static $arr = array();
        foreach ($data as $key => $value) {
			if ($value['pid'] == $pid) {
				$value['level'] = $level . $value['name'];
				$arr[] = $value;
				$this->sort($data, $value['id'], $value['level'] . DS);
			}
        }
        return $arr;
    }
	
	public function getChildren($xiaoqu_id,$pid=0){
		$fields=[
			'id',
			'name',
			'pid',
		];
		
		$where=[
			'status'=>1,
			'pid'=>$pid,
			'xiaoqu_id'=>$xiaoqu_id,
		];
		
		$order=[
			'name'=>'asc'
		];
		
		return $this->where($where)->field($fields)->order($order)->select();
	}
}
