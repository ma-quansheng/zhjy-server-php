<?php

namespace app\admin\controller;

use think\Controller;

class Test extends Controller
{
    public function index()
    {
        return __method__;
    }

    public function getChild()
    {
        return json(model('Category')->getChild(0));
    }

    public function save()
    {

    }

    public function read($id)
    {}

    public function edit($id)
    {}

    public function update($id)
    {}

    public function delete($id)
    {}
}
