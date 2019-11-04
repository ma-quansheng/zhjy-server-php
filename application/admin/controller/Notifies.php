<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Controller;

class Notifies extends Base
{
    public function add()
    {
        if (request()->isPost()) {
            $input = input('post.');
            $id = model('Notifies')->allowField(true)->save($input);
            if ($id) {
                return $this->success('数据保存成功', 'admin/news/lst', '', 1);
            } else {
                return $this->error('数据添加失败');
            }
        } else {
            $categories = model('Category')->tree(session('admin')['role']);
            $this->assign('categories', $categories);
            $this->assign('admin', session('admin'));
            // halt(session('admin'));
            return $this->fetch();
        }
    }

    public function lst()
    {
        $type = session('admin')['role'];
        $categories = model('Category')->tree($type);
        // halt($categories);
        $this->assign('categories', $categories);
        $this->assign('cate_id', 0);

        if (request()->isPost() && input('post.category_id') != 0) {
            $cate_id = input('post.category_id');
            $this->assign('cate_id', $cate_id);
            $where = [
                'status' => 1,
                'type_id' => $type,
                'category_id' => $cate_id,
            ];
        } else {
            $where = [
                'status' => 1,
                'type_id' => $type,
            ];
        }
        $list = model('Notifies')
            ->field(['id', 'title', 'sub_title', 'category_id', 'description', 'is_position', 'is_hot', 'author', 'create_time'])
            ->where($where)
            ->order(['create_time' => 'desc', 'category_id' => 'asc', 'list_order' => 'asc'])
            ->paginate(6);

        $this->assign('type', $type);
        $this->assign('list', $list);
        $this->assign('count', count($list));
        // $this->assign('page',$page);

        return $this->fetch();
    }

    public function edit($id)
    {
        if (request()->isPost()) {
            $input = input('post.');
            $id = model('Notifies')->isUpdate(true)->save($input);
            if ($id) {
                $this->success('数据保存成功', 'admin/news/lst', '', 1);
            } else {
                $this->error('数据保存失败');
            }
        } else if ($id) {
            // $data = model('Notifies')->get($id);
            $data = model('Notifies')->get($id);
            $list = model('Category')->tree(session('admin')['role']);
            $this->assign('list', $list);
            $this->assign('data', $data);
            return $this->fetch();
        }
    }

    public function showById($id)
    {
        // halt($id);
        $data = model('Notifies')->get($id);
        $this->assign('data', $data);
        return $this->fetch('show');
    }

    public function showByCategory($id)
    {
        $data = model('Notifies')->all(['category_id' => $id]);
        $this->assign('data', $data);
        return $this->fetch('show');
    }

    public function delete($id)
    {
        $data = [
            'status' => -1,
        ];
        $id = model('Notifies')->isUpdate(true)->save($data, ['id' => $id]);
        if ($id) {
            $this->success('数据删除成功', 'admin/notifies/lst', '', 1);
        } else {
            $this->error('数据删除失败');
        }
    }
}
