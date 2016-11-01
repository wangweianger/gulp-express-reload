/*
SQLyog Ultimate v10.51 
MySQL - 5.6.24 : Database - myshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myshop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `myshop`;

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `b_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌的id',
  `b_name` varchar(20) NOT NULL DEFAULT '' COMMENT '品牌的名称',
  `b_state` char(3) NOT NULL DEFAULT '0' COMMENT '品牌的状态0表示商城还没有冻结这个品牌，1表 示已冻结',
  PRIMARY KEY (`b_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='品牌表';

/*Data for the table `brand` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `t_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品类别id',
  `t_name` varchar(30) NOT NULL DEFAULT '' COMMENT '商品类别的名称中文标示',
  `t_state` char(3) NOT NULL DEFAULT '0' COMMENT '商品类别的状态，0标示未冻结此类，1标示冻结了此类',
  `t_parentid` int(10) NOT NULL DEFAULT '-1' COMMENT '父类目id，为-1表示为顶级类目，大于等于0 标示有父类目',
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品类别表';

/*Data for the table `category` */

/*Table structure for table `collection` */

DROP TABLE IF EXISTS `collection`;

CREATE TABLE `collection` (
  `cc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `g_id` int(10) unsigned NOT NULL COMMENT '商品的id',
  `cc_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '商品收藏的时间',
  `cc_state` char(3) NOT NULL DEFAULT '0' COMMENT '商品收藏状态，0标示为收藏，1标示已收藏',
  PRIMARY KEY (`cc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品收藏表';

/*Data for the table `collection` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `com_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品评论的id',
  `u_id` int(10) unsigned NOT NULL COMMENT '用户的id',
  `g_id` int(10) unsigned NOT NULL COMMENT '商品的id',
  `com_content` varchar(100) DEFAULT '' COMMENT '商品评论的内容',
  `com_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '商品评论的时间',
  `com_state` char(3) NOT NULL DEFAULT '0' COMMENT '商品评论状态，0标示为评论，1标示评论了',
  PRIMARY KEY (`com_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品评论表';

/*Data for the table `comment` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `g_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品的id',
  `g_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `br_id` int(10) unsigned NOT NULL COMMENT '品牌id',
  `t_id` int(10) unsigned NOT NULL COMMENT '商品的类别id',
  `g_place` varchar(20) NOT NULL DEFAULT '' COMMENT '商品摆放的位置，比如 1.新品区 2.特价区 3.正常销售区',
  `g_stockout` char(3) NOT NULL DEFAULT '0' COMMENT '商品是否缺货，0表示不缺货，1表示缺货',
  `g_delete` char(3) NOT NULL DEFAULT '0' COMMENT '商品是否删除，0表示未删除，1表示删除',
  `g_color` varchar(20) NOT NULL DEFAULT '' COMMENT '商品的颜色',
  `g_parts` varchar(30) NOT NULL DEFAULT '' COMMENT '商品的配件',
  `g_image` varchar(30) NOT NULL DEFAULT '' COMMENT '商品的图片地址',
  `g_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品的实际买价',
  `g_pprice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品的促销价格',
  `g_market` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `g_stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `g_intro` varchar(100) DEFAULT '' COMMENT '商品的简介',
  `g_detail` varchar(500) DEFAULT '' COMMENT '商品的详细介绍',
  PRIMARY KEY (`g_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `i_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单的id',
  `u_id` int(10) unsigned DEFAULT NULL COMMENT '用户的id',
  `i_consignee` varchar(30) NOT NULL DEFAULT '' COMMENT '订单收货人，中文字符串显示',
  `i_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '订单收货人手机号码，字符串标示',
  `i_address` varchar(50) NOT NULL DEFAULT '' COMMENT '订单收货人详细地址',
  `i_postcode` varchar(10) NOT NULL DEFAULT '' COMMENT '订单邮政编码',
  `i_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单购买商品总价',
  `i_state` char(3) NOT NULL DEFAULT '0' COMMENT '订单的状态0表示未处理，1表示以处理',
  `i_tdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '订单提交时间',
  `i_cdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '处理订单时间',
  PRIMARY KEY (`i_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `relationgforb` */

DROP TABLE IF EXISTS `relationgforb`;

CREATE TABLE `relationgforb` (
  `t_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品类别的 id',
  `b_id` int(10) unsigned NOT NULL COMMENT '品牌的id',
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品类别与品牌关联表';

/*Data for the table `relationgforb` */

/*Table structure for table `relationgfori` */

DROP TABLE IF EXISTS `relationgfori`;

CREATE TABLE `relationgfori` (
  `r_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品关联的id',
  `g_id` int(10) unsigned NOT NULL COMMENT '商品的id',
  `i_id` int(10) unsigned NOT NULL COMMENT '订单的id',
  `r_num` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '关联商品的件数',
  `r_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '关联商品的价格',
  PRIMARY KEY (`r_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品关联订单表';

/*Data for the table `relationgfori` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `u_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `u_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户姓名，注册字段',
  `u_nickname` varchar(20) DEFAULT '' COMMENT '用户昵称，注册字段',
  `u_phone` varchar(20) DEFAULT '' COMMENT '用户电话号码',
  `u_pass` varchar(20) NOT NULL DEFAULT '' COMMENT '用户密码，注册字段',
  `u_sex` char(1) NOT NULL DEFAULT '0' COMMENT '用户性别，只有0（男），1（女）',
  `u_age` tinyint(3) unsigned DEFAULT '0' COMMENT '用户年龄',
  `u_brithday` date DEFAULT NULL COMMENT '用户生日',
  `u_hobby` varchar(50) DEFAULT '' COMMENT '用户爱好',
  `u_email` varchar(40) DEFAULT '' COMMENT '用户邮箱',
  `u_cardId` varchar(28) DEFAULT '' COMMENT '用户身份证',
  `v_address` varchar(50) DEFAULT '' COMMENT '用户详细地址',
  PRIMARY KEY (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
