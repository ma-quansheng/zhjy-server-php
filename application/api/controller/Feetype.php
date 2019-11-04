<?php

namespace app\api\controller;

use think\Controller;
use think\Request;

class Feetype extends Controller
{
    public function index(){
		$list=model('Feetype')->select();
		return json($list);
	}
}
