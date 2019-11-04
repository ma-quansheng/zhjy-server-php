<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Feetype extends Controller
{
    public function index(){
		$list=model('Feetype')->select();
		$this->assign('list',$list);
		$this->assign('count',count($list));
		return $this->fetch();
	}
	
	public function add(){
		if (request()->isPost()){
			$id=model('Feetype')->save(input('post.'));
			if ($id){
				$this->success('数据添加成功','admin/feetype/index','',1);
			}else{
				$this->error('数据添加失败');
			}
		}else{
			return $this->fetch();
		}
	}
	
	public function edit($id){
		if (request()->isPost()){
			$id=model('Feetype')->isUpdate(true)->save(input('post.'));
			if ($id){
				$this->success('数据保存成功','admin/feetype/index','',1);
			}else{
				$this->error('数据保存失败');
			}
		}else{
			$data=model('Feetype')->get($id);
			$this->assign('data',$data);
			return $this->fetch();
		}
	}
	
	public function delete($id){
		if ($id) {
		    $result = model('Feetype')->destroy($id);
		    if ($result) {
		        return $this->success('数据删除成功', 'admin/feetype/index', '', 1);
		    } else {
		        return $this->errot('数据删除失败');
		    }
		}
	}
}
