<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Controller;

class Notify extends Base
{
    public function add()
    {
        if (request()->isPost()) {
            $input = input('post.');
            $id = model('Notify')->allowField(true)->save($input);
            if ($id) {
                return $this->success('数据保存成功', 'admin/notify/lst', '', 1);
            } else {
                return $this->error('数据添加失败');
            }
        } else {
            $categories = model('Category')->tree(getCurrentUser()['role_id']);
            $this->assign('categories', $categories);
            $this->assign('admin', getCurrentUser());
            // halt(getCurrentUser());
            return $this->fetch();
        }
    }

    public function lst()
    {
        $role_id = getCurrentUser()['role_id'];
        $categories = model('Category')->tree($role_id);
        // halt($categories);
        $this->assign('categories', $categories);
        $this->assign('cate_id', 0);

        if (request()->isPost() && input('post.category_id') != 0) {
            $cate_id = input('post.category_id');
            $this->assign('cate_id', $cate_id);
            $where = [
                'status' => 1,
                'role_id' => $role_id,
                'category_id' => $cate_id,
            ];
        } else {
            $where = [
                'status' => 1,
                'role_id' => $role_id,
            ];
        }
        $list = model('Notify')
            ->field(['id', 'title', 'sub_title', 'category_id', 'summary', 'is_position', 'is_hot', 'author', 'create_time'])
            ->where($where)
            ->order(['create_time' => 'desc', 'category_id' => 'asc', 'list_order' => 'asc'])
            ->paginate(6);

        $this->assign('type', $role_id);
        $this->assign('list', $list);
        $this->assign('count', count($list));
        // $this->assign('page',$page);

        return $this->fetch();
    }

    public function edit($id)
    {
			// halt(input('post.'));
        if (request()->isPost()) {
            $input = input('post.');
            $id = model('Notify')->allowField(true)->isUpdate(true)->save($input);
            if ($id) {
                $this->success('数据保存成功', 'admin/notify/lst', '', 1);
            } else {
                $this->error('数据保存失败');
            }
        } else if ($id) {
            // $data = model('Notify')->get($id);
            $data = model('Notify')->get($id);
            $list = model('Category')->tree(getCurrentUser()['role_id']);
            $this->assign('list', $list);
            $this->assign('data', $data);
            return $this->fetch();
        }
    }

    public function showById($id)
    {
        // halt($id);
        $data = model('Notify')->get($id);
        $this->assign('data', $data);
        return $this->fetch('show');
    }

    public function showByCategory($id)
    {
        $data = model('Notify')->all(['category_id' => $id]);
        $this->assign('data', $data);
        return $this->fetch('show');
    }

    public function delete($id)
    {
        $data = [
            'status' => -1,
        ];
        $id = model('Notify')->isUpdate(true)->save($data, ['id' => $id]);
        if ($id) {
            $this->success('数据删除成功', 'admin/notify/lst', '', 1);
        } else {
            $this->error('数据删除失败');
        }
    }
}
