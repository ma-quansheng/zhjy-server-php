<?php

namespace app\admin\controller;

use app\admin\controller\Base;

class User extends Base
{
    public function index()
    {
        return __method__;
    }

    public function lst()
    {
        $where = ' where (u.xiaoqu_id=x.id and u.usertype_id=t.id) and u.status=1 and u.xiaoqu_id=' . session('admin')['xiaoqu_id'];
        $keyword = input('get.keyword');

        if (!empty($keyword)) {
            $where .= ' and u.username like "%' . $keyword . '%"';
        }

        $select = 'select u.id,
                       u.username,
                       u.realname,
                       u.gender,
                       u.phone,
                       u.xiaoqu_id,
                       x.name as xiaoqu,
                       u.addr,
                       u.usertype_id,
                       t.name as usertype,
                       u.status
                  from user u,xiaoqu x,usertype t';

        $count = count(\think\Db::query($select . $where));
        $page = 1;
        $pageSize = config('app_config.pageSize');
        if (!empty(input('get.page'))) {
            $page = (input('get.page') - 1) * $pageSize;
        }

        $limit = ' limit ' . $page . ',' . $pageSize;
        $order = ' order by u.username ';
        $sql = $select . $where . $order . $limit;

        $list = \think\Db::query($sql);
        // dump($list);exit;
        $this->assign('list', $list);
        $this->assign('keyword', $keyword);
        $this->assign('limit', $pageSize);
        $this->assign('curr', input('get.page'));
        $this->assign('count', $count);
        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }

    public function edit($id)
    {
        return $this->fetch();
    }

    public function delete()
    {
        $id = input('get.');
        model('User')->destroy($id);
        return $this->fetch();
    }
}
