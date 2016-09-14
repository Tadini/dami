/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50711
Source Host           : 127.0.0.1:3306
Source Database       : lamp144

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-09-14 21:48:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号',
  `sheng` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '省id',
  `shi` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '市id',
  `xian` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '县id',
  `youbian` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '邮编',
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户id',
  `detail` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '详细地址',
  `isdefault` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否默认 0不默认 1默认 1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章的标题',
  `intro` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章的摘要',
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT '文章的内容',
  `cate_id` int(11) NOT NULL COMMENT '分类的id',
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章的主图',
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章的缩略图',
  `status` tinyint(4) NOT NULL COMMENT '文章的状态',
  `created_at` timestamp NOT NULL DEFAULT '2016-07-21 08:44:10',
  `updated_at` timestamp NOT NULL DEFAULT '2016-07-21 08:44:10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for cates
-- ----------------------------
DROP TABLE IF EXISTS `cates`;
CREATE TABLE `cates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pid` tinyint(4) NOT NULL,
  `path` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '评论的内容',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0审核中 1审核完成 2未通过审核',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for destoon_area
-- ----------------------------
DROP TABLE IF EXISTS `destoon_area`;
CREATE TABLE `destoon_area` (
  `areaid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `areaname` varchar(50) NOT NULL DEFAULT '',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `child` tinyint(1) NOT NULL DEFAULT '0',
  `arrchildid` text NOT NULL,
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`areaid`)
) ENGINE=MyISAM AUTO_INCREMENT=82267 DEFAULT CHARSET=utf8 COMMENT='地区';

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `cate_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的分类id',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的内容',
  `color` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的颜色',
  `size` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的尺码 xl xxl  xxl',
  `kucun` int(11) NOT NULL COMMENT '库存',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品的状态 0下架 1上架',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '图片路径',
  `path_s` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '缩略图的图片路径',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '头像',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0未激活 ',
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '50位随机字符组成的token',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
