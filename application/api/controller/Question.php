<?php

namespace app\api\controller;

use think\Controller;
use think\Request;

class Question extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        // get
    }

	public function lst(){
		$author=input('get.author');
		$status=input('get.status');
		$where['author']=$author;
		$where['status']=is_null($status)?['<>',-1]:$status;
		$order=[
			'create_time'=>'desc',
			'title'=>'asc'
		];
		$list=model('question')->order($order)->where($where)->select();
		return json($list);
	}
	
	public function read(){
		$id=input('get.id');
		$data=model('question')->get($id);
		return json($data);
	}
}
