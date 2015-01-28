/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : jianqiao

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-01-28 11:44:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wh_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `wh_guestbook`;
CREATE TABLE `wh_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `content` text,
  `create_time` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;