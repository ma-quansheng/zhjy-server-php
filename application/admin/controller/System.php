<?php

namespace app\admin\controller;

use app\admin\controller\Base;

class System extends Base
{
    public function addUserType()
    {
        $list = model('Usertype')->select();
        $this->assign('list', $list);
        return $this->fetch('system/add');
    }

		public function init(){

			// xiaoqu
			$data=[['name'=>'default'],['name'=>'test']];
			db('xiaoqu')->insertAll($data);
			
			// role
			db()->execute('truncate table role');
			$data=[
				['name'=>'系统管理员','summary'=>'系统管理员'],
				['name'=>'社区管理员','summary'=>'社区管理员'],
				['name'=>'居委会成员','summary'=>'居委会成员'],
				['name'=>'业委会成员','summary'=>'业委会成员'],
				['name'=>'物业管理员','summary'=>'物业管理员'],
			];
			db('role')->insertAll($data);
			
			// admin
			db()->execute('truncate table admin');
			$data=[
				['username'=>'admin','realname'=>'adminstrator','password'=>'123456','role_id'=>1,'xiaoqu_id'=>rand(1,2)],
				['username'=>'shequ','realname'=>'shequ admin','password'=>'123456','role_id'=>2,'xiaoqu_id'=>rand(1,2)],
				['username'=>'jwh','realname'=>'jwh admin','password'=>'123456','role_id'=>3,'xiaoqu_id'=>rand(1,2)],
				['username'=>'ywh','realname'=>'ywh admin','password'=>'123456','role_id'=>4,'xiaoqu_id'=>rand(1,2)],
				['username'=>'wy','realname'=>'wy admin','password'=>'123456','role_id'=>5,'xiaoqu_id'=>rand(1,2)],
			];
			db('admin')->insertAll($data);
			
			// usertype
			db()->execute('truncate table usertype');
			$data=[
				['name'=>'业主'],
				['name'=>'租户'],
			];
			db('usertype')->insertAll($data);
			
			// user
			db()->execute('truncate table user');
			$data=[
				['username'=>'mqs','realname'=>'ma quansheng','password'=>'123456','gender'=>rand(0,1),'usertype_id'=>rand(1,2),'xiaoqu_id'=>rand(1,2)],
				['username'=>'test','realname'=>'test','password'=>'123456','gender'=>rand(0,1),'usertype_id'=>rand(1,2),'xiaoqu_id'=>rand(1,2)],
			];
			db('user')->insertAll($data);

			// notify
			db()->execute('truncate table notify');
			$data=[];
			for ($i=0;$i<100;$i++){
				$role_id=rand(1,4);
				$cate=db()->query('select id from category where id='.$role_id.' or pid='.$role_id);
				$cate_id=rand(1,count($cate));
				// halt($cate[$cate_id-1]['id']);
				$title=db('category')->where('id',$cate[$cate_id-1]['id'])->find()['name'];
				array_push($data,
					['title'=>$title.' 资讯 标题',
					 'role_id'=>$role_id+1,
					 'xiaoqu_id'=>rand(1,2),
					 'category_id'=>$cate[$cate_id-1]['id'],
					 'content'=>$title.' 资讯 内容',
					 'summary'=>$title.' 资讯 简介',
					 'author'=>rand(2,5),
					 'is_position'=>rand(0,1),
					 'is_hot'=>rand(0,1)
					]);
			}
			db('notify')->insertAll($data);

			// property
			db()->execute('truncate table property');
			$data=[
				['user_id'=>1,'addr'=>'小白楼五大道小洋楼','proptype_id'=>1,'summary'=>'我的房产','fee_status'=>1,'discount'=>0,'is_lease'=>0,'is_arrears'=>0,'amount'=>0],
				['user_id'=>1,'addr'=>'津N67185','proptype_id'=>2,'summary'=>'津牌汽车','fee_status'=>2,'discount'=>0,'is_lease'=>1,'is_arrears'=>1,'amount'=>100],
				['user_id'=>1,'addr'=>'京Q12345','proptype_id'=>2,'summary'=>'京牌轿车','fee_status'=>0,'discount'=>0,'is_lease'=>0,'is_arrears'=>1,'amount'=>200],
			];
			db('property')->insertAll($data);
			
			
			// feetype
			db()->execute('truncate table feetype');
			$data=[
				['name'=>'物业费'],
				['name'=>'垃圾清运费'],
				['name'=>'装修保证金'],
				['name'=>'车位费'],
			];
			db('feetype')->insertAll($data);
			
			// feereport
			db()->execute('truncate table feereport');
			$data=[];
			for ($i=0;$i<100;$i++){
				$property_id=rand(1,2);
				$addr=db('property')->where('id',$property_id)->find()['addr'];
				$feetype_id=$property_id==1?rand(1,3):4;
				$name=db('feetype')->where('id',$feetype_id)->find()['name'];
				$is_owner_pay=rand(0,1);
				$payer_name=$is_owner_pay==0?'代缴':'';
				array_push($data,
					['summary'=>$addr.' '.$name,
					 'property_id'=>$property_id,
					 'feetype_id'=>$feetype_id,
					 'amount'=>rand(100,500),
					 'is_owner_pay'=>$is_owner_pay,
					 'payer_name'=>$payer_name,
					 'operator'=>rand(2,5)
					]
				);
			}
			db('feereport')->insertAll($data);

		}
}
