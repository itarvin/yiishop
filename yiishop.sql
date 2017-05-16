create database yiishop;
use yiishop;
set names gbk;

drop table if exists shop_admin;
create table shop_admin
(
	adminid int unsigned not null auto_increment comment '用户Id',
	adminuser varchar(32) not null default '' comment '用户名',
	adminpass varchar(32) not null default '' comment '密码',
	adminemail varchar(50) not null default '' comment '邮件',
	logintime int unsigned not null default '0' comment '登录时间',
	loginip bigint not null default '0' comment '登录IP',
	createtime int unsigned not null default '0' comment '注册时间',
	primary key(adminid),
	key adminuser(adminuser),
	key adminpass9(adminpass),
	key adminemail(adminemail)
)engine = InnoDB default charset=utf8 comment "商城管理员表";


insert into shop_admin (adminid,adminuser,adminpass,adminemail,createtime) values('1','itarvin','be140e0fb8126d278d0d823ddd4fab2a','itarvin@163.com',UNIX_TIMESTAMP());


drop table if exists shop_user;
create table shop_user
(
	userid bigint unsigned not null auto_increment comment '主键ID',
	username varchar(32) not null default '' comment '用户名',
	userpass varchar(32) not null default '' comment '密码',
	useremail varchar(100) not null default '' comment '邮箱',
	createtime int unsigned not null default '0' comment '创建时间',
	primary key(userid),
	key username(username),
	key useremail(useremail)
)engine = InnoDB default charset= utf8 comment '会员表';


drop table if exists shop_profile;
create table shop_profile
(
	id bigint unsigned not null auto_increment comment 'id',
	truename varchar(32) not null default '真实姓名',
	age tinyint unsigned not null default '0' comment '年龄',
	sex enum('0','1','2') not null default '0' comment '性别',
	birthday date not null default '2016-01-01' comment '生日', 
	nickname varchar(32) not null default '' comment '昵称',
	company varchar(100) not  null default '' comment '公司',
	userid bigint unsigned not null default '0' comment '用户id',
	createtime int unsigned not null default '0' comment '创建时间',
	primary key(id),
	unique shop_profile_userid(userid)  
)engine = InnoDB default charset = utf8 comment '会员详细信息';


drop table if exists shop_category;
create table shop_category
(
	cateid bigint unsigned not null auto_increment comment 'id',
	title varchar(50) not null default '' comment '名称',
	parentid bigint unsigned not null default '0' comment '父级ID',
	createtime int unsigned not null default '0' comment '创建时间',
	primary key(cateid),
	key title(title)
)engine = InnoDB default charset=utf8 comment '分类表';


drop table if exists shop_product;
create table shop_product
(
	productid bigint unsigned not null auto_increment comment '商品ID',
	cateid bigint unsigned not null default '0' comment '分类ID',
	title varchar(200) not null default '' comment '标题',
	descr text comment '描述',
	num bigint unsigned not null default '0' comment '数量',
	price decimal(10,2) not null default '0.00' comment '价格',
	cover varchar(200) not null default '' ,
	pics text comment '图片',
	issale enum('0','1') not null default '0' comment '是否上架',
	saleprice decimal(10,2) not null default '0.00' comment '上架价格',
	ishot enum('0','1') not null default '0' comment '是否热卖',
	createtime int unsigned not null default '0' comment '创建时间',
	primary key(productid),
	key cateid(cateid),
	key title(title)
)engine = InnoDB default charset = utf8 comment '商品表';
