/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50711
Source Host           : 127.0.0.1:3306
Source Database       : dami

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-09-14 21:46:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `consignee` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件人',
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件人手机号',
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '市',
  `district` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '区',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '详细地址',
  `postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '邮编',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `sku_id` int(11) NOT NULL COMMENT 'sku商品id',
  `goods_id` int(11) NOT NULL COMMENT 'sku商品id',
  `goods_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `goods_attr` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品属性',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `created_at` timestamp NOT NULL DEFAULT '2016-07-27 22:44:49',
  `updated_at` timestamp NOT NULL DEFAULT '2016-07-27 22:44:49',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for cates
-- ----------------------------
DROP TABLE IF EXISTS `cates`;
CREATE TABLE `cates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '回复的内容',
  `good_id` int(11) NOT NULL COMMENT 'goods的id',
  `user_id` int(11) NOT NULL COMMENT '用户的id',
  `pid` int(11) NOT NULL COMMENT '父级id',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '二级分类路径',
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章的主图',
  `star` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '评论星级',
  `useless` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '回复的状态',
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 12:12:00',
  `updated_at` timestamp NOT NULL DEFAULT '1970-01-01 12:12:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的名称',
  `sub_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品的名称',
  `cate_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的分类id',
  `price` decimal(8,2) NOT NULL COMMENT '商品列表显示的价格',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的内容',
  `img` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的主图',
  `showImg` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的主图',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0为下架 1为上架',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for help_articles
-- ----------------------------
DROP TABLE IF EXISTS `help_articles`;
CREATE TABLE `help_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `help_cate_id` int(11) NOT NULL COMMENT '帮助栏目文章所属分类id',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '帮助栏目文章标题',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '帮助栏目文章内容',
  `status` tinyint(4) NOT NULL COMMENT '帮助栏目文章显示状态',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '定义栏目文章地址',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for help_cates
-- ----------------------------
DROP TABLE IF EXISTS `help_cates`;
CREATE TABLE `help_cates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '帮助栏目名称',
  `pid` int(11) NOT NULL COMMENT '帮助栏目所属栏目id',
  `show` tinyint(4) NOT NULL COMMENT '帮助栏目是否显示在底部',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '帮助栏目分类路径',
  `status` tinyint(4) NOT NULL COMMENT '帮助栏目显示状态',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for navigations
-- ----------------------------
DROP TABLE IF EXISTS `navigations`;
CREATE TABLE `navigations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `nav_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '导航栏目名称',
  `nav_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '导航栏目地址',
  `sku_id_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '导航栏目关联的产品id',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态 0启用 1禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_status` int(11) NOT NULL COMMENT '支付状态 0提交订单 1正在支付 2支付完成等待发货 3表示已发货 4表示确认收货 5表示退货中 6表示订单完成',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态 0为未付款 1已付款',
  `order_num` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  `pack_fee` int(11) NOT NULL COMMENT '运费',
  `pack_time` int(11) NOT NULL COMMENT '收货时间',
  `total_price` decimal(8,2) NOT NULL COMMENT '商品支付后的价格',
  `consignee` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件人',
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '省 直辖市',
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市',
  `district` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '区',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '详细地址',
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `sku_id` int(11) NOT NULL COMMENT '商品skuid',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `goods_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `goods_attr` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品详细参数',
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '颜色',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for skus
-- ----------------------------
DROP TABLE IF EXISTS `skus`;
CREATE TABLE `skus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `good_id` tinyint(4) NOT NULL COMMENT '商品id',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `attr` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的参数',
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品颜色',
  `falsePrice` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '原价',
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '现价',
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '列表图',
  `info` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的参数',
  `stock` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '库存',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0为下架 1为上架',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 12:12:00',
  `updated_at` timestamp NOT NULL DEFAULT '1970-01-01 12:12:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
