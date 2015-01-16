/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : yunbian

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-01-16 17:44:27
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_ad_unit
-- ----------------------------
INSERT INTO `wh_ad_unit` VALUES ('1', '首页右侧底部广告', '首页右侧底部广告', '1.jpg', '1', '1', '0');
INSERT INTO `wh_ad_unit` VALUES ('2', '首页顶部广告位', '首页顶部广告位', '2.jpg', '2', '1', '0');
INSERT INTO `wh_ad_unit` VALUES ('3', '发现频道广告位', '发现频道广告位', '3.jpg', '4', '1', '0');
INSERT INTO `wh_ad_unit` VALUES ('4', '推荐频道顶部广告位', '推荐频道顶部广告位', '4.jpg', '3', '1', '0');
INSERT INTO `wh_ad_unit` VALUES ('5', '用户主页右侧广告位', '用户主页右侧广告位', '5.jpg', '5', '1', '0');
INSERT INTO `wh_ad_unit` VALUES ('6', '用户主页详情页广告位', '用户主页详情页广告位', '6.jpg', '6', '1', '0');
INSERT INTO `wh_ad_unit` VALUES ('7', '首页头部导航', '首页头部导航', '', '7', '0', '1');

-- ----------------------------
-- Table structure for `wh_article`
-- ----------------------------
DROP TABLE IF EXISTS `wh_article`;
CREATE TABLE `wh_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` varchar(255) DEFAULT NULL,
  `imgs` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `tpl` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_article
