<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;

Route::rule([
	'news/:id'=>'@api/notifies/read',
	'news'=>'@api/notifies/lst',
]);
// Route::resource('test', 'admin/test');
// Route::get('api/notifies/:id','api/notifies/read');
// Route::get('api/position','api/notifies/getHead');
// Route::get('api/hotnews','api/notifies/getHot');
// Route::get('api/notifies/:id','api/notifies/read');
// Route::get('api/notifies/:xiaoqu_id/[:catid]','api/notifies/getNotifiesByCategory');
// Route::get('api/children/:xiaoqu_id/[:pid]','api/category/getChildren');
// Route::get('admin/login', 'admin/admin/login');
// Route::get('api/login', 'api/user/login');
// Route::resource('user', 'api/user');
// Route::resource('category', 'api/category');
