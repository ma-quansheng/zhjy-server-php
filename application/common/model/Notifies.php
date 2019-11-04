<?php

namespace app\common\model;

use app\common\model\Base;
use think\Model;

class Notifies extends Base
{
    protected $table = 'notifies';
    protected $pk = 'id';

	public function getHead($num=1){
		$where=[
			'status'=>1,
			'is_position'=>1
		];
		
		$order=[
			'create_time'=>'desc',
			'list_order'=>'asc'
		];
		
		$fields=['id','title','description','author'];
		
		return $this->field($fields)
			->where($where)
			->order($order)
			->limit(abs($num))
			->select();
	}
	
	public function getHot($num=8){
		$where=[
			'status'=>1,
			'is_hot'=>1
		];
		
		$fields=['id','title','description','author','create_time'];
		
		$order=[
			'create_time'=>'desc',
			'list_order'=>'asc'
		];
		
		return $this->field($fields)
			->where($where)
			->order($order)
			->limit(abs($num))
			->select();
	}
	
	public function getList($num=0){
		$order=[
			'create_time'=>1,
			'list_order'=>1
		];
		
		$where=[
			'status'=>1,
		];
		
		$fields=['id','title','sub_title','category_id','description','is_position','is_hot','author','create_time'];
		
		return $this->where($where)
			->field($fields)
			->order($order)
			->limit(abs($num))
			->select();
	}
	
	public function getNewsById($id){
		if (!$id) return [];
		
		$where=[
			'status'=>1,
			'id'=>$id
		];

		$fields=['id','title','sub_title','category_id','description','content','is_position','is_hot','author','create_time'];
		
		return $this->where($where)
			->field($fields)
			->select();
	}
	
	public function getNewsByCategory($xiaoqu_id,$catid=0,$num=0){
		$where=[
			'status'=>1,
			'category_id'=>$catid,
			'xiaoqu_id'=>$xiaoqu_id
		];

		$order=[
			'create_time'=>1,
			'list_order'=>1
		];

		$fields=['id','title','sub_title','category_id','description','content','is_position','is_hot','author','create_time'];
		
		return $this->where($where)
			->field($fields)
			->order($order)
			->limit($num)
			->select();
	}

	public function getNewsByAuthor($id,$num=0){
		if (is_null($id)) return [];
		
		$where=[
			'status'=>1,
			'author'=>$id
		];

		$fields=['id','title','sub_title','category_id','description','content','is_position','is_hot','author','create_time'];

		$order=[
			'create_time'=>1,
			'list_order'=>1
		];
		
		return $this->where($where)
			->field($fields)
			->order($order)
			->limit($num)
			->select();
	}

	public function getNewsByTime($time,$num=0){
		if (is_null($time)) return [];
		
		$where['status']=1;
		$where['create_time']=['>=',$time];

		$fields=['id','title','sub_title','category_id','description','content','is_position','is_hot','author','create_time'];

		$order=[
			'create_time'=>1,
			'list_order'=>1
		];
		
		return $this->where($where)
			->field($fields)
			->order($order)
			->limit($num)
			->select();
	}
	
	public function getNewsLikeTitle($str='',$num=0){
		$where['status']=1;
		$where['title']=['like','%'.$str.'%'];
	
		$fields=['id','title','sub_title','category_id','description','content','is_position','is_hot','author','create_time'];
	
		$order=[
			'create_time'=>1,
			'list_order'=>1
		];
		
		return $this->where($where)
			->field($fields)
			->order($order)
			->limit($num)
			->select();
	}
	
	public function getCategoryByXiaoqu($xiaoqu){
		if (is_null($xiaoqu)) return [];
		$where['status']=1;
		$where['xiaoqu_id']=$xiaoqu;
		return $this->distinct(true)
			->field('category_id')
			->where($where)
			->select();
	}
}
