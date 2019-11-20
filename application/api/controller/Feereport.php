<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
use think\Db;

class Feereport extends Controller
{
    public function lst(){
		// halt(input('get.'));
		$ps=\config('app_config.pageSize');
		$skip=$ps*\input('get.page');
		$sql='select r.id,p.addr,pay_time,t.name,r.amount,r.is_owner_pay,r.payer_name from feereport r,property p,feetype t where (r.property_id=p.id and r.feetype_id=t.id) and r.feetype_id=? and r.property_id in (select id from property where user_id=?) order by r.create_time desc,r.feetype_id asc limit ?,?';
		$list=Db::query($sql,[input('get.feetype'),input('get.user'),$skip,$ps]);
		
		return json($list);
	}
	
	public function lstByUser(){
		$ps=\config('app_config.pageSize');
		$skip=$ps*\input('get.page');
		$sql='select r.id,p.addr,pay_time,t.name,r.amount,r.is_owner_pay,r.payer_name from feereport r,property p,feetype t where (r.property_id=p.id and r.feetype_id=t.id) and r.property_id in (select id from property where user_id=?) limit ?,?';
		$list=Db::query($sql,[input('get.user'),$skip,$ps]);
		
		return json($list);
	}
	
	public function read(){
		// $sql='select r.id,p.addr,pay_time,t.name,r.amount,(case when r.is_owner_pay=1 then "自付" else r.payer_name end) payer from feereport r,property p,feetype t where (r.property_id=p.id and r.feetype_id=t.id) and r.id = ?';
		
		$sql='select r.id,p.addr,pay_time,t.name,r.amount,r.begin_date,r.end_date,(case when r.is_owner_pay=1 then u.username else r.payer_name end) payer from feereport r,property p,feetype t,user u where (r.property_id=p.id and r.feetype_id=t.id) and u.id=? and r.id = ?';
		
		$list=Db::query($sql,[input('get.user'),input('get.id')]);
		
		return json($list);
	}
	
}
