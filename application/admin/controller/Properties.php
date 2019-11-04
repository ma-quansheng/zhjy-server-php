<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Db;

class Properties extends Base
{
    public function lstByUser()
    {
        if (request()->isPost()) {
            $username = input('post.username');
            // halt($id);
            $select = 'select
                    p.id,
                    p.user_id,
                    u.username,
                    p.addr,
                    p.property_type,
                    pt.name,
                    p.begin_date,
                    p.fee_status,
                    p.amount,
                    p.discount,
                    p.status
                from properties p,user u,proper_type pt ';
            $where = ' where (p.user_id=u.id and p.property_type=pt.id) and p.status=1 ';
            if (!empty($username)) {
                $where .= ' and username like "%' . $username . '%"';
            }
            $order = ' order by p.addr';
            $list = Db::query($select . $where . $order);
        } else {
            $list = [];
            $username = '';
        }
        $this->assign('username', $username);
        $this->assign('list', $list);
        return $this->fetch('lst');
    }

    public function add()
    {
        return $this->fetch();
    }
}
