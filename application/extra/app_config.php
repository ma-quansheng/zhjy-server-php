<?php
return [
    // 加密
    'aes' => [
        'key' => '',
        'method' => 'AES-128-ECB',
        'iv' => 'CBC',
        'options' => 0,
    ],

    'md5' => [
        'salt' => '',
    ],

    // header crypt
    'header_crypt_string' => 'sign',

    // session 相关
    'admin_session' => 'admin',
    'admin_session_scope' => 'admin',
    'user_session' => 'user',
    'user_session_scope' => 'user',

    // 状态相关
    'status_delete' => -1,
    'status_normal' => 1,
    'status_invalid' => 0,

    // 业主类型
    'type_owner' => 1,
    'type_tenant' => 2,

    // 咨询类型
    'question_consultation' => 1,
    'question_complaint' => 2,
    'question_proposal' => 3,
    'question_praise' => 4,

    // code of result
    'http_code' => [
        200 => '请求成功',
        400 => '请求错误',
        401 => '请求未授权',
        403 => '请求被拒绝',
        404 => '请求失败',
        408 => '请求超时',
        500 => '服务器错误',
        502 => '网关错误',
        503 => '服务器超时',
    ],

    //
    'position_num' => 5,
    'hot_num' => 10,
    'pageSize' => 12,

];
