-- create database zhjy;
use zhjy;



/* xiaoqu	小区表 */

drop table if exists xiaoqu;
create table xiaoqu(
	id int unsigned auto_increment,
	name varchar(32) not null unique,
	jwh_id int unsigned ,
	wy_id int unsigned,
	status int default 1,
	/* -1 删除 0 失效 1 正常 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into xiaoqu(name,jwh_id) values('default',1),('test',2);


/* 系统角色表 */

drop table if exists role;
create table role(
	id int unsigned auto_increment,
	name varchar(32) not null unique,
	summary varchar(64),
	status int default 1,
	-- -1 删除 0 禁用 1 正常
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into role(name)
	values('系统管理员'),('社区管理员'),('居委会成员'),('业委会成员'),('物业管理员');
update role set summary=name;


/* admin		管理员表 */

drop table if exists admin;
create table admin(
	id int unsigned auto_increment,
	username varchar(32) not null unique,
	realname varchar(32),
	password char(32),
	photo varchar(200),
	role_id int unsigned default 0,
	/* 取自“系统管理员表” */
	login_ip varchar(32),
	login_time int default 0,
	xiaoqu_id int unsigned,
	list_order int unsigned default 0,
	status int default 1,
	/* -1 删除 0 失效 1 正常 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into admin(username,realname,password,role_id,xiaoqu_id)
	values('admin','administrator',md5('123456'),1),
				('mqs','ma quansheng',md5('123456'),1,1);

/* auth		权限表 */

drop table if exists auth;
create table auth(
	admin_id int unsigned,
	category_id int unsigned,
	granted int unsigned default 1,
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(admin_id,category_id)
) engine=myisam;


/*  业主类型*/

drop table if exists usertype;
create table usertype(
	id int unsigned auto_increment,
	name varchar(32) not null unique,
	status int default 1,
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into usertype(name)
	values('业主'),('租户');

 /* user		用户表 */

drop table if exists user;
create table user(
	id int unsigned auto_increment,
	username varchar(32) not null unique,
	realname varchar(32),
	password char(32),
	gender int default 0,
	signnature varchar(100),
	/* 个性签名 */
	photo varchar(200),
	phone varchar(11),
	token varchar(100),
	time_out int default 0,
	xiaoqu_id int unsigned default 0,
	addr varchar(64),
	usertype_id int unsigned default 1,
	/* 类型。1 业主 2 租户  */
	login_ip varchar(32),
	login_time timestamp default current_timestamp,
	status int default 1,
	/* -1 删除 0 失效 1 正常 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into user(username,realname,password,gender,phone,xiaoqu_id,addr,usertype_id)
	values('mqs','ma quansheng',md5('123456'),1,'13800138000',1,'address 1',1),
		  ('test','test user',md5('123456'),0,'13900139000',2,'address 2',2),
		  ('other','other user',md5('123456'),-1,'13900139000',2,'address 2',2);



/* jwh	居委会表 */

drop table if exists jwh;
create table jwh(
	id int unsigned auto_increment,
	name varchar(32) not null unique,
	status int default 1,
	/* -1 删除 0 失效 1 正常 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into jwh(name) values('default'),('test');


/* wy	物业表*/

drop table if exists wy;
create table wy(
	id int unsigned auto_increment,
	name varchar(32) not null unique,
	status int default 1,
	/* -1 删除 0 失效 1 正常 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;


/* category		栏目表 */

drop table if exists category;
create table category(
	id int unsigned auto_increment,
	name varchar(32) not null,
	pid int unsigned default 0,
	type_id int unsigned not null,
	/* 类型，与管理员角色相对应 2 公共 3 居委会 4 业委会 5 物业 */
	path varchar(64) not null,
	status int default 1,
	/* -1 删除 0 失效 1 正常 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into category(name,type_id)
	values('社区',2),('居委会',3),('业委会',4),('物业',5);
insert into category(name,pid,type_id)
	values('社区信息',1,2),('生活指南',1,2),('居民之家',1,2),('中介服务',1,2),
		  ('社区管理',2,3),('统计报表',2,3),('红色物业',2,3),('电子地图',2,3),('工作日志',2,3),
		  ('会议纪要',3,4),('用章记录',3,4),('财务记录',3,4),('文件存档',3,4),
		  ('综合管理',4,5),('保洁管理',4,5),('秩序管理',4,5),('绿化管理',4,5),('公共养护',4,5),('客服管理',4,5),('财务管理',4,5),('红色物业',4,5);


select t1.name,t2.name from category t1,category t2 where t1.id=t2.pid;


/* notify	通知表 */

drop table if exists notify;
create table notify(
	id int unsigned auto_increment,
	title varchar(64) not null,
	sub_title varchar(32),
	role_id int unsigned not null,
	/* 类型，与管理员角色相对应 2 公共资讯 3 居委会通知 4 业委会通知 5 物业通知 */
	xiaoqu_id int unsigned default 0,
	/* 针对某小区发送的notify，结合notifi_type可以唯一决定一类通知 0 表示针对所有小区发送 */
	category_id int unsigned,
	image varchar(255),
	/* 新闻图片 */
	content varchar(2000),
	/* 新闻内容 */
	summary varchar(100),
	/* 新闻摘要 */
	author int unsigned not null,
	/* 发布人 */
	is_position int unsigned default 0,
	/* 是否推荐到首页轮播 */
	is_hot int unsigned default 0,
	/* 是否推荐到首页热点新闻 */
	list_order int unsigned default 0,
	/* 排序 */
	status int default 1,
	/* -1 删除 0 失效 1 正常 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
 ) engine=myisam;

insert into notify(title,type_id,xiaoqu_id,category_id,author,is_position,is_hot)
	values('',floor(2+rand()*4),floor(1+rand()*2),floor(1+rand()*20),floor(1+rand()*5),round(rand()),round(rand()));

update notify set title=concat('社区资讯 ',id) where type_id=2;
update notify set title=concat('居委会资讯 ',id) where type_id=3;
update notify set title=concat('业委会资讯 ',id) where type_id=4;
update notify set title=concat('物业资讯 ',id) where type_id=5;
update notify set content=concat(title,' 内容'),summary=concat(title,' 摘要');
update notify set category_id=floor(5+rand()*4) where type_id=2;
update notify set category_id=floor(9+rand()*5) where type_id=3;
update notify set category_id=floor(14+rand()*4) where type_id=4;
update notify set category_id=floor(18+rand()*8) where type_id=5;


select n.id,n.title,n.summary,n.create_time,a.username
from notify n
join admin a on n.author=a.id
where n.status=1 and n.xiaoqu_id=2 and n.type_id=3
order by n.create_time desc, n.title;

/* talk	杂谈表（业主随意发表言论的地方） */

drop table if exists talk;
create table talk(
	id int unsigned auto_increment,
	title varchar(32) not null,
	content varchar(2000) not null,
	author int unsigned not null,
	admiring int unsigned default 0,
	reading int unsigned default 0,
	image varchar(200),
	video varchar(200),
	status int default 1,
	/* -1 删除 0 失效 1 正常 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;


/* question表 */

drop table if exists question;
create table question(
	id int unsigned auto_increment,
	title varchar(64) not null,
	image varchar(64),
	content varchar(2000) not null,
	author int unsigned not null,
	phone varchar(11) not null,
	addr varchar(64),
	/* 事发地点 */
	type_id int unsigned default 1,
	/* 1 咨询 2 投诉 3 建议 4 表扬 */
	reply varchar(2000),
	replier int unsigned,
	/* 回复人 */
	reply_time int default 0,
	/* 回复时间 */
	status int default 1,
	/* -1 删除 0 结贴 1 正常(未回复) */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;


/* telephones 电话簿 */

drop table if exists telephones;
create table telephones(
	id int unsigned auto_increment,
	telephone varchar(32) not null unique,
	title varchar(64) not null,
	status int default 1,
	/* -1 删除 0 停用 1 正常 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into telephones(telephone,title) values('119','火警'),('120','医疗急救'),('110','匪警');


/* feetype 缴费类型表 */

drop table if exists feetype;
create table feetype(
	id int unsigned auto_increment,
	name varchar(32) not null unique,
	status int default 1,
	/* 状态 -1 删除 0 停收 1 正常*/
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into feetype(name) values('物业费'),('垃圾清运费'),('装修保证金'),('车位费');


/* feereport 缴费记录 */

drop table if exists feereport;
create table feereport(
	id int unsigned auto_increment,
	summary varchar(200),
	-- 对此次缴费的说明
	property_id int unsigned not null,
	/* 缴费对象 */
	pay_time timestamp default current_timestamp,
	feetype_id int unsigned,
	/* 缴费类型 */
	begin_date date,
	/* 费用起始日期。可以早于 当前日期 */
	end_date date,
	/* 费用失效日期。可以早于 当前日期；不能早于 begin_date */
	amount numeric(8,2) default 0,
	/* 缴费金额 */
	is_owner_pay int unsigned default 1,
	/* 是否用户本人缴纳。0 否 1 是 */
	payer_name varchar(32),
	/* 非用户本人缴纳，缴纳人员姓名 */
	operator int unsigned,
	/* 经手人。当前登录的系统操作人员 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)

) engine=myisam;

insert into feereport(property_id,type_id,amount,is_owner_pay,payer_name,oprator)
	values(1,1,500,1,'',1),
		  (2,2,720,0,'mqs',1),
		  (3,3,720,0,'mqs',1),
		  (4,4,720,1,'',1),
		  (5,6,720,0,'mqs',1),
		  (6,2,720,1,'',1),
		  (7,4,720,1,'',1),
		  (8,1,720,0,'mqs',1);


/* backreport  退费记录 */

drop table if exists backreport;
create table backreport(
	id int unsigned auto_increment,
	summary varchar(200),
	-- 对此次退费的说明
	feereport_id int unsigned,
	/* 原缴费记录 id */
	property_id int unsigned not null,
	/* 退费对象 */
	back_time timestamp default current_timestamp,
	feetype_id int unsigned,
	-- 缴费类型
	amount numeric(8,2) default 0,
	/* 退费金额 */
	is_back2owner int unsigned default 1,
	/* 是否退还给用户本人。0 否 1 是 */
	back2 varchar(32),
	/* 非退还给用户本人，退还人员姓名 */
	oprator int unsigned,
	/* 经手人。当前登录的系统操作人员 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)

) engine=myisam;


/* proptype 物业类型表 */

drop table if exists proptype;
create table proptype(
	id int unsigned auto_increment,
	name varchar(32) not null unique,
	summary varchar(100),
	status int default 1,
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into proptype(name)
	values('房产'),('车位');


/* property 物业表 */

drop table if exists property;
create table property(
	id int unsigned auto_increment,
	user_id int unsigned,
	addr varchar(32) not null unique,
	/* 房产楼门号；车辆牌照号 */
	proptype_id int unsigned default 1,
	/* 物业类型 1 房产 2 车位 */
	summary varchar(200),
	/* 描述 */
	status int default 1,
	fee_status int default 1,
	/* 缴费状态。0 停缴 1 正常 2 欠费 3 优惠 */
	discount numeric(8,2) default 0,
	/* 优惠金额 */
	is_lease int default 0,
	/* 是否已出租 */
	is_arrears int default 0,
	/* 是否欠费 */
	begin_date date,
	/* 欠费开始日期 */
	amount numeric(8,2),
	/* 累计欠费金额 */
	create_time timestamp default current_timestamp,
	update_time timestamp on update current_timestamp,
	delete_time int unsigned default null,
	primary key(id)
) engine=myisam;

insert into property(user_id,addr,proptype_id)
	values(1,'新凯东里6-3-401',1),(2,'津N67185',2);

	
/* 查询用户名下的物业 */

select id,addr,(case property_type when 1 then '房产' when 2 then '车位' else '未知' end) as property_name,is_lease,is_arrears,status from property;

select p.id,p.user_id,u.username,p.addr,p.property_type,pt.name,p.begin_date,p.fee_status,p.amount,p.discount
from property p,user u,proptype pt
where (p.user_id=u.id and p.property_type=pt.id) and p.status=1;


/* 查询用户缴费记录 */

select r.id,p.addr,pay_time,t.name,r.amount,r.is_owner_pay,r.payer_name
from feereport r,property p,feetype t
where (r.property_id=p.id and r.type_id=t.id) and r.property_id in (select id from property where user_id=1);


select r.id,p.addr,pay_time,t.name,r.amount,(case when r.is_owner_pay=1 then u.username else r.payer_name end) payer from feereport r,property p,feetype t,user u where (r.property_id=p.id and r.type_id=t.id) and u.id=1 and r.id = 3;


/* 查询所有的缴费记录 */

select r.property_id,
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
	property p,
	feetype t,
	user u
where (r.property_id=p.id
	and r.type_id=t.id
	and p.user_id=u.id)
order by r.create_time desc, u.username;

