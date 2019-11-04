<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;

class Category extends Base
{
    public function index()
    {
        return __method__;
    }

    public function lst()
    {
        $list = model('Category')->tree(session('admin')['role']);
        // halt(session('admin')['role']);
        $this->assign('parentlist', $list);
        $this->assign('count', count($list));
        return $this->fetch();
    }

    public function add()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $id = model('Category')->save($data);
            if ($id) {
                $this->success('数据添加成功', url('category/lst'));
            } else {
                $this->error('数据添加失败');
            }
        } else {
            $xiaoqu_id = session('admin')['xiaoqu_id'];
            $categorylist = model('Category')->tree($xiaoqu_id);
            $this->assign('categorylist', $categorylist);

            $this->assign('xiaoqu_id', $xiaoqu_id);

            return $this->fetch();
        }
    }

    public function edit($id)
    {
        if (request()->isPost()) {
            $input = input('post.');
            $result = model('Category')->isUpdate(true)->save($input);
            if ($result) {
                $this->success('数据保存成功', 'category/lst', '', 1);
            } else {
                $this->error('数据保存失败');
            }
        } else if ($id) {
            $list = model('Category')->tree();
            $this->assign('parentlist', $list);
            $data = model('Category')->get($id);
            $this->assign('data', $data);
            return $this->fetch();
        }
    }

    public function delete($id)
    {
        if ($id) {
            $result = model('Category')->destroy($id);
            if ($result) {
                return $this->success('数据删除成功', 'category/lst', '', 1);
            } else {
                return $this->errot('数据删除失败');
            }
        }
    }

    public function tree()
    {
        $type = input('get.type');
        return json(model('Category')->tree($type));
    }
}
