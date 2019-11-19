<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Db;

class Property extends Base
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
                    p.proptype_id,
                    pt.name,
                    p.begin_date,
                    p.fee_status,
                    p.amount,
                    p.discount,
                    p.status
                from property p,user u,proptype pt ';
            $where = ' where (p.user_id=u.id and p.proptype_id=pt.id) and p.status=1 ';
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
			$categorylist=model('category')->tree(5);
			$this->assign('categorylist',$categorylist);
			return $this->fetch();
    }
}
