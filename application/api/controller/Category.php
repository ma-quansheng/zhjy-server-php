<?php

namespace app\api\controller;

use think\Controller;
use think\Request;

class Category extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        // get
        $list = model('Category')->select();
		if ($list){
			return returnJSON($list,200);
		}else{
			return returnJSON([],404);
		}
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function getChildren()
    {
		$pid=request()->param()['pid']?request()->param()['pid']:0;
		$xiaoqu_id=request()->param()['xiaoqu_id'];
        return json(model('Category')->getChildren($xiaoqu_id,$pid));
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
        $input = input('post.');
        $id = model('Category')->save($input);

        if ($id) {
            return returnJSON($id,200);
        } else {
            return returnJSON([],404);
        }
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
        if (!$id) {
            return returnJSON([],404);
        }
            $data = model('Category')->select();
			if ($data){
				return returnJSON($data,200);
			}else{
				return returnJSON([],404);
			}
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        return __method__ . $id;
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        // put
        return __method__ . $id;
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        // delete
        return $id;
    }
}
