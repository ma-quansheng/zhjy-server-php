<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
use think\Db;

class Properties extends Controller
{
    public function lstByUser(){
		$id=input('get.id');
		$sql="select id,addr,
			(case property_type when 1 then '房产' when 2 then '车位' else '未知' end) as property_name,
			is_lease,is_arrears,status 
			from properties
			where user_id=?";
		$data=db::query($sql,[$id]);
		return json($data);
	}
	
	public function add(){
		$data=input('post.');
		$id=model('Properties')->save($data);
	}
	
	public function read(){
		$id=input('get.id');
		$data=model('Properties')->get($id);
		return json($data);
	}
	
	public function update($id){
		$data=input('post.');
		// halt($data);
		$id=model('Properties')->isUpdate(true)->save($data,['id'=>$id]);
	}
	
	public function delete($id){
		$id=db('properties')->delete($id);
		return $id;
	}
}
