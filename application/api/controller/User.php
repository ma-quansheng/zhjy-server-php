<?php

namespace app\api\controller;

use think\Controller;
use think\Request;

class User extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        // get
        $list = model('User')->select();
        // $list = db('user')->select();
        if ($list) {
            // return json($list);
            return returnJSON($list, 200);
        } else {
            return returnJSON([], 404);
        }
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        // get
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
        $id = model('User')->save($input);

        if ($id) {
            return returnJSON($id, 200);
        } else {
            return returnJSON([], 404);
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
            return;
        }
        try {
            $data = model('User')->select();
            if ($data) {
                return returnJSON($data, 200);
            } else {
                return returnJSON([], 404);
            }
        } catch (\Exception $e) {
            return returnJSON([], 500);
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
        //
        $data = model('User')->select();
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
        $id = model('User')->destroy($id);
        if ($id) {
            return returnJSON($id, 200);
        } else {
            return returnJSON([], 404);
        }
    }

    public function login()
    {
        if (!request()->isPost()) {
            $this->error('页面不存在');
        }

        $input = input('post.');

    }

    public function logout()
    {}
}
