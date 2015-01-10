/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : yunbian

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-01-10 09:56:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wh_ad_list`
-- ----------------------------
DROP TABLE IF EXISTS `wh_ad_list`;
CREATE TABLE `wh_ad_list` (
  `adid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '广告名称',
  `auid` int(11) NOT NULL COMMENT '广告位ID',
  `type` tinyint(1) NOT NULL COMMENT '1图片|2html|3右下角弹出|4全屏',
  `url` varchar(255) NOT NULL COMMENT '跳转地址',
  `body` text NOT NULL COMMENT '广告具体内容',
  `ga` text COMMENT '谷歌ga统计代码',
  `time_date_limit` char(21) DEFAULT NULL COMMENT '广告投放日期：例如2012-04-05-2012-04-20，用char存放起始和结束日期用“|”分隔',
  `time_area_limit` varchar(600) DEFAULT NULL COMMENT '广告投放时间段如，8:00-12：00用json存放多个时间段',
  `is_show` tinyint(1) NOT NULL DEFAULT '0',
  `weight` int(10) NOT NULL DEFAULT '10',
  PRIMARY KEY (`adid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_ad_list
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_ad_unit`
-- ----------------------------
DROP TABLE IF EXISTS `wh_ad_unit`;
CREATE TABLE `wh_ad_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '广告位置',
  `adesc` varchar(255) NOT NULL COMMENT '位置描述',
  `img` varchar(255) NOT NULL COMMENT '广告位置截图',
  `orders` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统投放位',
  `is_show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_ad_unit
-- ----------------------------
INSERT INTO `wh_ad_unit` VALUES ('1', '首页右侧底部广告', '首页右侧底部广告', '1.jpg', '1', '1', '1');
INSERT INTO `wh_ad_unit` VALUES ('2', '首页顶部广告位', '首页顶部广告位', '2.jpg', '2', '1', '1');
INSERT INTO `wh_ad_unit` VALUES ('3', '发现频道广告位', '发现频道广告位', '3.jpg', '4', '1', '1');
INSERT INTO `wh_ad_unit` VALUES ('4', '推荐频道顶部广告位', '推荐频道顶部广告位', '4.jpg', '3', '1', '1');
INSERT INTO `wh_ad_unit` VALUES ('5', '用户主页右侧广告位', '用户主页右侧广告位', '5.jpg', '5', '1', '1');
INSERT INTO `wh_ad_unit` VALUES ('6', '用户主页详情页广告位', '用户主页详情页广告位', '6.jpg', '6', '1', '1');

-- ----------------------------
-- Table structure for `wh_attachments`
-- ----------------------------
DROP TABLE IF EXISTS `wh_attachments`;
CREATE TABLE `wh_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bid` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  `blogdesc` varchar(50) NOT NULL COMMENT '描述',
  `filesize` int(10) unsigned NOT NULL,
  `mime` varchar(20) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of wh_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_blog`
-- ----------------------------
DROP TABLE IF EXISTS `wh_blog`;
CREATE TABLE `wh_blog` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1文字2音乐3照片4视频5链接 ',
  `tag` char(30) NOT NULL COMMENT '分类',
  `title` char(50) DEFAULT NULL,
  `body` text NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0草稿 1通过 -1临时ID',
  `hitcount` int(10) DEFAULT '0' COMMENT '点击量',
  `feedcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '动作统计',
  `replaycount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论回复数',
  `noreply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '不允许评论',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  KEY `tag` (`tag`),
  KEY `uid` (`uid`),
  KEY `top` (`top`),
  KEY `open` (`open`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_blog
-- ----------------------------
INSERT INTO `wh_blog` VALUES ('1', '1', '0', '1', '', '分享文字标题', '[attribute]a:0:{}[/attribute]分享文字标题<h3 class=\"title\" style=\"color: rgb(102, 102, 102); font-size: 16px; line-height: 25px; height: 25px;\">内容</h3><h3 class=\"title\" style=\"color: rgb(102, 102, 102); font-size: 16px; line-height: 25px; height: 25px;\">内容</h3>', '1', '2', '3', '1', '0', '1420769397');
INSERT INTO `wh_blog` VALUES ('2', '2', '0', '1', '', '分享文字标题', '[repto]a:4:{s:3:\"uid\";s:1:\"1\";s:8:\"username\";s:0:\"\";s:6:\"domain\";s:0:\"\";s:4:\"time\";i:1420770085;}[/repto]分享文字标题<h3 class=\"title\" style=\"color: rgb(102, 102, 102); font-size: 16px; line-height: 25px; height: 25px;\">内容</h3><h3 class=\"title\" style=\"color: rgb(102, 102, 102); font-size: 16px; line-height: 25px; height: 25px;\">内容</h3>', '1', '0', '0', '0', '0', '1420770085');

-- ----------------------------
-- Table structure for `wh_cache`
-- ----------------------------
DROP TABLE IF EXISTS `wh_cache`;
CREATE TABLE `wh_cache` (
  `cachename` varchar(100) NOT NULL,
  `cachevalue` text,
  PRIMARY KEY (`cachename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_cache
-- ----------------------------
INSERT INTO `wh_cache` VALUES ('ybconfig', '1720680584s:1256:\"a:26:{s:11:\"addimg_type\";s:16:\"jpg|png|jpge|bmp\";s:13:\"addimg_upsize\";s:7:\"2097152\";s:9:\"guestMode\";s:1:\"0\";s:14:\"hotuser_switch\";s:1:\"1\";s:12:\"invite_count\";s:1:\"5\";s:17:\"invite_expiration\";s:2:\"10\";s:13:\"invite_switch\";s:1:\"0\";s:11:\"keep_domain\";s:230:\"www,yunbian,bbs,music,map,index,register,login,tag,now,admin,recommend,discovery,myfollow,mypost,mylikes,myreplays,mynotices,edit,logout,home,gomember,location,showinfo,about,copyright,call,service,privacy,custom,read,pm,user,site\";s:10:\"keep_email\";s:13:\"admin,yunbian\";s:11:\"keep_niname\";s:68:\"yunbian,admin,administrator,master,webmaster,email,username,password\";s:8:\"keep_rep\";s:19:\"操你妈,艹你妈\";s:15:\"loginCodeSwitch\";s:1:\"1\";s:13:\"recomm_switch\";s:1:\"0\";s:13:\"regCodeSwitch\";s:1:\"1\";s:12:\"show_ajax_to\";s:1:\"4\";s:14:\"show_page_mode\";s:1:\"0\";s:13:\"show_page_num\";s:2:\"10\";s:10:\"site_count\";s:0:\"\";s:9:\"site_desc\";s:36:\"又一个云边轻博客系统诞生\";s:12:\"site_keyword\";s:82:\"云边,yunbian,PHP,MYSQL,轻博客,开源,轻博,qing,开源轻博,开源轻博客\";s:10:\"site_title\";s:12:\"网站标题\";s:13:\"site_titlepre\";s:15:\"网站副标题\";s:12:\"theme_upload\";s:1:\"1\";s:16:\"theme_uploadsize\";s:7:\"1048576\";s:16:\"theme_uploadtype\";s:11:\"jpg,png,gif\";s:13:\"wizard_switch\";s:1:\"0\";}\";');
INSERT INTO `wh_cache` VALUES ('ybmodel', '1720682135s:1857:\"a:2:{s:5:\"model\";a:5:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"6\";}s:4:\"data\";a:5:{i:1;a:10:{s:2:\"id\";s:1:\"1\";s:4:\"icon\";s:4:\"text\";s:4:\"name\";s:6:\"文字\";s:9:\"modelfile\";s:14:\"word.class.php\";s:6:\"status\";s:1:\"1\";s:5:\"mdesc\";s:12:\"发布文字\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"SYSTEM\";s:7:\"feedtpl\";s:0:\"\";s:3:\"cfg\";s:143:\"imguplod--1--是否开启图片上传\nimguploadsize--2048--图片上传尺寸不设置取全局\nimagetype--jpg|jpge|png|gif--图片上传类型\";}i:2;a:10:{s:2:\"id\";s:1:\"2\";s:4:\"icon\";s:5:\"music\";s:4:\"name\";s:6:\"音乐\";s:9:\"modelfile\";s:15:\"music.class.php\";s:6:\"status\";s:1:\"1\";s:5:\"mdesc\";s:12:\"发布音乐\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"SYSTEM\";s:7:\"feedtpl\";s:0:\"\";s:3:\"cfg\";s:182:\"enableurl--1--是否开启引用地址发布\r\nenableupload--1--是否开启上传发布\r\nuploadsize--5000--允许长传大小(KB)\r\nuploadtype--mp3|wma|mid|midi--允许上传的类型\";}i:3;a:10:{s:2:\"id\";s:1:\"3\";s:4:\"icon\";s:5:\"photo\";s:4:\"name\";s:6:\"图片\";s:9:\"modelfile\";s:15:\"photo.class.php\";s:6:\"status\";s:1:\"1\";s:5:\"mdesc\";s:12:\"发布图片\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"SYSTEM\";s:7:\"feedtpl\";s:0:\"\";s:3:\"cfg\";s:113:\"imagetype--jpg|jpge|png|gif--上传类型\nimagesize--20480--上传大小\nimagecount--20--每次最大上传数量\";}i:4;a:10:{s:2:\"id\";s:1:\"4\";s:4:\"icon\";s:5:\"video\";s:4:\"name\";s:6:\"视频\";s:9:\"modelfile\";s:15:\"video.class.php\";s:6:\"status\";s:1:\"1\";s:5:\"mdesc\";s:12:\"发布视频\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"SYSTEM\";s:7:\"feedtpl\";s:0:\"\";s:3:\"cfg\";s:0:\"\";}i:6;a:10:{s:2:\"id\";s:1:\"6\";s:4:\"icon\";s:5:\"movie\";s:4:\"name\";s:6:\"电影\";s:9:\"modelfile\";s:15:\"movie.class.php\";s:6:\"status\";s:1:\"1\";s:5:\"mdesc\";s:12:\"发布电影\";s:7:\"version\";s:3:\"1.0\";s:6:\"author\";s:6:\"SYSTEM\";s:7:\"feedtpl\";s:0:\"\";s:3:\"cfg\";s:38:\"enableurl--1--是否开启解析功能\";}}}\";');
INSERT INTO `wh_cache` VALUES ('custompageCate', '1720680584s:888:\"a:5:{i:0;a:6:{s:2:\"id\";s:1:\"1\";s:4:\"tags\";s:5:\"about\";s:5:\"title\";s:12:\"关于我们\";s:7:\"keyword\";s:12:\"关于我们\";s:11:\"description\";s:12:\"关于我们\";s:6:\"orders\";s:1:\"1\";}i:1;a:6:{s:2:\"id\";s:1:\"2\";s:4:\"tags\";s:4:\"help\";s:5:\"title\";s:12:\"使用帮助\";s:7:\"keyword\";s:12:\"使用帮助\";s:11:\"description\";s:12:\"使用帮助\";s:6:\"orders\";s:1:\"2\";}i:2;a:6:{s:2:\"id\";s:1:\"3\";s:4:\"tags\";s:4:\"call\";s:5:\"title\";s:12:\"联系我们\";s:7:\"keyword\";s:12:\"联系我们\";s:11:\"description\";s:12:\"联系我们\";s:6:\"orders\";s:1:\"3\";}i:3;a:6:{s:2:\"id\";s:1:\"4\";s:4:\"tags\";s:7:\"service\";s:5:\"title\";s:12:\"服务条款\";s:7:\"keyword\";s:12:\"服务条款\";s:11:\"description\";s:12:\"服务条款\";s:6:\"orders\";s:1:\"4\";}i:4;a:6:{s:2:\"id\";s:1:\"5\";s:4:\"tags\";s:7:\"privacy\";s:5:\"title\";s:12:\"隐私政策\";s:7:\"keyword\";s:12:\"隐私政策\";s:11:\"description\";s:12:\"隐私政策\";s:6:\"orders\";s:1:\"5\";}}\";');
INSERT INTO `wh_cache` VALUES ('adunit', '1720680584s:1224:\"a:6:{i:1;a:7:{s:2:\"id\";s:1:\"1\";s:5:\"title\";s:24:\"首页右侧底部广告\";s:5:\"adesc\";s:24:\"首页右侧底部广告\";s:3:\"img\";s:5:\"1.jpg\";s:6:\"orders\";s:1:\"1\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"1\";}i:2;a:7:{s:2:\"id\";s:1:\"2\";s:5:\"title\";s:21:\"首页顶部广告位\";s:5:\"adesc\";s:21:\"首页顶部广告位\";s:3:\"img\";s:5:\"2.jpg\";s:6:\"orders\";s:1:\"2\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"1\";}i:3;a:7:{s:2:\"id\";s:1:\"3\";s:5:\"title\";s:21:\"发现频道广告位\";s:5:\"adesc\";s:21:\"发现频道广告位\";s:3:\"img\";s:5:\"3.jpg\";s:6:\"orders\";s:1:\"4\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"1\";}i:4;a:7:{s:2:\"id\";s:1:\"4\";s:5:\"title\";s:27:\"推荐频道顶部广告位\";s:5:\"adesc\";s:27:\"推荐频道顶部广告位\";s:3:\"img\";s:5:\"4.jpg\";s:6:\"orders\";s:1:\"3\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"1\";}i:5;a:7:{s:2:\"id\";s:1:\"5\";s:5:\"title\";s:27:\"用户主页右侧广告位\";s:5:\"adesc\";s:27:\"用户主页右侧广告位\";s:3:\"img\";s:5:\"5.jpg\";s:6:\"orders\";s:1:\"5\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"1\";}i:6;a:7:{s:2:\"id\";s:1:\"6\";s:5:\"title\";s:30:\"用户主页详情页广告位\";s:5:\"adesc\";s:30:\"用户主页详情页广告位\";s:3:\"img\";s:5:\"6.jpg\";s:6:\"orders\";s:1:\"6\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"1\";}}\";');
INSERT INTO `wh_cache` VALUES ('Ad_2', '1720852960s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('Ad_1', '1720852960s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('recommend_shuffle_3', '1420939360s:2:\"N;\";');
INSERT INTO `wh_cache` VALUES ('findeUserTag_1', '1420855833s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('systag', '1720682140s:2504:\"a:26:{i:0;a:4:{s:3:\"cid\";s:1:\"1\";s:8:\"catename\";s:6:\"艺术\";s:4:\"sort\";s:1:\"1\";s:4:\"used\";s:1:\"0\";}i:1;a:4:{s:3:\"cid\";s:1:\"2\";s:8:\"catename\";s:6:\"时尚\";s:4:\"sort\";s:1:\"2\";s:4:\"used\";s:1:\"0\";}i:2;a:4:{s:3:\"cid\";s:1:\"3\";s:8:\"catename\";s:6:\"音乐\";s:4:\"sort\";s:1:\"3\";s:4:\"used\";s:1:\"0\";}i:3;a:4:{s:3:\"cid\";s:1:\"4\";s:8:\"catename\";s:6:\"摄影\";s:4:\"sort\";s:1:\"4\";s:4:\"used\";s:1:\"0\";}i:4;a:4:{s:3:\"cid\";s:1:\"5\";s:8:\"catename\";s:6:\"阅读\";s:4:\"sort\";s:1:\"5\";s:4:\"used\";s:1:\"0\";}i:5;a:4:{s:3:\"cid\";s:1:\"6\";s:8:\"catename\";s:6:\"动漫\";s:4:\"sort\";s:1:\"6\";s:4:\"used\";s:1:\"0\";}i:6;a:4:{s:3:\"cid\";s:1:\"7\";s:8:\"catename\";s:6:\"游戏\";s:4:\"sort\";s:1:\"7\";s:4:\"used\";s:1:\"0\";}i:7;a:4:{s:3:\"cid\";s:1:\"8\";s:8:\"catename\";s:6:\"随笔\";s:4:\"sort\";s:1:\"8\";s:4:\"used\";s:1:\"0\";}i:8;a:4:{s:3:\"cid\";s:1:\"9\";s:8:\"catename\";s:6:\"插画\";s:4:\"sort\";s:1:\"9\";s:4:\"used\";s:1:\"0\";}i:9;a:4:{s:3:\"cid\";s:2:\"10\";s:8:\"catename\";s:6:\"设计\";s:4:\"sort\";s:2:\"10\";s:4:\"used\";s:1:\"0\";}i:10;a:4:{s:3:\"cid\";s:2:\"11\";s:8:\"catename\";s:6:\"建筑\";s:4:\"sort\";s:2:\"11\";s:4:\"used\";s:1:\"0\";}i:11;a:4:{s:3:\"cid\";s:2:\"12\";s:8:\"catename\";s:6:\"创意\";s:4:\"sort\";s:2:\"12\";s:4:\"used\";s:1:\"0\";}i:12;a:4:{s:3:\"cid\";s:2:\"13\";s:8:\"catename\";s:6:\"猎图\";s:4:\"sort\";s:2:\"13\";s:4:\"used\";s:1:\"0\";}i:13;a:4:{s:3:\"cid\";s:2:\"14\";s:8:\"catename\";s:6:\"宠物\";s:4:\"sort\";s:2:\"14\";s:4:\"used\";s:1:\"0\";}i:14;a:4:{s:3:\"cid\";s:2:\"15\";s:8:\"catename\";s:6:\"汽车\";s:4:\"sort\";s:2:\"15\";s:4:\"used\";s:1:\"0\";}i:15;a:4:{s:3:\"cid\";s:2:\"16\";s:8:\"catename\";s:6:\"家居\";s:4:\"sort\";s:2:\"16\";s:4:\"used\";s:1:\"0\";}i:16;a:4:{s:3:\"cid\";s:2:\"17\";s:8:\"catename\";s:9:\"互联网\";s:4:\"sort\";s:2:\"17\";s:4:\"used\";s:1:\"0\";}i:17;a:4:{s:3:\"cid\";s:2:\"18\";s:8:\"catename\";s:6:\"旅行\";s:4:\"sort\";s:2:\"18\";s:4:\"used\";s:1:\"0\";}i:18;a:4:{s:3:\"cid\";s:2:\"19\";s:8:\"catename\";s:6:\"数码\";s:4:\"sort\";s:2:\"19\";s:4:\"used\";s:1:\"0\";}i:19;a:4:{s:3:\"cid\";s:2:\"20\";s:8:\"catename\";s:6:\"影视\";s:4:\"sort\";s:2:\"20\";s:4:\"used\";s:1:\"0\";}i:20;a:4:{s:3:\"cid\";s:2:\"21\";s:8:\"catename\";s:6:\"美食\";s:4:\"sort\";s:2:\"21\";s:4:\"used\";s:1:\"0\";}i:21;a:4:{s:3:\"cid\";s:2:\"22\";s:8:\"catename\";s:6:\"恋物\";s:4:\"sort\";s:2:\"22\";s:4:\"used\";s:1:\"0\";}i:22;a:4:{s:3:\"cid\";s:2:\"23\";s:8:\"catename\";s:6:\"趣味\";s:4:\"sort\";s:2:\"23\";s:4:\"used\";s:1:\"0\";}i:23;a:4:{s:3:\"cid\";s:2:\"24\";s:8:\"catename\";s:6:\"科学\";s:4:\"sort\";s:2:\"24\";s:4:\"used\";s:1:\"0\";}i:24;a:4:{s:3:\"cid\";s:2:\"25\";s:8:\"catename\";s:6:\"军事\";s:4:\"sort\";s:2:\"25\";s:4:\"used\";s:1:\"0\";}i:25;a:4:{s:3:\"cid\";s:2:\"26\";s:8:\"catename\";s:6:\"体育\";s:4:\"sort\";s:2:\"26\";s:4:\"used\";s:1:\"0\";}}\";');
INSERT INTO `wh_cache` VALUES ('Ad_4', '1720788398s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('recommend_shuffle_all', '1420856557s:551:\"a:2:{i:0;a:9:{s:3:\"bid\";s:1:\"2\";s:5:\"title\";s:18:\"分享文字标题\";s:4:\"body\";s:30:\"分享文字标题内容内容\";s:4:\"type\";s:1:\"1\";s:3:\"uid\";s:1:\"2\";s:8:\"username\";s:3:\"aaa\";s:5:\"b_url\";s:42:\"/yunbian/index.php?c=userblog&a=show&bid=2\";s:3:\"tag\";s:0:\"\";s:3:\"img\";s:1:\" \";}i:1;a:9:{s:3:\"bid\";s:1:\"1\";s:5:\"title\";s:18:\"分享文字标题\";s:4:\"body\";s:30:\"分享文字标题内容内容\";s:4:\"type\";s:1:\"1\";s:3:\"uid\";s:1:\"1\";s:8:\"username\";s:0:\"\";s:5:\"b_url\";s:42:\"/yunbian/index.php?c=userblog&a=show&bid=1\";s:3:\"tag\";s:0:\"\";s:3:\"img\";s:1:\" \";}}\";');
INSERT INTO `wh_cache` VALUES ('discoverTag_30', '1420856648s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('Ad_3', '1720770248s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('Ad_5', '1720852952s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('loginUserHot', '1420773835s:442:\"a:1:{i:0;a:12:{s:2:\"id\";s:1:\"1\";s:3:\"bid\";s:1:\"1\";s:3:\"uid\";s:1:\"2\";s:6:\"repuid\";N;s:3:\"msg\";s:4:\"zxcv\";s:4:\"time\";s:10:\"1420770078\";s:8:\"username\";s:3:\"aaa\";s:7:\"blogtag\";a:2:{i:0;s:6:\"艺术\";i:1;s:6:\"时尚\";}s:5:\"u_url\";s:49:\"/yunbian/index.php?c=userblog&a=index&domain=aaaa\";s:5:\"u_img\";s:37:\"/yunbian/avatar.php?uid=2&size=middle\";s:5:\"b_url\";s:42:\"/yunbian/index.php?c=userblog&a=show&bid=1\";s:7:\"b_title\";s:18:\"分享文字标题\";}}\";');
INSERT INTO `wh_cache` VALUES ('myfollow_1', '1420773032s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('Ad_6', '1720770072s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('findTagHotUser_d41d8cd98f00b204e9800998ecf8427e', '1420855828s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('myfollow_2', '1420788199s:8:\"s:1:\"1\";\";');
INSERT INTO `wh_cache` VALUES ('findeUserTag_2', '1420856507s:4:\"b:0;\";');

-- ----------------------------
-- Table structure for `wh_catetags`
-- ----------------------------
DROP TABLE IF EXISTS `wh_catetags`;
CREATE TABLE `wh_catetags` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catename` varchar(20) NOT NULL,
  `sort` tinyint(10) unsigned NOT NULL COMMENT '排序',
  `used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有多少人用了这个标签',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_catetags
-- ----------------------------
INSERT INTO `wh_catetags` VALUES ('1', '艺术', '1', '0');
INSERT INTO `wh_catetags` VALUES ('2', '时尚', '2', '0');
INSERT INTO `wh_catetags` VALUES ('3', '音乐', '3', '0');
INSERT INTO `wh_catetags` VALUES ('4', '摄影', '4', '0');
INSERT INTO `wh_catetags` VALUES ('5', '阅读', '5', '0');
INSERT INTO `wh_catetags` VALUES ('6', '动漫', '6', '0');
INSERT INTO `wh_catetags` VALUES ('7', '游戏', '7', '0');
INSERT INTO `wh_catetags` VALUES ('8', '随笔', '8', '0');
INSERT INTO `wh_catetags` VALUES ('9', '插画', '9', '0');
INSERT INTO `wh_catetags` VALUES ('10', '设计', '10', '0');
INSERT INTO `wh_catetags` VALUES ('11', '建筑', '11', '0');
INSERT INTO `wh_catetags` VALUES ('12', '创意', '12', '0');
INSERT INTO `wh_catetags` VALUES ('13', '猎图', '13', '0');
INSERT INTO `wh_catetags` VALUES ('14', '宠物', '14', '0');
INSERT INTO `wh_catetags` VALUES ('15', '汽车', '15', '0');
INSERT INTO `wh_catetags` VALUES ('16', '家居', '16', '0');
INSERT INTO `wh_catetags` VALUES ('17', '互联网', '17', '0');
INSERT INTO `wh_catetags` VALUES ('18', '旅行', '18', '0');
INSERT INTO `wh_catetags` VALUES ('19', '数码', '19', '0');
INSERT INTO `wh_catetags` VALUES ('20', '影视', '20', '0');
INSERT INTO `wh_catetags` VALUES ('21', '美食', '21', '0');
INSERT INTO `wh_catetags` VALUES ('22', '恋物', '22', '0');
INSERT INTO `wh_catetags` VALUES ('23', '趣味', '23', '0');
INSERT INTO `wh_catetags` VALUES ('24', '科学', '24', '0');
INSERT INTO `wh_catetags` VALUES ('25', '军事', '25', '0');
INSERT INTO `wh_catetags` VALUES ('26', '体育', '26', '0');

-- ----------------------------
-- Table structure for `wh_cpage_body`
-- ----------------------------
DROP TABLE IF EXISTS `wh_cpage_body`;
CREATE TABLE `wh_cpage_body` (
  `cid` int(10) unsigned NOT NULL,
  `body` text,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义页面,内容';

-- ----------------------------
-- Records of wh_cpage_body
-- ----------------------------
INSERT INTO `wh_cpage_body` VALUES ('2', ' <h3>发布内容</h3> <p>登陆后点击右侧 文字链接，即可进入发布文字功能。可输入内容，并可插入单张图片</p> <h3>发布音乐</h3> <p>登陆后点击右侧 音乐，即可进入发布音乐功能。您可以选择网络音乐 和 本地上传两种方式。</p> <p>网络音乐引用地址可以输入虾米、雅燃音乐、音悦台、优酷、土豆、6间房、腾讯播客、新浪博客、56.com等诸多网站播放地址。 也可以直接粘贴网络后缀为mp3的歌曲。</p> <p>本地上传您可以上传本地的MP3文件，但请注意的是您需要拥有该媒体的著作权，也就是说您自己录或者制作的音乐皆可，但不能上传网络上不属于您的版权的音乐。如果被查出或举报或版权纠纷我们将不负任何责任，并且删除该媒体资源。</p> <h3>发布图片</h3> <p>您可以同时上传最多20张照片作为博客内容，并且也可以编写介绍。</p> <h3>发布视频</h3> <p>视频引用地址可以输入虾米、雅燃音乐、音悦台、优酷、土豆、6间房、腾讯播客、新浪博客、56.com等诸多网站播放地址。建议您可以将录制好的视频传至以上媒体然后填写引用地址。</p> <p>同时您也可以编写介绍</p> <h3>关于标签</h3> <p>不管发布任何内容您都需要填写至少一个标签，轻博内容将根据标签来进行区分。因此填写一个或多个合适的标签是非常不错的选择。</p> <h3>关注和喜欢</h3> <p>加为关注的用户将会在您的首页显示最新发布动态</p> <p>加为喜欢的博客可方便您在右侧导航中快速的查找</p> ');
INSERT INTO `wh_cpage_body` VALUES ('3', '<h3>官方网站</h3> <p>http://qing.thinksaas.cn</p> <h3>邮箱</h3> <p>nxfte<span id=\"ats\"></span>qq.com</p> <h3>交流群</h3> <p>qq group 176221558</p> <h3>商业授权</h3> <p>QQ：234027573</p> <h3>付款地址</h3> <p><a href=\"https://me.alipay.com/anythink\" target=\"_blank\">https://me.alipay.com/anythink</a></p> ');
INSERT INTO `wh_cpage_body` VALUES ('4', '<p>本协议适用于云边网开发的云边网平台。使用云边网平台以及与其相关联的各项技术服务和网络服务之前，您必须同意接受本协议。若不接受本协议，您将无法使用云边网平台及相关服务。</p> <p>您可以通过以下方式接受本协议：一旦您注册云边账户并且发布第一条信息起，您对云边网平台及其他相关服务的使用将被视为您自实际 使用起便接受了本协议的全部条款。如果需要注销用户请发送注销申请邮件，我们将删除与您有关的全部内容，您与云边网所有服务都将被终止。注册账户需要用户 本人电子邮件作为注册账号，如果用户使用他人邮件账号注册并被邮件归属人举证成功者将删除用户账号及所有内容，并且一切法律责任自行承担，本站不承担任何 责任。</p> <p>云边网网络平台的所有权和运营权归云边网所有，并保留随时变更平台提供的信息和服务的权利。云边网所提供的相关信息和服务的使用者（以下简称&ldquo;用户&rdquo;）在使用之前必须同意以下的所有条款。</p> <p>用户在云边网平台上发布的信息内容由用户及云边网共同所有，任何其他组织或个人未经用户本人授权同意，不得复制、转载、擅改其内容。用户不得在云边网平台发布和散播任何形式的含有下列内容的信息：<br> 1）为相关法律法规所禁止；<br> 2）有悖于社会公共秩序和善良风俗；<br> 3）损害他人合法权益；<br> 4）其他云边网 认为不适当在本平台发布的内容。 <br> 5）通过发布音乐的上传功能上传非用户本人拥有版权的音频媒体。 <br> 云边网保留删除和变更上述相关信息的权利。</p> <p>用户应保证在云边网平台的注册信息的真实、准确和完整，并在资料变更时及时更新相关信息。对于任何信息不实所导致的用户本人或第三方损害，云边网不承担任何责任。用户应妥善保管个人注册信息及登录密码等资料，用户将对以其注册用户名进行的所有活动和事件负法律责任。</p> <p>云边网非常强调保护用户的隐私。云边网将致力于为用户提供最可靠的隐私保护措施。未经用户的特别授权，云边网不会将用户信息公开或透露给任何第三 方个人或机构，但在下列情形除外：<br> 1) 根据司法机关、政府部门的强制命令提供涉及用户信息的相关资料； <br> 2) 不可抗力与不可控因素导致的信息外泄；<br> 3) 云边网基于自身的合法维权需要而使用用户的相关信息。</p> <p>用户同意使用云边网平台服务所潜在的风险及其一切可能的后果将完全由自己承担，云边网对这些可能的风险和后果不承担任何责任。</p> <p>云边网不保证云边网平台提供的服务能够满足用户的所有要求，也不保证已存在的服务不会中断，对这些服务的及时性、安全 性、准确性也不作保证。对于因系统维护或升级的需要而需暂停网络服务的情形，云边网将视具体情形尽可能事先在重要页面发布通知。同时，云边网保留在不事先 通知用户的情况下中断或终止部分或全部服务的权利，对于因服务的中断或终止而造成的用户或第三方的任何损失，云边网不承担任何责任。</p> <p>用户同意尊重和维护云边网平台以及其他用户的合法权益。用户因违反有关法律、法规或协议规定中的任何条款而给云边网或任何第三方造成的损失，用户同意承担由此造成的一切损害赔偿责任。</p> <p>在适用法律允许的范围内，云边网保留对本协议任何条款的解释权和随时变更的权利。 云边网可能会随时根据需要修改本协议的任一条款。如发生此类变更，云边网会提供新版本的条款。用户在变更后对云边网平台服务的使用将视为已完全接受变更后的条款。</p> <p>本协议在根据下述规定终止前，将会一直适用。当下列情况出现时，云边网可以随时中止与用户的协议：<br> 1) 用户违反了本协议中的任何规定；<br> 2) 法律法规要求终止本协议;<br> 3) 云边网认为实际情形不再适宜继续执行本协议。</p> <p>本协议及因本协议产生的一切法律关系及纠纷，均适用中华人民共和国法律。用户与云边网在此同意以云边网营业所在地法院管辖。</p> ');
INSERT INTO `wh_cpage_body` VALUES ('5', ' <h3>隐私政策</h3> <p>当您在使用我们的服务时，我们将致力于为您提供最可靠的隐私保护措施。未经用户的特别授权，我们承诺不会将用户信息 公开或透露给任何第三方个人或机构，但在下列情形除外：<br> 1) 根据司法机关、政府部门的强制命令提供涉及用户信息的相关资料；<br> 2) 不可抗力与不可控因素导致的信息外泄； <br> 3) 云边网基于自身的合法维权需要而使用用户的相关信息。</p> <p>为了更好地提升云边网的服务质量和进行更精准的网络数据分析，我们将在充分保护用户个人隐私的前提下，对用户数据库进行分析和处理。所有相关的数据分析结果都将被用于有价值的新产品的研发和用户体验的进一步改进。</p> <h3>法律声明</h3> <p>云边网网络平台的所有权和运营权归云边网所有，并保留随时变更平台提供的信息和服务的权利。云边网所提供的相关信息和服务的使用者（以下简称&ldquo;用户&rdquo;）在使用之前必须同意以下的所有条款。</p> <p>用户在云边网平台上发布的信息内容由用户及云边网共同所有，任何其他组织或个人未经用户本人授权同意，不得复制、转载、 擅改其内容。用户不得在点 点网平台发布和散播任何形式的含有下列内容的信息：1）为相关法律法规所禁止；2）有悖于社会公共秩序和善良风俗；3）损害他人合法权益；4）其他云边网 认为不适当在本平台发布的内容。 云边网保留删除和变更上述相关信息的权利。</p> <p>用户应保证在云边网平台的注册信息的真实、准确和完整，并在资料变更时及时更新相关信息。对于任何信息不实所导致的用户本人或第三方损害，云边网不承担任何责任。用户应妥善保管个人注册信息及登录密码等资料，用户将对以其注册用户名进行的所有活动和事件负法律责任。</p> <p>云边网非常强调保护用户的隐私。云边网将致力于为用户提供最可靠的隐私保护措施。未经用户的特别授权，云边网不会将用户 信息公开或透露给任何第三 方个人或机构，但在下列情形除外：1) 根据司法机关、政府部门的强制命令提供涉及用户信息的相关资料； 2) 不可抗力与不可控因素导致的信息外泄； 3) 云边网基于自身的合法维权需要而使用用户的相关信息。</p> <p>用户同意使用云边网平台服务所潜在的风险及其一切可能的后果将完全由自己承担，云边网对这些可能的风险和后果不承担任何责任。</p> <p>云边网不保证云边网平台提供的服务能够满足用户的所有要求，也不保证已存在的服务不会中断，对这些服务的及时性、安全 性、准确性也不作保证。对于 因系统维护或升级的需要而需暂停网络服务的情形，云边网将视具体情形尽可能事先在重要页面发布通知。同时，云边网保留在不事先通知用户的情况下中断或终止 部分或全部服务的权利，对于因服务的中断或终止而造成的用户或第三方的任何损失，云边网不承担任何责任。</p> <p>用户同意尊重和维护云边网平台以及其他用户的合法权益。用户因违反有关法律、法规或协议规定中的任何条款而给云边网或任何第三方造成的损失，用户同意承担由此造成的一切损害赔偿责任。</p> <p>在适用法律允许的范围内，云边网保留对本协议任何条款的解释权和随时变更的权利。 云边网可能会随时根据需要修改本协议的任一条款。如发生此类变更，云边网会提供新版本的条款。用户在变更后对云边网平台服务的使用将视为已完全接受变更后的条款。</p> <p>本协议在根据下述规定终止前，将会一直适用。当下列情况出现时，云边网可以随时中止与用户的协议：1) 用户违反了本协议中的任何规定；2) 法律法规要求终止本协议;3) 云边网认为实际情形不再适宜继续执行本协议。</p> <p>本协议及因本协议产生的一切法律关系及纠纷，均适用中华人民共和国法律。用户与云边网在此同意以云边网营业所在地法院管辖。</p> ');

-- ----------------------------
-- Table structure for `wh_cpage_cate`
-- ----------------------------
DROP TABLE IF EXISTS `wh_cpage_cate`;
CREATE TABLE `wh_cpage_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tags` varchar(30) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `orders` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags` (`tags`),
  KEY `order` (`orders`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='自定义页面,标题';

-- ----------------------------
-- Records of wh_cpage_cate
-- ----------------------------
INSERT INTO `wh_cpage_cate` VALUES ('3', 'call', '联系我们', '联系我们', '联系我们', '3');
INSERT INTO `wh_cpage_cate` VALUES ('2', 'help', '使用帮助', '使用帮助', '使用帮助', '2');
INSERT INTO `wh_cpage_cate` VALUES ('4', 'service', '服务条款', '服务条款', '服务条款', '4');
INSERT INTO `wh_cpage_cate` VALUES ('5', 'privacy', '隐私政策', '隐私政策', '隐私政策', '5');

-- ----------------------------
-- Table structure for `wh_feeds`
-- ----------------------------
DROP TABLE IF EXISTS `wh_feeds`;
CREATE TABLE `wh_feeds` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parentkey` int(10) NOT NULL DEFAULT '0',
  `bid` int(10) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `uid` int(10) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '动态标题',
  `info` varchar(255) DEFAULT '' COMMENT '动态内容',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_feeds
-- ----------------------------
INSERT INTO `wh_feeds` VALUES ('1', '1', '1', 'reply', '2', '回复本内容', 'zxcv', '1420770078');
INSERT INTO `wh_feeds` VALUES ('2', '0', '1', 'foword', '2', '转载本内容', '', '1420770085');
INSERT INTO `wh_feeds` VALUES ('4', '0', '1', 'likes', '2', '喜欢本内容', '', '1420770175');

-- ----------------------------
-- Table structure for `wh_findpwd`
-- ----------------------------
DROP TABLE IF EXISTS `wh_findpwd`;
CREATE TABLE `wh_findpwd` (
  `uid` int(10) NOT NULL,
  `token` char(32) NOT NULL,
  `time` int(10) NOT NULL,
  `mailsend` int(10) NOT NULL COMMENT '上次发送邮件时间',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='找回密码';

-- ----------------------------
-- Records of wh_findpwd
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_follow`
-- ----------------------------
DROP TABLE IF EXISTS `wh_follow`;
CREATE TABLE `wh_follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '谁',
  `touid` int(10) unsigned NOT NULL COMMENT '关注他',
  `linker` tinyint(1) NOT NULL COMMENT '互相关注',
  `time` int(10) NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`,`touid`),
  KEY `touid` (`touid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_follow
-- ----------------------------
INSERT INTO `wh_follow` VALUES ('1', '2', '1', '0', '1420770074');

-- ----------------------------
-- Table structure for `wh_invite`
-- ----------------------------
DROP TABLE IF EXISTS `wh_invite`;
CREATE TABLE `wh_invite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `inviteCode` char(32) NOT NULL COMMENT '邀请码',
  `exptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请码过期时间',
  PRIMARY KEY (`id`),
  KEY `inviteCode` (`inviteCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请表';

-- ----------------------------
-- Records of wh_invite
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_invite_friend`
-- ----------------------------
DROP TABLE IF EXISTS `wh_invite_friend`;
CREATE TABLE `wh_invite_friend` (
  `uid` int(10) NOT NULL,
  `touid` int(10) NOT NULL,
  PRIMARY KEY (`touid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请过的好友';

-- ----------------------------
-- Records of wh_invite_friend
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_likes`
-- ----------------------------
DROP TABLE IF EXISTS `wh_likes`;
CREATE TABLE `wh_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `bid` int(10) unsigned NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_likes
-- ----------------------------
INSERT INTO `wh_likes` VALUES ('2', '2', '1', '1420770175');

-- ----------------------------
-- Table structure for `wh_member`
-- ----------------------------
DROP TABLE IF EXISTS `wh_member`;
CREATE TABLE `wh_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否开放',
  `email` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `salt` char(6) NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `domain` varchar(20) NOT NULL DEFAULT '',
  `local` varchar(20) DEFAULT NULL COMMENT '我所在',
  `blogtag` varchar(100) DEFAULT NULL,
  `sign` varchar(140) DEFAULT NULL,
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布数量',
  `flow` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注我的',
  `likenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '我喜欢的',
  `qq` char(12) NOT NULL DEFAULT '',
  `regtime` int(10) NOT NULL,
  `logtime` int(10) NOT NULL DEFAULT '0',
  `regip` char(16) NOT NULL DEFAULT '0',
  `logip` char(16) NOT NULL DEFAULT '0',
  `m_rep` tinyint(1) NOT NULL DEFAULT '1',
  `m_fow` tinyint(1) NOT NULL DEFAULT '1',
  `m_pm` tinyint(1) NOT NULL DEFAULT '1',
  `theme` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `domain` (`domain`),
  KEY `blogtag` (`blogtag`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_member
-- ----------------------------
INSERT INTO `wh_member` VALUES ('1', '1', '1', 'admin@admin.com', '1d6a0266434297b8c2771de4fca12a4a', 'E95I8c', '', '', '火星', null, null, '1', '0', '0', '', '1420680581', '1420706364', '127.0.0.1', '127.0.0.1', '1', '1', '1', null);
INSERT INTO `wh_member` VALUES ('2', '1', '1', '1@nihao.com', '804ec9e27f66fb63e5c209e7539d285d', 'M~2Y5q', 'aaa', 'aaaa', '火星', '艺术,时尚', '', '1', '1', '1', '', '1420770068', '1420770281', '127.0.0.1', '127.0.0.1', '1', '1', '1', null);

-- ----------------------------
-- Table structure for `wh_memberex`
-- ----------------------------
DROP TABLE IF EXISTS `wh_memberex`;
CREATE TABLE `wh_memberex` (
  `openid` char(32) NOT NULL COMMENT '登陆唯一id',
  `token` char(32) NOT NULL COMMENT '验证凭据',
  `secret` char(32) NOT NULL,
  `types` char(4) NOT NULL COMMENT '类型 QQ SINA W163',
  `uid` int(10) NOT NULL COMMENT '是否关联账户',
  `expires` int(10) NOT NULL COMMENT '是否过期',
  PRIMARY KEY (`openid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='开放登陆';

-- ----------------------------
-- Records of wh_memberex
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_models`
-- ----------------------------
DROP TABLE IF EXISTS `wh_models`;
CREATE TABLE `wh_models` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `icon` varchar(50) NOT NULL COMMENT '图标或样式标示符',
  `name` varchar(50) NOT NULL,
  `modelfile` char(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `mdesc` varchar(255) NOT NULL,
  `version` varchar(10) NOT NULL,
  `author` varchar(20) DEFAULT 'SYSTEM',
  `feedtpl` text NOT NULL,
  `cfg` text NOT NULL COMMENT 'conf',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_models
-- ----------------------------
INSERT INTO `wh_models` VALUES ('1', 'text', '文字', 'word.class.php', '1', '发布文字', '1.0', 'SYSTEM', '', 'imguplod--1--是否开启图片上传\nimguploadsize--2048--图片上传尺寸不设置取全局\nimagetype--jpg|jpge|png|gif--图片上传类型');
INSERT INTO `wh_models` VALUES ('2', 'music', '音乐', 'music.class.php', '1', '发布音乐', '1.0', 'SYSTEM', '', 'enableurl--1--是否开启引用地址发布\r\nenableupload--1--是否开启上传发布\r\nuploadsize--5000--允许长传大小(KB)\r\nuploadtype--mp3|wma|mid|midi--允许上传的类型');
INSERT INTO `wh_models` VALUES ('4', 'video', '视频', 'video.class.php', '1', '发布视频', '1.0', 'SYSTEM', '', '');
INSERT INTO `wh_models` VALUES ('3', 'photo', '图片', 'photo.class.php', '1', '发布图片', '1.0', 'SYSTEM', '', 'imagetype--jpg|jpge|png|gif--上传类型\nimagesize--20480--上传大小\nimagecount--20--每次最大上传数量');
INSERT INTO `wh_models` VALUES ('6', 'movie', '电影', 'movie.class.php', '1', '发布电影', '1.0', 'SYSTEM', '', 'enableurl--1--是否开启解析功能');

-- ----------------------------
-- Table structure for `wh_mytags`
-- ----------------------------
DROP TABLE IF EXISTS `wh_mytags`;
CREATE TABLE `wh_mytags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `tagid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagid` (`tagid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我收藏的Tag';

-- ----------------------------
-- Records of wh_mytags
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_notice`
-- ----------------------------
DROP TABLE IF EXISTS `wh_notice`;
CREATE TABLE `wh_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '我',
  `sys` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为回复 0为私信 2为通知',
  `foruid` int(10) unsigned NOT NULL COMMENT '谁搞我',
  `title` varchar(50) NOT NULL,
  `info` varchar(500) DEFAULT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `location` varchar(255) NOT NULL COMMENT '跳转位置',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foruid` (`foruid`,`isread`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='我的通知';

-- ----------------------------
-- Records of wh_notice
-- ----------------------------
INSERT INTO `wh_notice` VALUES ('1', '2', '3', '1', '关注通知', '关注了你', '0', 'user|1', '1420770074');

-- ----------------------------
-- Table structure for `wh_pm`
-- ----------------------------
DROP TABLE IF EXISTS `wh_pm`;
CREATE TABLE `wh_pm` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `touid` int(10) NOT NULL,
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `info` varchar(255) NOT NULL,
  `status` int(10) DEFAULT '0' COMMENT '删除标记',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`,`uid`),
  KEY `pminfo` (`uid`,`touid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_pm
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_replay`
-- ----------------------------
DROP TABLE IF EXISTS `wh_replay`;
CREATE TABLE `wh_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `repuid` int(10) unsigned DEFAULT '0' COMMENT '回复某人',
  `msg` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_replay
-- ----------------------------
INSERT INTO `wh_replay` VALUES ('1', '1', '2', null, 'zxcv', '1420770078');

-- ----------------------------
-- Table structure for `wh_setting`
-- ----------------------------
DROP TABLE IF EXISTS `wh_setting`;
CREATE TABLE `wh_setting` (
  `name` varchar(25) NOT NULL,
  `val` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统设置';

-- ----------------------------
-- Records of wh_setting
-- ----------------------------
INSERT INTO `wh_setting` VALUES ('site_title', '网站标题');
INSERT INTO `wh_setting` VALUES ('site_desc', '又一个云边轻博客系统诞生');
INSERT INTO `wh_setting` VALUES ('site_count', '');
INSERT INTO `wh_setting` VALUES ('site_titlepre', '网站副标题');
INSERT INTO `wh_setting` VALUES ('site_keyword', '云边,yunbian,PHP,MYSQL,轻博客,开源,轻博,qing,开源轻博,开源轻博客');
INSERT INTO `wh_setting` VALUES ('regCodeSwitch', '1');
INSERT INTO `wh_setting` VALUES ('loginCodeSwitch', '1');
INSERT INTO `wh_setting` VALUES ('invite_switch', '0');
INSERT INTO `wh_setting` VALUES ('recomm_switch', '0');
INSERT INTO `wh_setting` VALUES ('invite_count', '5');
INSERT INTO `wh_setting` VALUES ('invite_expiration', '10');
INSERT INTO `wh_setting` VALUES ('guestMode', '0');
INSERT INTO `wh_setting` VALUES ('theme_uploadsize', '1048576');
INSERT INTO `wh_setting` VALUES ('theme_upload', '1');
INSERT INTO `wh_setting` VALUES ('show_page_mode', '0');
INSERT INTO `wh_setting` VALUES ('show_ajax_to', '4');
INSERT INTO `wh_setting` VALUES ('show_page_num', '10');
INSERT INTO `wh_setting` VALUES ('hotuser_switch', '1');
INSERT INTO `wh_setting` VALUES ('wizard_switch', '0');
INSERT INTO `wh_setting` VALUES ('theme_uploadtype', 'jpg,png,gif');
INSERT INTO `wh_setting` VALUES ('addimg_upsize', '2097152');
INSERT INTO `wh_setting` VALUES ('addimg_type', 'jpg|png|jpge|bmp');
INSERT INTO `wh_setting` VALUES ('keep_email', 'admin,yunbian');
INSERT INTO `wh_setting` VALUES ('keep_niname', 'yunbian,admin,administrator,master,webmaster,email,username,password');
INSERT INTO `wh_setting` VALUES ('keep_domain', 'www,yunbian,bbs,music,map,index,register,login,tag,now,admin,recommend,discovery,myfollow,mypost,mylikes,myreplays,mynotices,edit,logout,home,gomember,location,showinfo,about,copyright,call,service,privacy,custom,read,pm,user,site');
INSERT INTO `wh_setting` VALUES ('keep_rep', '操你妈,艹你妈');

-- ----------------------------
-- Table structure for `wh_skins`
-- ----------------------------
DROP TABLE IF EXISTS `wh_skins`;
CREATE TABLE `wh_skins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `skindir` varchar(255) NOT NULL COMMENT '主题位置',
  `name` varchar(50) NOT NULL COMMENT '主题名称',
  `author` varchar(50) NOT NULL COMMENT '主题作者',
  `uri` varchar(50) NOT NULL COMMENT '主题主页',
  `version` char(10) NOT NULL COMMENT '主题版本',
  `exclusive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为专属主题',
  `usenumber` int(10) DEFAULT '0' COMMENT '多少人用',
  `setup` text COMMENT '主题钩子',
  `open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统主题表';

-- ----------------------------
-- Records of wh_skins
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_sort`
-- ----------------------------
DROP TABLE IF EXISTS `wh_sort`;
CREATE TABLE `wh_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `order` varchar(255) DEFAULT '0' COMMENT '0',
  `typename` varchar(255) DEFAULT NULL,
  `k` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_sort
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_tags`
-- ----------------------------
DROP TABLE IF EXISTS `wh_tags`;
CREATE TABLE `wh_tags` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `bid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `title` (`title`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_tags_blog`
-- ----------------------------
DROP TABLE IF EXISTS `wh_tags_blog`;
CREATE TABLE `wh_tags_blog` (
  `tagid` int(10) NOT NULL COMMENT 'tagid',
  `uid` int(10) NOT NULL COMMENT 'uid',
  KEY `tagid` (`tagid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='根据某人设置的blogid 获得tagid';

-- ----------------------------
-- Records of wh_tags_blog
-- ----------------------------
INSERT INTO `wh_tags_blog` VALUES ('1', '2');
INSERT INTO `wh_tags_blog` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `wh_tags_system`
-- ----------------------------
DROP TABLE IF EXISTS `wh_tags_system`;
CREATE TABLE `wh_tags_system` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '标签',
  `num` int(10) unsigned DEFAULT '0' COMMENT '标签使用率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统整理标签表';

-- ----------------------------
-- Records of wh_tags_system
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_term`
-- ----------------------------
DROP TABLE IF EXISTS `wh_term`;
CREATE TABLE `wh_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_term
-- ----------------------------
INSERT INTO `wh_term` VALUES ('1', 'name1', '0', null, '0', '0');
INSERT INTO `wh_term` VALUES ('2', 'name2', '1', null, '0', '0');
INSERT INTO `wh_term` VALUES ('3', 'name3', '1', null, '0', null);

-- ----------------------------
-- Table structure for `wh_theme`
-- ----------------------------
DROP TABLE IF EXISTS `wh_theme`;
CREATE TABLE `wh_theme` (
  `uid` int(10) NOT NULL,
  `config` text,
  `setup` text,
  `css` text,
  `img1` varchar(255) DEFAULT NULL,
  `img2` varchar(255) DEFAULT NULL,
  `img3` varchar(255) DEFAULT NULL,
  `img4` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人主题表';

-- ----------------------------
-- Records of wh_theme
-- ----------------------------
