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
		$ps=config('app_config.pageSize');
		$skip=$ps*input('get.page');
		$author=input('get.author');
		$status=input('get.status');
		$where['author']=$author;
		$where['status']=is_null($status)?['<>',-1]:$status;
		$order=[
			'create_time'=>'desc',
			'title'=>'asc'
		];
		$list=model('question')->order($order)->where($where)->limit($skip,$ps)->select();
		// halt(model('question')->getLastSql());
		return json($list);
	}
	
	public function read(){
		$id=input('get.id');
		$data=model('question')->get($id);
		return json($data);
	}
	
	public function create(){
		$data=input('post.');
		$id=model('question')->save($data);
		return $id;
	}
}
