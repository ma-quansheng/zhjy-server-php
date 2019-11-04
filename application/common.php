<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
if (!function_exists('encodeByMd5')) {
    /**
     * 获取语言变量值
     * @param string    $name 语言变量名
     * @param array     $vars 动态变量值
     * @param string    $lang 语言
     * @return mixed
     */
    function encodeByMd5($str = '')
    {
        return md5($str);
    }

    function returnJSON($data, $code = 200)
    {
        if ($code == 200) {
            return json([
                'statusCode' => $code,
                'statusText' => config('app_config.http_code')[$code],
                'data' => $data,
            ]);
        } else {
            return json([
                'statusCode' => $code,
                'statusText' => config('app_config.http_code')[$code],
                'data' => $data,
            ]);
        }
    }

    function getStatus($id)
    {
        if (is_null($id)) {
            $id = 0;
        }

        $map = [-1 => '删除', 0 => '禁用', 1 => '正常'];
        return $map[$id];
    }

    function getAdminName($id)
    {
        if (is_null($id)) {
            return '';
        }

        return model('Admin')->field('username')->where('id', $id)->find()['username'];
    }

    function getCategoryName($id)
    {
        // halt($id);
        if (is_null($id)) {
            return '';
        }

        return model('Category')->field(['name'])->where('id', $id)->find()['name'];
    }

    function getRoleName($id)
    {
        if (is_null($id)) {
            return '';
        }

        return model('Role')->field(['name'])->find($id)['name'];
    }

    function getXiaoquName($id)
    {
        if (is_null($id)) {
            return '';
        }

        return model('Xiaoqu')->field(['name'])->find($id)['name'];
    }

    function getGenderName($id)
    {
        if (is_null($id)) {
            return '未知';
        }

        $map = [-1 => '未知', 0 => '女', 1 => '男'];
        return $map[$id];
    }

    function getUserTypeName($id)
    {
        if (is_null($id)) {
            return '未知';
        }

        $map = [1 => '业主', 2 => '租户'];
        return $map[$id];
    }

    function getPropertyTypeName($id)
    {
        if (!isset($id)) {
            return '未知';
        }
        $map = [1 => '房产', 2 => '车位'];
        return $map[$id];
    }

    function getLeaseName($id)
    {
        if (!isset($id)) {
            return '未知';
        }
        $map = [1 => '出租', 0 => '自用'];
        return $map[$id];
    }

    function getArrearsName($id)
    {
        if (!isset($id)) {
            return '未知';
        }
        $map = [1 => '欠费', 0 => '未欠费'];
        return $map[$id];
    }

    function getFeeStatus($id)
    {
        if (!isset($id)) {
            return '未知';
        }
        $map = [0 => '暂停缴费', 1 => '正常缴费', 2 => '欠费', 3 => '优惠'];
        return $map[$id];
    }
}
