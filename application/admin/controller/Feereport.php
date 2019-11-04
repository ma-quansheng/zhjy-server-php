<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Feereport extends Controller
{
    public function index()
    {
        $select = 'select r.id,
        			r.property_id,
					p.addr,
					r.begin_date,
					r.end_date,
					r.amount,
					r.type_id,
					t.name,
					p.user_id,
					u.username,
					(case when r.is_owner_pay=1 then u.username else r.payer_name end) payer
				from feereport r,
					properties p,
					feetype t,
					user u';
        $where = ' where (r.property_id=p.id and r.type_id=t.id and p.user_id=u.id)';
        $order = ' order by r.create_time desc,u.username';

        if (request()->isPost()) {
            $data = input('post.');
            if (!empty($data['addr'])) {
                $where .= ' and p.addr like "%' . $data['addr'] . '%"';
            }
            if (!empty($data['username'])) {
                $where .= ' and u.username like "%' . $data['username'] . '%"';
            }
        }

        $list = Db::query($select . $where . $order);

        $this->assign('list', $list);
        $this->assign('addr', input('post.addr'));
        $this->assign('username', input('post.username'));

        return $this->fetch();
    }

    public function add()
    {
        if (request()->isPost()) {
            $data = input('post.');
            halt($data);
            $data['oprator'] = session('admin')['id'];
            $id = model('Feereport')->save($data);
            if ($id) {
                $this->success('数据保存成功', 'admin/feereport/index', '', 1);
            } else {
                $this->error('数据保存失败');
            }
        } else {
            $list = model('Feetype')->select();
            $this->assign('feetypelist', $list);
            return $this->fetch();
        }
    }
}
