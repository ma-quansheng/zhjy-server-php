<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;

class Image extends Base
{
    public function upload()
    {
        $file = Request::instance()->file('file');
        $info = $file->move('upload');
        if ($info && $info->getPathname()) {
            $data = [
                "code" => '200',
                "msg" => 'ok',
                "data" => '/' . $info->getpathname(),
            ];
            echo json_encode($data);
            // or
            // return $this->result($info->getPathname(),200,'ok');
        } else {
            echo json_encode($this->result([], 500, 'faild'));
        }
        exit;
    }
}
