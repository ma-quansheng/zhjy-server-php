## 项目部署

### 1 创建数据库
* 在数据库服务器上创建mysql数据库——zhjy
* 修改 项目目录/application/database.php 文件中的数据库连接参数：
```
// 服务器地址
'hostname' => '数据库服务器地址',
// 数据库名
'database' => 'zhjy',
// 用户名
'username' => '用户名',
// 密码
'password' => '密码',
// 端口
'hostport' => '3306',
```
* 登录到 mysql 数据库中，执行 项目目录下的 database.sql 文件，用以创建及初始化数据库

### 2 项目部署
* 将本项目 copy 到 web 服务器的指定目录中

### 3 安装 PHP 环境
* 在 web 服务器中安装 PHP7 以上的版本
* 开启 PHP 的 fast-cgi 功能

### 4 安装 web 服务器系统
* 在 web 服务器上安装 apache web 服务器软件系统
* 将 apache 站点根目录指向本项目目录中的 public 目录
* 重启 apache 服务器

### 5 系统运行
* 在浏览器地址栏中输入设置好的域名或 web 服务器 ip 地址，即可运行本项目
* 系统中预设有五个管理员：admin、shequ、jwh、ywh、wy，密码均为 123456；分别为系统管理员、社区管理员、居委会人员、业委会成员和物业管理员。
* 系统管理员只拥有系统设置、管理权限，不能进行具体业务操作；其他管理员只能从事与本职相关的业务操作
* 初次运行系统，先以 系统管理员（admin）登录系统，执行“系统初始化”。此功能将在系统中生成一定量的演示数据，供用户熟悉系统之用
