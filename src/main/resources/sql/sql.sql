/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.17-log : Database - db_book_manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_book_manage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_book_manage`;

/*Table structure for table `t_book` */

DROP TABLE IF EXISTS `t_book`;

CREATE TABLE `t_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `banhao` varchar(100) DEFAULT NULL,
  `bianzhu` varchar(100) DEFAULT NULL,
  `chubanshe` varchar(100) DEFAULT NULL,
  `chubanDate` date DEFAULT NULL,
  `danjia` varchar(50) DEFAULT NULL,
  `kucun` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_book` */

insert  into `t_book`(`id`,`bianhao`,`name`,`banhao`,`bianzhu`,`chubanshe`,`chubanDate`,`danjia`,`kucun`) values (3,'1002','php攻略','5520','小红','美山出版社','2018-06-02','50',9),(4,'1001','java攻略','5510','小明','美工出版社','2018-06-01','50',10),(6,'1003','三国演义','5530','小明','中国！@@@@','2018-03-09','50',19);

/*Table structure for table `t_config` */

DROP TABLE IF EXISTS `t_config`;

CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(100) DEFAULT NULL,
  `web_site` varchar(200) DEFAULT NULL,
  `headStr` text,
  `layuiStr` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_config` */

insert  into `t_config`(`id`,`domain_name`,`web_site`,`headStr`,`layuiStr`) values (1,'图书管理系统','http://www.###.com','<!-- 强制  高速模式 渲染网页    -->\n<meta NAME=”renderer” content=”webkit”>\n<!-- 强制  高速模式 渲染网页    -->\n\n<link href=\"/static/favicon.ico\" rel=\"shortcut icon\" />\n\n<!--添加  jq  支持加载-->\n<script	src=\"/static/easy-ui/jquery.min.js\"></script>\n<!--添加  jq  支持加载-->','<!--添加 layui  支持加载-->\n<link rel=\"stylesheet\"	href=\"/static/layui-v2.2.5/layui/css/layui.css\">\n<script	src=\"/static/layui-v2.2.5/layui/layui.js\"></script>\n<!--添加 layui  支持加载-->');

/*Table structure for table `t_cui_hai` */

DROP TABLE IF EXISTS `t_cui_hai`;

CREATE TABLE `t_cui_hai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userSubId` int(11) DEFAULT NULL,
  `jieyuerenId` int(11) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_cui_hai` */

insert  into `t_cui_hai`(`id`,`userSubId`,`jieyuerenId`,`bookId`,`createDateTime`) values (1,18,12,6,'2018-07-04 21:45:17');

/*Table structure for table `t_message` */

DROP TABLE IF EXISTS `t_message`;

CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_message` */

/*Table structure for table `t_tree` */

DROP TABLE IF EXISTS `t_tree`;

CREATE TABLE `t_tree` (
  `id` int(11) DEFAULT NULL,
  `text` varchar(46) DEFAULT NULL,
  `father` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `state` varchar(46) DEFAULT NULL,
  `iconCls` varchar(46) DEFAULT NULL,
  `permissions` varchar(100) DEFAULT NULL,
  `dd_id` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_tree` */

insert  into `t_tree`(`id`,`text`,`father`,`url`,`state`,`iconCls`,`permissions`,`dd_id`) values (99,'借阅',-1,NULL,'close',NULL,NULL,NULL),(6,'信息管理',-1,NULL,'close',NULL,NULL,NULL),(61010,'图书管理',6,'/houtai/book/manage','opend','&#xe63c;',NULL,'book'),(17,'借阅',-1,NULL,'close',NULL,NULL,NULL),(171005,'我的借阅记录',17,'/houtai/user/sub/my','opend','&#xe612;',NULL,'submy'),(171000,'我要借阅',17,'/houtai/book/sub/manage','opend','&#xe612;',NULL,'clienttype'),(171009,'我的催还记录',17,'/houtai/cuihai/my','opend','&#xe612;',NULL,'mysub'),(61013,'借阅记录',6,'/houtai/user/sub/manage','opend','&#xe612;',NULL,'sub'),(61015,'读者信息管理和维护',6,'/houtai/user/manage','opend','&#xe612;',NULL,'user'),(61014,'催还记录',6,'/houtai/cuihai/manage','opend','&#xe612;',NULL,'cui'),(171010,'留言板',17,'/houtai/message/my','opend','&#xe612;',NULL,'myliuyan'),(61017,'留言板管理',6,'/houtai/message/manage','opend','&#xe612;',NULL,'liuyan');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_` varchar(60) DEFAULT NULL,
  `trueName` varchar(60) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `sex_` varchar(10) DEFAULT NULL,
  `menuIds` varchar(100) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `type` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `weiyi` (`num_`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`num_`,`trueName`,`phone`,`sex_`,`menuIds`,`createDateTime`,`password`,`remark`,`type`) values (9,'admin','管理员','18337537555','男','6,61010,61015,61013,61014,61017','2018-06-23 15:50:59','0680d00353f3555fe7c01f11ed89bf8b','2',1),(12,'100','陈豪','12345678900','男','17,171000,171005,171009,171011,171010','2018-07-01 23:58:07','0680d00353f3555fe7c01f11ed89bf8b',NULL,2),(13,'200','小红','12345678900','女','17,171000,171005,171009,171011,171010','2018-07-01 23:59:49','0680d00353f3555fe7c01f11ed89bf8b','在这里备注',2);

/*Table structure for table `t_user_sub` */

DROP TABLE IF EXISTS `t_user_sub`;

CREATE TABLE `t_user_sub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  `subDateTime` datetime DEFAULT NULL,
  `returnDateTime` datetime DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `t_user_sub` */

insert  into `t_user_sub`(`id`,`userId`,`bookId`,`subDateTime`,`returnDateTime`,`type`) values (14,12,6,'2018-07-01 23:58:39','2018-07-02 00:02:34',2),(15,12,3,'2018-07-01 23:59:30','2018-07-02 00:02:32',2),(16,13,4,'2018-07-02 00:00:41','2018-07-02 00:03:09',2),(17,13,3,'2018-07-02 00:00:43','2018-07-02 00:03:04',2),(18,12,6,'2018-07-04 21:44:56',NULL,1),(19,12,3,'2018-07-04 21:44:57',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
