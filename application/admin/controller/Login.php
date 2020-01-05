<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Controller;
use think\Request;

class Login extends Base
{
    public function _initialize()
    {}

    public function login()
    {
        if (\getCurrentUser()) {
            return $this->redirect('admin/admin/index');
        } else {
            return $this->fetch();
        }
    }

    public function check()
    {
        if (request()->isPost()) {

            // 取出post数据
            $input = input('post.');
            // if (!captcha_check($input['code'])) {
            //     $this->error('验证码错误');
            // }
            // 验证 用户名、密码 是否正确
						$user=db('admin')->where('username',$input['username'])->find();
						// halt($user);

            if (!$user || $user['status'] <= 0) {
                return '用户不存在';
            }
						
            if (Auth::encodeByMd5($input['username'].$input['password']) != $user['password']) {
                return '密码错误';
            }

            // 保存 用户登录时间、客户端ip
            $u = [
                'login_ip' => request()->ip(),
                'login_time' => time(),
            ];
            try {
                // 在 session 中保存 用户登录信息
                // session(config('app_config.admin_session'), $user, config('app_config.admin_session_scope'));
								\setCurrentUser($user);
                model('Admin')->save($u, ['id' => $user['id']]);
                return $this->success('登录成功....', 'admin/admin/index', '', 1);
            } catch (Exception $e) {
                $this->error($e->getMessage());
            }

        } else {
            return $this->error('请求不合法');
        }
    }

    public function logout()
    {
        \clearCurrentUser();
        $this->redirect('admin/login/login');
    }

    public function regist()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $data['password'] = Auth::encodeByMd5($data['username'].$data['password']);
            $id = model('Admin')->add($data);
            if ($id) {
                $this->success('数据添加成功', 'admin/login/login', '', 1);
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
}
