<?php

namespace app\common\model;

use app\common\model\Base;

class Feereport extends Base
{
    protected $table = 'feereport';
    protected $pk = 'id';
	
	public function lst($where=[],$order=[]){
		$list=model('Feereport')
			->where($where)
			->order($order)
			->select();
		
		if ($list){
			return $list;
		}else{
			return [];
		}
	}
}
