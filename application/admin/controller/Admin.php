<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use app\common\Auth;
use think\Request;

class Admin extends Base
{
/**
 * 显示资源列表
 *
 * @return \think\Response
 */
    public function index()
    {
        // $data = model('Admin')->get(rand(1, 5));
        $data = model('Admin')->get(5);
        // halt($data);
        session('admin', $data);

        $admin = session('admin');
        $this->assign('admin', $admin);

        return $this->fetch();
    }

    public function welcome()
    {
        return $this->fetch();
    }

    public function add()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $data['password'] = Auth::encodeByMd5($data['password']);
            $id = model('Admin')->add($data);
            if ($id) {
                $this->success('数据添加成功', 'admin/admin/lst', '', 1);
            } else {
                $this->error('数据添加失败');
            }

        } else {
            $rolelist = model('Role')->getList();
            $this->assign('rolelist', $rolelist);

            $xiaoqulist = model('Xiaoqu')->getList();
            $this->assign('xiaoqulist', $xiaoqulist);

            return $this->fetch();
        }
    }

    public function lst()
    {
// $admins = model('Admin')->select();
        $where['xiaoqu_id'] = session('admin')['xiaoqu_id'];
        $admins = model('Admin')
            ->field(['id', 'username', 'realname', 'role', 'xiaoqu_id', 'status', 'create_time'])
            ->where($where)
            ->order(['xiaoqu_id' => 'asc', 'role' => 'asc', 'username' => 'asc'])
            ->paginate(7);
// halt($admins);
        $this->assign('count', count($admins));
        $this->assign('admins', $admins);

        return $this->fetch();
    }

/**
 * 显示编辑资源表单页.
 *
 * @param  int  $id
 * @return \think\Response
 */
    public function edit($id)
    {
        if (request()->isPost()) {
            $input = input('post.');
            $id = model('Admin')->isUpdate(true)->save($input);
            if ($id) {
                $this->success('数据保存成功', 'admin/admin/lst', '', 1);
            } else {
                $this->error('数据保存失败');
            }
        } else {
            $user = model('Admin')->find($id);
            $this->assign('user', $user);

            $rolelist = model('Role')->select();
            $this->assign('rolelist', $rolelist);

            $xiaoqulist = model('Xiaoqu')->select();
            $this->assign('xiaoqulist', $xiaoqulist);

            $admin = session('admin');
            $this->assign('admin', $admin);

            return $this->fetch();
        }
    }
}
