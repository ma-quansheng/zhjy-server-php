<?php

namespace app\api\controller;

use think\Controller;
use think\Request;

class Xiaoqu extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        // get
        $list = model('Xiaoqu')->select();
        return json($list);
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
        $id = model('Xiaoqu')->save($input);

        if ($id) {
            $this->success('数据保存成功', 'admin/xiaoqu/lst', '', 1);
            return $id;
        } else {
            $this->error('数据保存失败');
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
            $data = model('Xiaoqu')->select();
            return json($data);
        } catch (\Exception $e) {
            $this->error('数据不存在');
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
        $data = model('Xiaoqu')->select();
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
        $id = model('Xiaoqu')->destroy($id);
        return $id;
    }
}