-- ----------------------------
INSERT INTO `wh_article` VALUES ('8', '剑桥新闻1', '<p>我是宸宝妈妈，我是一位每天往返10公里送孩子上幼儿园的妈妈，我参加了宸宝幼儿园的家长志愿周，这是我在伊顿幼儿园一天的感受：</p>\r\n\r\n                    <p style=\"text-indent: 0em;\">早晨7：00</p>\r\n                    <p style=\"color: #444444;font-size: 16px;line-height: 26px;padding-top: 0px;\">宸宝睁开眼睛第一句话：“妈妈，今天你去班里给我当老师吗？”我低声说：“是的，宝贝儿。”虽然我的语气中带着坚定。但是内心却忐忑不安，因为我不知道今天我能否胜任这个角色。</p>\r\n\r\n                    <p style=\"text-indent: 0em;\">早晨8：00</p>\r\n                    <p style=\"color: #444444;font-size: 16px;line-height: 26px;padding-top: 5px;\">伊顿慧智双语幼儿园——济南大地锐城校园\r\n                        <br /> 早上好，爷爷。宸宝一进幼儿园的门口就大声的给幼儿园保安打招呼。保安叔叔也回应宸宝，你好小朋友。这简单的称呼一下拉近了人与人之间的距离，在孩子的眼里没有职务级别之分，只有尊重……这一点其实是我一直很看重的。\r\n                    </p>\r\n                    <p style=\"text-align:center;\">\r\n                    </p>\r\n                    <p>进入幼儿园大厅，就听到good morning宸宝，路老师带着满脸的微笑给宸宝打招呼，宸宝大声的回应，good morning路老师，然后接受幼儿园校医的晨检，这里说明一下，晨检是每位儿童到幼儿园的第一项工作。老师检查孩子的嗓子，双手，体温。如果都是正常就会发一个小绿牌示意这是健康宝宝，如果嗓子有点红，或者最近有过发烧，就发给小朋友一个黄色牌，示意班里老师要注意这个小朋友，多观察，多给喝水……在这点上我觉得伊顿做的特别好。</p>\r\n\r\n                    <p>宸宝领着绿牌准备上楼，这时候有位别的班老师喊宸宝早，宸宝也兴奋的跟老师打招呼，我很诧异，因为平时我不接送宸宝不认识那位老师，不知道老师姓啥，所以只能微笑，这位老师说，我可喜欢宸宝了，见了就逗他。哈，我这内心小激动了一下，这臭小子还挺有人缘的。</p>', '1421037248', null, '54b34ebf8bb39ggt1.png', '1', '剑桥新闻1剑桥新闻1剑桥新闻1剑桥新闻1', '31', 'information_zd', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('9', '剑桥新闻2', '<p>剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2<br/></p>', '1421037317', null, '54b34f044e9fdtfrfgf.jpg', '1', '剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2', '31', 'information_zd', '剑桥新世纪幼q园1');
INSERT INTO `wh_article` VALUES ('10', '剑桥新闻3', '<p>剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2</p>', '1421037327', null, '54b34f0e6e86etfrfgf.jpg', '1', '剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2', '31', 'information_zd', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('11', '教育一', '<p>教育一</p>', '1421042690', null, '54b3640120339datd.png', '1', '教育一', '4', 'information_zd', null);
INSERT INTO `wh_article` VALUES ('12', '教育2', '<p>教育2教育2</p>', '1421042707', null, '54b36411f3ccddatd.png', '1', '教育2教育2', '4', 'information_zd', null);
INSERT INTO `wh_article` VALUES ('13', '教育3', '<p>教育3教育3</p>', '1421042726', null, '54b3642578109datd.png', '1', '教育3教育3教育3', '4', 'information_zd', null);
INSERT INTO `wh_article` VALUES ('14', '教育4', '<p>教育4教育4</p>', '1421042742', null, '54b364359767bdatd.png', '1', '教育4教育4', '4', 'information_zd', null);
INSERT INTO `wh_article` VALUES ('15', '剑桥简介', '<p>保定剑桥幼儿园隶属于保定剑桥教育集团，自2002年成立至今，现拥有近30所幼儿园。在“以生态式教育，培养完整儿童”的教育理念的指引下，兼顾国际视野与中国文化传统，为每一个孩子量身定制最适合自身的学习方法，致力于培养具有“中国灵魂、世界眼光、科学品格、健康心格、强壮体格”的健康、快乐、有爱、创新的世界小公民。</p><p>集团旗下的近30所幼儿园，建筑面积在1500㎡-5500㎡之间，注重自然生态和人文生态的有机结合，让孩子在自然、环保的环境中自由发展，感受生命成长的过程。宽敞、平整的活动场地，先进的设施设备，各类专用室及丰富的教玩具、活动器械，充分满足了幼儿活动的需求；密布的竹林，别具一格；水车沙池，相映成趣；种植养殖区更是培养幼儿动手能力、观察能力的好去处……洁净宽敞、绿色生态、温馨优美的园所环境，自由、平等、和谐的人文氛围，筑就了全体师生学习成长的乐园。</p><p>集团立足“优质资源均衡” 的高度，力求从集团化管理模式、教师队伍培养、办学特色等方面多管齐下，以丰厚的教育底蕴、一流的教学质量、优质的教师队伍以及人性化的园舍环境，为孩子们营造了一个又一个张扬个性、开启智慧的乐园，每一个幼儿园都彰显出独特的风景。集团坚持以孩子发展为本、教研与科研结合，真正实现集团化办园朝着优质、均衡</p><p><br/></p>', '1421114653', null, '', '1', '剑桥简介剑桥简介剑桥简介剑桥简介剑桥简介', '10', null, null);
INSERT INTO `wh_article` VALUES ('16', '联系我们', '<h5>保定剑桥幼儿园</h5><ul class=\" list-paddingleft-2\"><li>总部地址：保定市高开区盛兴中路369号</li><li>联系电话：0312-3122001</li><li>邮 &nbsp; &nbsp; &nbsp;编：071000</li><li>e-mali：54974514@qq.com</li></ul><iframe class=\"ueditor_baidumap\" src=\"http://localhost/yunbian/statics/ueditor/dialogs/map/show.html#center=115.501866,38.884406&zoom=16&width=530&height=340&markers=115.499099,38.883844&markerStyles=l,A\" frameborder=\"0\" height=\"344\" width=\"534\"></iframe>', '1421116007', '', '', '1', '', '14', '', null);
INSERT INTO `wh_article` VALUES ('17', '办学理念', '<p style=\"text-indent:inherit;\"><span style=\"display:block; color:#2d9cb5; font-size:18px;\">办学理念</span>\r\n            以生态式教育，培养完整儿童</p>\r\n            \r\n            <p style=\"text-indent:inherit;\"><span style=\"display:block; color:#2d9cb5; font-size:18px;\">教育方式</span>\r\n            剑桥关注每一个孩子，剑桥深爱每一个孩子，剑桥不让任何孩子落伍</p>\r\n            \r\n            <p style=\"text-indent:inherit;\"><span style=\"display:block; color:#2d9cb5; font-size:18px;\">培养目标</span>\r\n            幼儿培养目标：健康活泼、文明友善、聪明好学、自信大方。<br />\r\n            健康活泼：身心得到良好发展，学会自立、学会交往、学会生存。<br />\r\n            文明友善：懂得爱护自己、爱护别人、爱护环境，懂得与人和谐相处。<br />\r\n            聪明好学：喜欢探究、喜欢学习、积极动手动脑、心灵手巧。<br />\r\n            勇敢自信：具有良好的个性品质，会面对困难，有初步责任感。</p>\r\n            \r\n            <p style=\"text-indent:inherit;\"><span style=\"display:block; color:#2d9cb5; font-size:18px;\">发展规划</span>\r\n            立足长远，跨越发展，打造精品，创建名园</p>', '1421116007', null, null, '1', null, '11', null, null);
INSERT INTO `wh_article` VALUES ('18', '剑桥新世纪幼儿园1', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\">\r\n    <li>\r\n        <p>\r\n            银杏路527号新世纪花园小区内\r\n        </p>\r\n    </li>\r\n    <li>\r\n        <p>\r\n            TEL: 0312-3152998\r\n        </p>\r\n    </li>\r\n</ul>', '1421203210', null, '54b5d706e86c5ggt6.png', '1', '剑桥新世纪幼儿园1', '40', 'http://aa.aa.aa', null);
INSERT INTO `wh_article` VALUES ('19', '剑桥新世纪幼儿园2', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\">\r\n    <li>\r\n        <p>\r\n            银杏路527号新世纪花园小区内\r\n        </p>\r\n    </li>\r\n    <li>\r\n        <p>\r\n            TEL: 0312-3152998\r\n        </p>\r\n    </li>\r\n</ul>', '1421203210', null, '54b5d706e86c5ggt6.png', '1', '剑桥新世纪幼儿园2', '40', 'http://aa.aa.aa', null);
INSERT INTO `wh_article` VALUES ('20', '剑桥设备', '<p>剑桥设备剑桥设备剑桥设备剑桥设备剑桥设备剑桥设备剑桥设备剑桥设备剑桥设备剑桥设备</p>', '1421207409', null, '', '1', '剑桥设备剑桥设备剑桥设备剑桥设备', '15', null, null);
INSERT INTO `wh_article` VALUES ('21', '放心食堂', '<p style=\"text-indent:2em; font-size:14px;\"><span style=\"font-size:36px; font-weight:normal;\">幼</span>儿的膳食工作在幼儿园整体工作中占有非常重要的位置。大多数幼儿家长在为自己宝宝选择幼儿园的时候，不仅注重幼儿园教育教学，设备设施，整体环境，还特别关心幼儿在园内的膳食情况。在幼儿园，食堂管理必须规范，因为孩子们的一日三餐都在食堂，一定要做到让孩子满意、让家长放心。</p>\r\n            <p style=\"text-indent:2em; padding-top:40px;\"></p>\r\n            <p style=\"text-indent:2em; padding-top:40px;font-size:14px;\"><span style=\"font-size:36px; font-weight:normal;\">我</span>们本着卫生、安全、富有营养、利于消化的总要求，每周为幼儿制定营养食谱，做到品种多样，荤素搭配合理并保证按量供给。为了提高伙食质量，我们在菜肴的搭配、 烹饪上下功夫， 保证幼儿各类营养素摄取均衡。同时我们还将一日食谱向家长公示，让家长了解孩子在园的用餐情况，定期有保健医生、营养员巡视幼儿进餐情况，了解食物是否符 合幼儿的口味，发现问题及时改正。 在饮食卫生方面，我们有自己的生态养殖场和种植园，以及严格的供应商管理制度和统一采购、统一配送的管理方式，严格把控采购、验收关。食堂内都配备了先进的设备，食堂工作人员每天都要完成清洗、操作、消毒等必须工作，并对餐具要做到\"一用一消毒\"。食堂工作人员都要持有效的健康证，并且每年都要到局医院进行定期体检，工作期间要按要求穿戴好工作衣帽，保持个人卫生。</p>\r\n        \r\n            <p style=\"text-indent:2em; padding-top:40px;font-size:14px;\"><span style=\"font-size:36px; font-weight:normal;\">幼</span>儿园饮食安全是一项长期性的工作，常抓不懈，努力提高食堂服务质量和服务水平，为幼儿的健康饮食做好保障，让孩子满意，让家长放心。</p>\r\n', '1421207409', null, null, '1', null, '16', null, null);
INSERT INTO `wh_article` VALUES ('22', '魅力教师', '魅力教师魅力教师魅力教师魅力教师魅力教师魅力教师魅力教师魅力教师', '1421207409', null, null, '1', null, '17', null, null);
INSERT INTO `wh_article` VALUES ('23', '集团文化', '集团文化集团文化集团文化集团文化', '1421207409', null, null, '1', null, '12', null, null);
INSERT INTO `wh_article` VALUES ('25', '剑桥特色教学1', '<p>剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2</p>', '1421037327', null, '54b34f0e6e86etfrfgf.jpg', '1', '特色教学特色教学特色教学特色教学特色教学特色教学', '47', 'information_zd', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('26', '剑桥特色教学2', '<p>剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2</p>', '1421037327', null, '54b34f0e6e86etfrfgf.jpg', '1', '特色教学特色教学特色教学特色教学特色教学特色教学', '47', 'information_zd', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('27', '剑桥特色教学3', '<p>剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2</p>', '1421037327', null, '54b34f0e6e86etfrfgf.jpg', '1', '特色教学特色教学特色教学特色教学特色教学特色教学', '47', 'information_zd', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('28', '剑桥特色教学4', '<p>剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2</p>', '1421037327', null, '54b34f0e6e86etfrfgf.jpg', '1', '特色教学特色教学特色教学特色教学特色教学特色教学', '47', 'information_zd', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('29', '剑桥特色教学5', '<p>剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2剑桥新闻2</p>', '1421037327', null, '54b34f0e6e86etfrfgf.jpg', '1', '特色教学特色教学特色教学特色教学特色教学特色教学', '47', 'information_zd', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('30', '剑桥周刊期刊名称1', '<p>剑桥周刊期刊名称1剑桥周刊期刊名称1</p>', '1421219340', null, '54b61609a19c9zhoytp.jpg', '1', '剑桥周刊期刊名称1剑桥周刊期刊名称1剑桥周刊期刊名称1剑桥周刊期刊名称1剑桥周刊期刊名称1', '39', 'education_jqzk_zd', null);
INSERT INTO `wh_article` VALUES ('31', '剑桥周刊期刊名称2', '<p>期刊简介期刊，介期刊简介刊简介期刊刊简刊简刊简介期刊简介期刊简介，简介期刊，介</p>', '1421037327', null, '54b61609a19c9zhoytp.jpg', '1', '期刊简介期刊，介期刊简介刊简介期刊刊简刊简刊简介期刊简介期刊简介，简介期刊，介', '39', 'education_jqzk_zd', '');
INSERT INTO `wh_article` VALUES ('32', '剑桥周刊期刊名称3', '<p>期刊简介期刊，介期刊简介刊简介期刊刊简刊简刊简介期刊简介期刊简介，简介期刊，介</p>', '1421037327', null, '54b61609a19c9zhoytp.jpg', '1', '期刊简介期刊，介期刊简介刊简介期刊刊简刊简刊简介期刊简介期刊简介，简介期刊，介', '39', 'education_jqzk_zd', '');
INSERT INTO `wh_article` VALUES ('33', '剑桥周刊期刊名称4', '<p>期刊简介期刊，介期刊简介刊简介期刊刊简刊简刊简介期刊简介期刊简介，简介期刊，介</p>', '1421037327', null, '54b61609a19c9zhoytp.jpg', '1', '期刊简介期刊，介期刊简介刊简介期刊刊简刊简刊简介期刊简介期刊简介，简介期刊，介', '39', 'education_jqzk_zd', '');
INSERT INTO `wh_article` VALUES ('34', '剑桥周刊期刊名称5', '<p>期刊简介期刊，介期刊简介刊简介期刊刊简刊简刊简介期刊简介期刊简介，简介期刊，介</p>', '1421037327', null, '54b61609a19c9zhoytp.jpg', '1', '期刊简介期刊，介期刊简介刊简介期刊刊简刊简刊简介期刊简介期刊简介，简介期刊，介', '39', 'education_jqzk_zd', '');
INSERT INTO `wh_article` VALUES ('35', '少儿芭蕾舞表演1', '<p>少儿芭蕾舞表演1少儿芭蕾舞表演1少儿芭蕾舞表演1<br/></p>', '1421221228', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b61d2e3e66bW020100712316785681484.jpg', '1', '少儿芭蕾舞表演1', '18', 'life_zy', null);
INSERT INTO `wh_article` VALUES ('36', '少儿芭蕾舞表演2', '<p>少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2</p>', '1421037327', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b61d2e3e66bW020100712316785681484.jpg', '1', '少儿芭蕾舞表演1少儿芭蕾舞表演1', '18', 'life_zy', '');
INSERT INTO `wh_article` VALUES ('37', '少儿芭蕾舞表演3', '<p>少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2</p>', '1421037327', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b61d2e3e66bW020100712316785681484.jpg', '1', '少儿芭蕾舞表演1少儿芭蕾舞表演1', '18', 'life_zy', '');
INSERT INTO `wh_article` VALUES ('38', '少儿芭蕾舞表演4', '<p>少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2</p>', '1421037327', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b61d2e3e66bW020100712316785681484.jpg', '1', '少儿芭蕾舞表演1少儿芭蕾舞表演1', '18', 'life_zy', '');
INSERT INTO `wh_article` VALUES ('39', '少儿芭蕾舞表演5', '<p>少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2少儿芭蕾舞表演2</p>', '1421037327', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b61d2e3e66bW020100712316785681484.jpg', '1', '少儿芭蕾舞表演1少儿芭蕾舞表演1', '18', 'life_zy', '');
INSERT INTO `wh_article` VALUES ('40', '少儿芭蕾舞表演6', '<p>少儿芭蕾舞表演6少儿芭蕾舞表演6</p>', '1421227265', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b634c25a018W020100712316785681484.jpg', '1', '少儿芭蕾舞表演6少儿芭蕾舞表演6', '18', 'life_zy', null);
INSERT INTO `wh_article` VALUES ('41', '保健天地1', '<p>保健天地保健天地保健天地保健天地保健天地保健天地</p>', '1421037327', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34f0e6e86etfrfgf.jpg', '1', '保健天地保健天地保健天地保健天地保健天地保健天地', '38', 'life_zy', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('42', '保健天地2', '<p>保健天地保健天地保健天地保健天地保健天地保健天地</p>', '1421037327', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34f0e6e86etfrfgf.jpg', '1', '保健天地保健天地保健天地保健天地保健天地保健天地', '38', 'life_zy', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('43', '保健天地3', '<p>保健天地保健天地保健天地保健天地保健天地保健天地</p>', '1421037327', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34f0e6e86etfrfgf.jpg', '1', '保健天地保健天地保健天地保健天地保健天地保健天地', '38', 'life_zy', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('44', '保健天地4', '<p>保健天地保健天地保健天地保健天地保健天地保健天地</p>', '1421037327', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34f0e6e86etfrfgf.jpg', '1', '保健天地保健天地保健天地保健天地保健天地保健天地', '38', 'life_zy', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('45', '保健天地5', '<p>保健天地保健天地保健天地保健天地保健天地保健天地</p>', '1421037327', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34f0e6e86etfrfgf.jpg', '1', '保健天地保健天地保健天地保健天地保健天地保健天地', '38', 'life_zy', '剑桥新世纪幼q园2');
INSERT INTO `wh_article` VALUES ('46', '父母学院1', '<p>父母学院父母学院父母学院</p>', '1421037248', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34ebf8bb39ggt1.png', '1', '剑桥新闻1剑桥新闻1剑桥新闻1剑桥新闻1', '34', 'life_zy', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('47', '父母学院2', '<p>父母学院父母学院父母学院</p>', '1421037248', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34ebf8bb39ggt1.png', '1', '剑桥新闻1剑桥新闻1剑桥新闻1剑桥新闻1', '34', 'life_zy', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('48', '父母学院3', '<p>父母学院父母学院父母学院</p>', '1421037248', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34ebf8bb39ggt1.png', '1', '剑桥新闻1剑桥新闻1剑桥新闻1剑桥新闻1', '34', 'life_zy', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('49', '幼儿学堂1', '<p>幼儿学堂幼儿学堂幼儿学堂幼儿学堂幼儿学堂</p>', '1421037248', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34ebf8bb39ggt1.png', '1', '剑桥新闻1剑桥新闻1剑桥新闻1剑桥新闻1', '35', 'life_zy', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('50', '幼儿学堂2', '<p>幼儿学堂幼儿学堂幼儿学堂幼儿学堂幼儿学堂</p>', '1421037248', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34ebf8bb39ggt1.png', '1', '剑桥新闻1剑桥新闻1剑桥新闻1剑桥新闻1', '35', 'life_zy', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('51', '幼儿学堂3', '<p>幼儿学堂幼儿学堂幼儿学堂幼儿学堂幼儿学堂</p>', '1421037248', '[\"54b634deebb15ggt3.png\",\"54b634e683e9afenyuantu1.jpg\",\"54b634ef252adggt1.png\",\"54b634f78d532ggt9.png\"]', '54b34ebf8bb39ggt1.png', '1', '剑桥新闻1剑桥新闻1剑桥新闻1剑桥新闻1', '35', 'life_zy', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('52', '招生公告1', '<p>招生公告招生公告招生公告</p>', '1421037248', null, '54b34ebf8bb39ggt1.png', '1', '招生公告招生公告招生公告', '26', 'information_zd', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('53', '招生公告2', '<p>招生公告招生公告招生公告</p>', '1421037248', null, '54b34ebf8bb39ggt1.png', '1', '招生公告招生公告招生公告', '26', 'information_zd', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('54', '招生公告3', '<p>招生公告招生公告招生公告</p>', '1421037248', null, '54b34ebf8bb39ggt1.png', '1', '招生公告招生公告招生公告', '26', 'information_zd', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('55', '为什么选择剑桥1', '<p>为什么选择剑桥</p>', '1421037248', null, '54b34ebf8bb39ggt1.png', '1', '为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥桥为什么选择剑桥为什么选择剑桥为什么选择剑桥', '29', 'information_zd', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('56', '为什么选择剑桥2', '<p>为什么选择剑桥</p>', '1421037248', null, '54b34ebf8bb39ggt1.png', '1', '为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥桥为什么选择剑桥为什么选择剑桥为什么选择剑桥', '29', 'information_zd', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('57', '为什么选择剑桥3', '<p>为什么选择剑桥</p>', '1421037248', null, '54b34ebf8bb39ggt1.png', '1', '为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥', '29', 'information_zd', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('58', '为什么选择剑桥4', '<p>为什么选择剑桥</p>', '1421037248', null, '54b34ebf8bb39ggt1.png', '1', '为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥', '29', 'information_zd', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('59', '为什么选择剑桥5', '<p>为什么选择剑桥</p>', '1421037248', null, '54b34ebf8bb39ggt1.png', '1', '为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥为什么选择剑桥', '29', 'information_zd', '剑桥新世纪幼q园');
INSERT INTO `wh_article` VALUES ('60', '加盟剑桥', '<p><img alt=\"8加盟剑桥_03.png\" src=\"/ueditor/php/upload/image/20150115/1421310364961502.png\" title=\"1421310364961502.png\"/></p>', '1421310372', '', '', '1', '', '8', '', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of wh_attachments
-- ----------------------------
INSERT INTO `wh_attachments` VALUES ('28', '0', 'attachs/tmp/0548086896.png', 'BaiduShurufa_2015-1-10_15-4-31.png', '706', 'png', '2', '1420955288');
INSERT INTO `wh_attachments` VALUES ('29', '0', 'attachs/tmp/0548129751.png', 'BaiduShurufa_2015-1-11_13-10-55.png', '5840', 'png', '2', '1420955292');
INSERT INTO `wh_attachments` VALUES ('30', '26', 'attachs/15/1/13/26/0821059088.png', '', '687884', 'png', '1', '1421137265');

-- ----------------------------
-- Table structure for `wh_baoming`
-- ----------------------------
DROP TABLE IF EXISTS `wh_baoming`;
CREATE TABLE `wh_baoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bbname` varchar(255) DEFAULT NULL,
  `bbsr` varchar(255) DEFAULT NULL,
  `ruyuan` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `xuexiao` varchar(255) DEFAULT NULL,
  `yijian` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_baoming
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
  `term_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `tag` (`tag`),
  KEY `uid` (`uid`),
  KEY `top` (`top`),
  KEY `open` (`open`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_blog
-- ----------------------------
INSERT INTO `wh_blog` VALUES ('24', '2', '0', '1', '', 'asdf', '[attribute]a:2:{i:0;s:28:\"attachs/15/1/11/24/t_0539041582.png\";i:1;s:28:\"attachs/15/1/11/24/t_0539098306.png\";}[/attribute]asdf<a href=\"attachs/15/1/11/24/0539041582.png\"><img src=\"attachs/15/1/11/24/t_0539041582.png\" class=\"feedimg\" alt=\"\" /></a><a href=\"attachs/15/1/11/24/0539098306.png\"><img src=\"attachs/15/1/11/24/t_0539098306.png\" class=\"feedimg\" alt=\"\" /></a>', '1', '1', '0', '0', '0', '1420954751', null);
INSERT INTO `wh_blog` VALUES ('25', '1', '0', '1', '', '啊三扥阿桑扥', '[attribute]a:0:{}[/attribute]三扥阿瑟', '1', '0', '0', '0', '0', '1421137254', null);
INSERT INTO `wh_blog` VALUES ('26', '1', '0', '3', '', 'zxczxcv', '[attribute]a:2:{s:5:\"count\";i:1;s:3:\"img\";a:1:{i:0;a:2:{s:3:\"url\";s:28:\"attachs/15/1/13/26/t_0821059088.png\";s:4:\"desc\";s:0:\"\";}}}[/attribute]zxcvzxcv', '1', '1', '0', '0', '0', '1421137268', null);

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
INSERT INTO `wh_cache` VALUES ('recommend_shuffle_3', '1421393085s:326:\"a:1:{i:0;a:7:{s:3:\"bid\";s:2:\"26\";s:3:\"uid\";s:1:\"1\";s:3:\"img\";s:35:\"attachs/15/1/13/26/t_0821059088.png\";s:8:\"username\";s:4:\"asdf\";s:5:\"h_url\";s:55:\"/yunbian/index.php?c=userblog&a=index&domain=home&uid=1\";s:5:\"h_img\";s:36:\"/yunbian/avatar.php?uid=1&size=small\";s:5:\"b_url\";s:43:\"/yunbian/index.php?c=userblog&a=show&bid=26\";}}\";');
INSERT INTO `wh_cache` VALUES ('findeUserTag_1', '1421223668s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('systag', '1720682140s:2504:\"a:26:{i:0;a:4:{s:3:\"cid\";s:1:\"1\";s:8:\"catename\";s:6:\"艺术\";s:4:\"sort\";s:1:\"1\";s:4:\"used\";s:1:\"0\";}i:1;a:4:{s:3:\"cid\";s:1:\"2\";s:8:\"catename\";s:6:\"时尚\";s:4:\"sort\";s:1:\"2\";s:4:\"used\";s:1:\"0\";}i:2;a:4:{s:3:\"cid\";s:1:\"3\";s:8:\"catename\";s:6:\"音乐\";s:4:\"sort\";s:1:\"3\";s:4:\"used\";s:1:\"0\";}i:3;a:4:{s:3:\"cid\";s:1:\"4\";s:8:\"catename\";s:6:\"摄影\";s:4:\"sort\";s:1:\"4\";s:4:\"used\";s:1:\"0\";}i:4;a:4:{s:3:\"cid\";s:1:\"5\";s:8:\"catename\";s:6:\"阅读\";s:4:\"sort\";s:1:\"5\";s:4:\"used\";s:1:\"0\";}i:5;a:4:{s:3:\"cid\";s:1:\"6\";s:8:\"catename\";s:6:\"动漫\";s:4:\"sort\";s:1:\"6\";s:4:\"used\";s:1:\"0\";}i:6;a:4:{s:3:\"cid\";s:1:\"7\";s:8:\"catename\";s:6:\"游戏\";s:4:\"sort\";s:1:\"7\";s:4:\"used\";s:1:\"0\";}i:7;a:4:{s:3:\"cid\";s:1:\"8\";s:8:\"catename\";s:6:\"随笔\";s:4:\"sort\";s:1:\"8\";s:4:\"used\";s:1:\"0\";}i:8;a:4:{s:3:\"cid\";s:1:\"9\";s:8:\"catename\";s:6:\"插画\";s:4:\"sort\";s:1:\"9\";s:4:\"used\";s:1:\"0\";}i:9;a:4:{s:3:\"cid\";s:2:\"10\";s:8:\"catename\";s:6:\"设计\";s:4:\"sort\";s:2:\"10\";s:4:\"used\";s:1:\"0\";}i:10;a:4:{s:3:\"cid\";s:2:\"11\";s:8:\"catename\";s:6:\"建筑\";s:4:\"sort\";s:2:\"11\";s:4:\"used\";s:1:\"0\";}i:11;a:4:{s:3:\"cid\";s:2:\"12\";s:8:\"catename\";s:6:\"创意\";s:4:\"sort\";s:2:\"12\";s:4:\"used\";s:1:\"0\";}i:12;a:4:{s:3:\"cid\";s:2:\"13\";s:8:\"catename\";s:6:\"猎图\";s:4:\"sort\";s:2:\"13\";s:4:\"used\";s:1:\"0\";}i:13;a:4:{s:3:\"cid\";s:2:\"14\";s:8:\"catename\";s:6:\"宠物\";s:4:\"sort\";s:2:\"14\";s:4:\"used\";s:1:\"0\";}i:14;a:4:{s:3:\"cid\";s:2:\"15\";s:8:\"catename\";s:6:\"汽车\";s:4:\"sort\";s:2:\"15\";s:4:\"used\";s:1:\"0\";}i:15;a:4:{s:3:\"cid\";s:2:\"16\";s:8:\"catename\";s:6:\"家居\";s:4:\"sort\";s:2:\"16\";s:4:\"used\";s:1:\"0\";}i:16;a:4:{s:3:\"cid\";s:2:\"17\";s:8:\"catename\";s:9:\"互联网\";s:4:\"sort\";s:2:\"17\";s:4:\"used\";s:1:\"0\";}i:17;a:4:{s:3:\"cid\";s:2:\"18\";s:8:\"catename\";s:6:\"旅行\";s:4:\"sort\";s:2:\"18\";s:4:\"used\";s:1:\"0\";}i:18;a:4:{s:3:\"cid\";s:2:\"19\";s:8:\"catename\";s:6:\"数码\";s:4:\"sort\";s:2:\"19\";s:4:\"used\";s:1:\"0\";}i:19;a:4:{s:3:\"cid\";s:2:\"20\";s:8:\"catename\";s:6:\"影视\";s:4:\"sort\";s:2:\"20\";s:4:\"used\";s:1:\"0\";}i:20;a:4:{s:3:\"cid\";s:2:\"21\";s:8:\"catename\";s:6:\"美食\";s:4:\"sort\";s:2:\"21\";s:4:\"used\";s:1:\"0\";}i:21;a:4:{s:3:\"cid\";s:2:\"22\";s:8:\"catename\";s:6:\"恋物\";s:4:\"sort\";s:2:\"22\";s:4:\"used\";s:1:\"0\";}i:22;a:4:{s:3:\"cid\";s:2:\"23\";s:8:\"catename\";s:6:\"趣味\";s:4:\"sort\";s:2:\"23\";s:4:\"used\";s:1:\"0\";}i:23;a:4:{s:3:\"cid\";s:2:\"24\";s:8:\"catename\";s:6:\"科学\";s:4:\"sort\";s:2:\"24\";s:4:\"used\";s:1:\"0\";}i:24;a:4:{s:3:\"cid\";s:2:\"25\";s:8:\"catename\";s:6:\"军事\";s:4:\"sort\";s:2:\"25\";s:4:\"used\";s:1:\"0\";}i:25;a:4:{s:3:\"cid\";s:2:\"26\";s:8:\"catename\";s:6:\"体育\";s:4:\"sort\";s:2:\"26\";s:4:\"used\";s:1:\"0\";}}\";');
INSERT INTO `wh_cache` VALUES ('adunit', '1721036981s:1408:\"a:7:{i:1;a:7:{s:2:\"id\";s:1:\"1\";s:5:\"title\";s:24:\"首页右侧底部广告\";s:5:\"adesc\";s:24:\"首页右侧底部广告\";s:3:\"img\";s:5:\"1.jpg\";s:6:\"orders\";s:1:\"1\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"0\";}i:2;a:7:{s:2:\"id\";s:1:\"2\";s:5:\"title\";s:21:\"首页顶部广告位\";s:5:\"adesc\";s:21:\"首页顶部广告位\";s:3:\"img\";s:5:\"2.jpg\";s:6:\"orders\";s:1:\"2\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"0\";}i:3;a:7:{s:2:\"id\";s:1:\"3\";s:5:\"title\";s:21:\"发现频道广告位\";s:5:\"adesc\";s:21:\"发现频道广告位\";s:3:\"img\";s:5:\"3.jpg\";s:6:\"orders\";s:1:\"4\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"0\";}i:4;a:7:{s:2:\"id\";s:1:\"4\";s:5:\"title\";s:27:\"推荐频道顶部广告位\";s:5:\"adesc\";s:27:\"推荐频道顶部广告位\";s:3:\"img\";s:5:\"4.jpg\";s:6:\"orders\";s:1:\"3\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"0\";}i:5;a:7:{s:2:\"id\";s:1:\"5\";s:5:\"title\";s:27:\"用户主页右侧广告位\";s:5:\"adesc\";s:27:\"用户主页右侧广告位\";s:3:\"img\";s:5:\"5.jpg\";s:6:\"orders\";s:1:\"5\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"0\";}i:6;a:7:{s:2:\"id\";s:1:\"6\";s:5:\"title\";s:30:\"用户主页详情页广告位\";s:5:\"adesc\";s:30:\"用户主页详情页广告位\";s:3:\"img\";s:5:\"6.jpg\";s:6:\"orders\";s:1:\"6\";s:6:\"system\";s:1:\"1\";s:7:\"is_show\";s:1:\"0\";}i:7;a:7:{s:2:\"id\";s:1:\"7\";s:5:\"title\";s:18:\"首页头部导航\";s:5:\"adesc\";s:18:\"首页头部导航\";s:3:\"img\";s:0:\"\";s:6:\"orders\";s:1:\"7\";s:6:\"system\";s:1:\"0\";s:7:\"is_show\";s:1:\"1\";}}\";');
INSERT INTO `wh_cache` VALUES ('recommend_shuffle_all', '1420856557s:551:\"a:2:{i:0;a:9:{s:3:\"bid\";s:1:\"2\";s:5:\"title\";s:18:\"分享文字标题\";s:4:\"body\";s:30:\"分享文字标题内容内容\";s:4:\"type\";s:1:\"1\";s:3:\"uid\";s:1:\"2\";s:8:\"username\";s:3:\"aaa\";s:5:\"b_url\";s:42:\"/yunbian/index.php?c=userblog&a=show&bid=2\";s:3:\"tag\";s:0:\"\";s:3:\"img\";s:1:\" \";}i:1;a:9:{s:3:\"bid\";s:1:\"1\";s:5:\"title\";s:18:\"分享文字标题\";s:4:\"body\";s:30:\"分享文字标题内容内容\";s:4:\"type\";s:1:\"1\";s:3:\"uid\";s:1:\"1\";s:8:\"username\";s:0:\"\";s:5:\"b_url\";s:42:\"/yunbian/index.php?c=userblog&a=show&bid=1\";s:3:\"tag\";s:0:\"\";s:3:\"img\";s:1:\" \";}}\";');
INSERT INTO `wh_cache` VALUES ('discoverTag_30', '1420856648s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('myfollow_1', '1420773032s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('findTagHotUser_d41d8cd98f00b204e9800998ecf8427e', '1420855828s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('myfollow_2', '1420957494s:8:\"s:1:\"1\";\";');
INSERT INTO `wh_cache` VALUES ('findeUserTag_2', '1421041692s:4:\"b:0;\";');
INSERT INTO `wh_cache` VALUES ('loginUserHot', '1421401279s:370:\"a:1:{i:0;a:12:{s:2:\"id\";s:1:\"1\";s:3:\"bid\";s:1:\"1\";s:3:\"uid\";s:1:\"2\";s:6:\"repuid\";N;s:3:\"msg\";s:4:\"zxcv\";s:4:\"time\";s:10:\"1420770078\";s:8:\"username\";s:3:\"aaa\";s:7:\"blogtag\";a:2:{i:0;s:6:\"艺术\";i:1;s:6:\"时尚\";}s:5:\"u_url\";s:49:\"/yunbian/index.php?c=userblog&a=index&domain=aaaa\";s:5:\"u_img\";s:37:\"/yunbian/avatar.php?uid=2&size=middle\";s:5:\"b_url\";N;s:7:\"b_title\";N;}}\";');

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
-- Table structure for `wh_jianli`
-- ----------------------------
DROP TABLE IF EXISTS `wh_jianli`;
CREATE TABLE `wh_jianli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` int(11) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_jianli
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
INSERT INTO `wh_member` VALUES ('1', '1', '1', 'admin@admin.com', '1d6a0266434297b8c2771de4fca12a4a', 'E95I8c', '管理员', '', '火星', null, 'asdfasdf', '3', '0', '0', '', '1420680581', '1421397685', '127.0.0.1', '127.0.0.1', '1', '1', '1', null);
INSERT INTO `wh_member` VALUES ('2', '1', '1', '1@nihao.com', '804ec9e27f66fb63e5c209e7539d285d', 'M~2Y5q', 'aaa', 'aaaa', '火星', '艺术,时尚', '', '23', '1', '1', '', '1420770068', '1420770281', '127.0.0.1', '127.0.0.1', '1', '1', '1', null);

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
  `parent_id` int(11) DEFAULT '0',
  `create_time` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '1',
  `cover` varchar(255) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  `tpl` varchar(255) DEFAULT NULL,
  `en_name` varchar(255) DEFAULT NULL,
  `nav` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_term
-- ----------------------------
INSERT INTO `wh_term` VALUES ('1', '关于剑桥', '0', null, '0', '1', '54b345bdf309btfrfgf.jpg', '关于剑桥关于剑桥', '1', 'sdf', 'about cambridge', '1');
INSERT INTO `wh_term` VALUES ('2', '剑桥分园', '0', null, '0', '1', '54b345bdf309btfrfgf.jpg', '保定剑桥幼儿园隶属于保定剑桥教育集团，自2002年成立至今，现拥有近30所幼儿园。在“以生态式教育，培养完整儿童”的教育理念的指引下，兼顾国际视野与中国文化传统，为每一个孩子量 身定制最适合自身的学习方法，致力于培养具有“中国灵魂、世界眼光、科学品格、健康心格、强壮体格”的健康、快乐、有爱、创新的世界小公民。 ', '0', 'park', 'cambridge branch', '1');
INSERT INTO `wh_term` VALUES ('3', '剑桥印象', '0', null, '0', '1', '54b345bdf309btfrfgf.jpg', '剑桥印象剑桥印象剑桥印象', null, null, 'cambridge impression', '1');
INSERT INTO `wh_term` VALUES ('4', '剑桥教育', '0', null, '0', '1', '54b345bdf309btfrfgf.jpg', '剑桥教育剑桥教育剑桥教育剑桥教育', null, '', 'Cambridge Education', '1');
INSERT INTO `wh_term` VALUES ('5', '剑桥生活', '0', null, '0', '1', '54b34d649573ctfrfgf.jpg', '剑桥生活剑桥生活剑桥生活', null, null, null, '1');
INSERT INTO `wh_term` VALUES ('6', '家园共育', '0', null, '0', '1', '54b345bdf309btfrfgf.jpg', '剑桥生活剑桥生活剑桥生活', null, null, 'Home Produced', '1');
INSERT INTO `wh_term` VALUES ('7', '选择剑桥', '0', '', '0', '1', '54b345bdf309btfrfgf.jpg', '剑桥生活剑桥生活剑桥生活', null, null, null, '1');
INSERT INTO `wh_term` VALUES ('8', '加盟剑桥', '0', '', '0', '1', '54b345bdf309btfrfgf.jpg', '剑桥生活剑桥生活剑桥生活', null, 'jiamenjianqiao', null, '1');
INSERT INTO `wh_term` VALUES ('9', '招聘信息', '0', '', '0', '1', '54b345bdf309btfrfgf.jpg', '剑桥生活剑桥生活剑桥生活', null, 'zhaopinxinx', null, '1');
INSERT INTO `wh_term` VALUES ('10', '剑桥简介', '1', null, '0', '1', '54b371c181bcbdatd.png', 'sdfsdf', null, 'page', 'Cambridge Introduction', '1');
INSERT INTO `wh_term` VALUES ('11', '办学理念', '1', null, '0', '1', null, null, null, 'page', 'Educational philosophy', '1');
INSERT INTO `wh_term` VALUES ('12', '集团文化', '1', null, '0', '1', null, null, null, 'page', null, '1');
INSERT INTO `wh_term` VALUES ('13', '剑桥资讯', '1', null, '0', '1', null, null, null, 'information', null, '1');
INSERT INTO `wh_term` VALUES ('14', '联系剑桥', '1', null, '0', '1', null, null, null, 'page', 'Contact Cambridge', '1');
INSERT INTO `wh_term` VALUES ('15', '剑桥设施', '3', null, '0', '1', null, null, null, 'page', 'Cambridge Installation', '1');
INSERT INTO `wh_term` VALUES ('16', '放心食堂', '3', null, '0', '1', null, null, null, 'page', 'Assured Canteen', '1');
INSERT INTO `wh_term` VALUES ('17', '魅力教师', '3', null, '0', '1', null, null, null, 'page', 'School Teacher', '1');
INSERT INTO `wh_term` VALUES ('18', '保教天地【活动】', '5', null, '0', '1', null, null, null, 'life', 'Yasunori World', '1');
INSERT INTO `wh_term` VALUES ('19', '保教天地【课堂】', '5', null, '0', '1', null, null, null, 'life', null, '1');
INSERT INTO `wh_term` VALUES ('20', '我们才艺', '5', null, '0', '1', null, null, null, 'life', null, '1');
INSERT INTO `wh_term` VALUES ('22', '育儿知识', '6', null, '2', '1', '54b36c257e68dggt4.png', '育儿知识育儿知识育儿知识育儿知识育儿知识', '1', 'bjtd', 'Parental Knowledge', '1');
INSERT INTO `wh_term` VALUES ('23', '作息时间', '6', null, '3', '1', null, null, null, 'page', 'Schedule', '1');
INSERT INTO `wh_term` VALUES ('24', '每周食谱', '6', null, '4', '1', null, null, null, 'mzsp', null, '1');
INSERT INTO `wh_term` VALUES ('25', '家园互动', '6', null, '5', '1', null, null, null, 'life', 'Home Interactive', '1');
INSERT INTO `wh_term` VALUES ('26', '招生公告', '7', null, '0', '1', null, null, null, 'bjtd', null, '1');
INSERT INTO `wh_term` VALUES ('27', '我要报名', '7', null, '0', '1', null, null, null, 'wybm', null, '1');
INSERT INTO `wh_term` VALUES ('28', '我要预约', '7', null, '0', '1', null, null, null, 'wyyy', null, '1');
INSERT INTO `wh_term` VALUES ('29', '为什么选择剑桥', '7', null, '0', '1', null, null, null, 'wsmxzjq', 'Why Choose Cambridge', '1');
INSERT INTO `wh_term` VALUES ('30', '入园须知、流程', '7', null, '0', '1', null, null, null, 'page', 'Admission Notice, Process', '1');
INSERT INTO `wh_term` VALUES ('31', '剑桥新闻', '13', null, '0', '1', null, null, null, 'information_list', 'news', '1');
INSERT INTO `wh_term` VALUES ('32', '剑桥公告', '13', null, '0', '1', null, null, null, 'information_list', null, '1');
INSERT INTO `wh_term` VALUES ('33', '宝贝动态', '13', '1421042344', '0', '1', null, null, null, 'information_list', null, '1');
INSERT INTO `wh_term` VALUES ('34', '父母学院', '25', '1421046467', '0', '1', '54b36be28862fggt2.png', '父母学院 父母学院 父母学院 父母学院 父母学院 ', '1', 'life', 'Parents School', '1');
INSERT INTO `wh_term` VALUES ('35', '幼儿学堂', '25', '1421046467', '0', '1', '54b36bfce1f4aggt3.png', '幼儿学堂幼儿学堂幼儿学堂幼儿学堂', '1', 'life', 'Infant School', '1');
INSERT INTO `wh_term` VALUES ('36', '幼儿活动', '25', '1421046467', '0', '1', '54b36c1155c0aggt5.png', '幼儿活动 幼儿活动 幼儿活动 幼儿活动 幼儿活动 ', '1', 'life', 'Infant Activity', '1');
INSERT INTO `wh_term` VALUES ('37', '育儿知识', '25', '1421046467', '0', '1', '54b36c257e68dggt4.png', '育儿知识育儿知识育儿知识育儿知识', '1', 'life', 'Parental Knowledge', '1');
INSERT INTO `wh_term` VALUES ('38', '保健天地', '6', '1421046467', '1', '1', '54b36c377aa41ggt6.png', '保健天地保健天地保健天地保健天地保健天地', '1', 'bjtd', 'World Health Care', '1');
INSERT INTO `wh_term` VALUES ('39', '剑桥周刊', '4', '1421046467', '2', '1', null, null, null, 'education_jqzk', 'Cambridge Week', '1');
INSERT INTO `wh_term` VALUES ('40', '保定南市区', '2', '1421199875', '0', '1', '54b5d1080064bfenyuantu2.jpg', '', '0', 'park_zy', '', '0');
INSERT INTO `wh_term` VALUES ('41', '保定北市区', '2', '1421201743', '0', '1', '54b5d29b9e34bfenyuantu3.jpg', '', '0', 'park_zy', '', '0');
INSERT INTO `wh_term` VALUES ('42', '保定新市区', '2', '1421201815', '0', '1', '54b5d28e55c25fenyuantu4.jpg', '', '0', 'park_zy', '', '0');
INSERT INTO `wh_term` VALUES ('43', '保定新市区', '2', '1421201832', '0', '1', '54b5d287dd7c8fenyuantu5.jpg', '', '0', 'park_zy', '', '0');
INSERT INTO `wh_term` VALUES ('44', '保定周边县', '2', '1421201847', '0', '1', '54b5d27aa4a67fenyuantu3.jpg', '', '0', 'park_zy', '', '0');
INSERT INTO `wh_term` VALUES ('46', '课程体系', '4', '1421201847', '1', '1', null, null, null, 'page', 'Course System', '1');
INSERT INTO `wh_term` VALUES ('47', '特色教学展示', '4', null, '1', '1', null, null, null, 'information_list', 'Featured teaching show', '1');
INSERT INTO `wh_term` VALUES ('48', '教学成果', '4', null, '1', '1', null, null, null, 'information_list', 'Teaching Achievement', '1');

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
INSERT INTO `wh_theme` VALUES ('1', 'a:10:{s:4:\"user\";N;s:5:\"setup\";N;s:15:\"#header_bg|img1\";s:40:\"/attachs/theme/2015/01/13/1421137324.jpg\";s:28:\"#header_bg|background-repeat\";s:5:\"repet\";s:30:\"#header_bg|background-position\";s:13:\"bottom center\";s:32:\"#header_bg|background-attachment\";s:6:\"scroll\";s:27:\"#header_bg|background-color\";s:7:\"#ffffff\";s:13:\"#sign|display\";s:5:\"block\";s:14:\"#title@a|color\";s:7:\"#7d2f2f\";s:18:\"#box_title@a|color\";s:7:\"#b86969\";}', 'a:1:{s:10:\"page_limit\";s:2:\"14\";}', '\n#header_bg{background:url(/attachs/theme/2015/01/13/1421137324.jpg);}\n#header_bg{background-repeat:repet;}\n#header_bg{background-position:bottom center;}\n#header_bg{background-attachment:scroll;}\n#header_bg{background-color:#ffffff;}\n#sign{display:block;}\n#title a{color:#7d2f2f;}\n#box_title a{color:#b86969;}', '2015/01/13/1421137324.jpg', null, null, null, null);

-- ----------------------------
-- Table structure for `wh_zhaopin`
-- ----------------------------
DROP TABLE IF EXISTS `wh_zhaopin`;
CREATE TABLE `wh_zhaopin` (
  `id` int(11) NOT NULL DEFAULT '0',
  `zhiwei` varchar(255) DEFAULT NULL,
  `jingyan` varchar(255) DEFAULT NULL,
  `renshu` varchar(255) DEFAULT NULL,
  `xueli` varchar(255) DEFAULT NULL,
  `didian` varchar(255) DEFAULT NULL,
  `jiezhi` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_zhaopin
-- ----------------------------
