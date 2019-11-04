<?php

namespace app\api\controller;
use think\Controller;

class Telephone extends Controller{
	
	public function index(){
		$list=model('Telephone')->select();
		return json($list);
	}
}
