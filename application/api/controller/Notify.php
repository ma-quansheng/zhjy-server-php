<?php

namespace app\api\controller;

use think\Controller;
use think\Request;

class Notify extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        // get
        $list = model('Notify')
			->limit(6)
			->order(['create_time'=>'desc'])
			->select();
			
		if ($list){
			return json($list);
		}else{
			return [];
		}
    }

	public function getListByXiaoqu(){
		$ps=config('app_config.pageSize');
		$skip=$ps*input('get.page');
		$xiaoqu_id=input('get.xiaoqu');
		$list=model('notify')
			->where('xiaoqu_id',$xiaoqu_id)
			->order(['create_time'=>'desc'])
			->limit($skip,$ps)
			->select();
			// halt(model('notify')->getLastSql());
		return $list?JSON($list):[];
	}
	public function lst(){
		$where['xiaoqu_id']=input('get.xiaoqu');
		$where['role_id']=input('get.role');
		$where['status']=1;
		$order=[
			'create_time'=>'desc',
			'title'=>'asc'
		];
		$list=model('Notify')
			->order($order)
			->where($where)
			->select();
		return json($list);
	}
	
	public function getCategoryByXiaoqu(){
		$xiaoqu=input('get.xiaoqu');
		$where['status']=1;
		$where['xiaoqu_id']=$xiaoqu;
		return json(\think\Db::query('
		select distinct notifies.type_id,
			   category.name 
		  from notifies,category 
		 where notifies.type_id=(category.id+1) 
		   and notifies.xiaoqu_id=?
		',[$xiaoqu]));
	}
    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function getNotifyByCategory()
    {
        $catid=request()->param()['catid']?request()->param()['catid']:0;
		$xiaoqu_id=request()->param()['xiaoqu_id'];
		return json(model('Notify')->getNotifyByCategory($xiaoqu_id,$catid));
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        // post
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read()
    {
			// get
			$id=input('get.id');
			if ($id){
				$data = model('Notify')
					->alias('a')
					->join('admin b','a.author=b.id')
					->find($id);
				if ($data){
					return json($data);
				}
			}
			return [];
    }
	
	public function getHead(){
		return json(model('Notify')->getHead(4));
	}

	public function getHot(){
		// halt(\input('get.page'));
		$ps=\config('app_config.pageSize');
		$skip=$ps*\input('get.page');
		$sql='select 
						n.id, 
						n.title, 
						n.role_id, 
						n.category_id, 
						n.xiaoqu_id, 
						n.image, 
						n.summary, 
						n.create_time, 
						a.username 
					from notify n join admin a on n.author=a.id 
					where n.is_hot = 1 
					limit ' . $skip . ', ' . $ps;
		// halt($sql);
		$list=\think\Db::query($sql);
		return json($list);
	}
	
	public function test(){
		echo "data:{usernae:'mqs',phone:'13800138000'}";
	}
}
