<?php

namespace app\api\controller;

use think\Controller;
use Firebase\JWT\JWT;

class Base extends Controller
{
	protected 		$_key='idnbk)&djfhvbf$%$nou<?$#$%#evkfbh';

    public function _initialize(){
		parent::_initialize();
	}
	
	public function setToken($data){
		$_token=[
			"iat"=>time(),
			"nbf"=>time(),
			"data"=>$data,
		];
		
		$_jwt=JWT::encode($_token,$this->_key);
		return json(['token'=>$_jwt])->send();
	}
	
	public function getToken($data){
		$_token= JWT::decode($data, $this->_key, array('HS256'));
		return json(['data'=>$_token])->send();
	}
}
