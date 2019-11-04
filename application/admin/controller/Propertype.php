<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Db;

class Propertype extends Base
{
    public function lst()
    {
        $sql = 'select * from proper_type where status<>-1 order by name';
        $list = Db::query($sql);
        $this->assign('list', $list);
        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }

    public function edit($id)
    {
        $data = Db::query('select * from proper_type where id=?', [$id])[0];
        // halt($data);
        // echo Db::getLastSql();
        $this->assign('data', $data);
        return $this->fetch();
    }

    public function save()
    {
        $data = input('post.');
        if (!empty($data['id'])) {
            $id = model('Propertype')->isUpdate(true)->save($data, ['id' => $data['id']]);
        } else {
            $id = model('Propertype')->save($data);
        }
        if ($id) {
            $this->success('数据保存成功', 'admin/propertype/lst', '', 1);
        } else {
            $this->error('数据保存失败');
        }
    }

    public function delete($id)
    {
        // halt($id);
        $sql = 'update proper_type set status=-1 where id=' . $id;
        $id = Db::execute($sql);
        if ($id) {
            $this->success('数据删除成功', 'admin/propertype/lst', '', 1);
        } else {
            $this->error('数据删除失败');
        }
    }
}
