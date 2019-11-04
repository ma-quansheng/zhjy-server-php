<?php

namespace app\api\controller;

use think\Controller;
use think\Request;

class Notifies extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        // get
        $list = model('Notifies')
			->limit(6)
			->order(['create_time'=>'desc'])
			->select();
			
		if ($list){
			return json($list);
		}else{
			return [];
		}
    }

	public function lst(){
		$where['xiaoqu_id']=input('get.xiaoqu');
		$where['type_id']=input('get.type');
		$where['status']=1;
		$order=[
			'create_time'=>'desc',
			'title'=>'asc'
		];
		$list=model('Notifies')
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
    public function getNotifiesByCategory()
    {
        $catid=request()->param()['catid']?request()->param()['catid']:0;
		$xiaoqu_id=request()->param()['xiaoqu_id'];
		return json(model('Notifies')->getNotifiesByCategory($xiaoqu_id,$catid));
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
    public function read($id)
    {
        // get
		if ($id){
            $data = model('Notifies')
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
		return json(model('Notifies')->getHead(4));
	}

	public function getHot(){
		$sql='select n.id,n.title,n.type_id,n.category_id,n.xiaoqu_id,n.image,n.description,n.create_time,a.username from notifies n join admin a on n.author=a.id where n.is_hot=1';
		$list=\think\Db::query($sql);
		return json($list);
	}
	
	public function test(){
		echo "data:{usernae:'mqs',phone:'13800138000'}";
	}
}
