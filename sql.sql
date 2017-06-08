/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : termwork

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-07 18:38:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `album`
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
`username`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拥有者id' ,
`picture_resources`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '照片地址' ,
`from`  int(5) NOT NULL COMMENT '属于那个相册' ,
PRIMARY KEY (`username`),
FOREIGN KEY (`username`) REFERENCES `user` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of album
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `dynamic`
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic` (
`dynamicid`  int(5) NOT NULL AUTO_INCREMENT ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动态内容' ,
`time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布时间' ,
`good`  int(10) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000000 COMMENT '点赞数量' ,
`conmentid`  int(225) NULL DEFAULT NULL COMMENT '回复id' ,
`username`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`dynamicid`),
FOREIGN KEY (`username`) REFERENCES `user` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `usernameDynamic` (`username`) USING BTREE ,
INDEX `conmentid` (`conmentid`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=25

;

-- ----------------------------
-- Records of dynamic
-- ----------------------------
BEGIN;
INSERT INTO `dynamic` VALUES ('1', '测试！！！测试', '2017-5-26', '0000000000', null, 'heyuheng'), ('15', '123', '2017-05-31', '0000000000', null, 'heyuheng'), ('16', '4124', '2017-05-31', '0000000000', null, 'heyuheng'), ('18', '1321', '2017-05-31', '0000000000', null, 'heyuheng'), ('19', '123', '2017-05-31', '0000000000', null, 'heyuheng'), ('22', '123', '2017-05-31', '0000000000', null, 'heyuheng'), ('23', '123213', '2017-06-05', '0000000000', null, 'heyuheng');
COMMIT;

-- ----------------------------
-- Table structure for `dynamiccomment`
-- ----------------------------
DROP TABLE IF EXISTS `dynamiccomment`;
CREATE TABLE `dynamiccomment` (
`commentid`  int(225) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`dynamicid`  int(225) NOT NULL ,
`username`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`commentid`),
FOREIGN KEY (`dynamicid`) REFERENCES `dynamic` (`dynamicid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`username`) REFERENCES `user` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `dynamicid` (`dynamicid`) USING BTREE ,
INDEX `username` (`username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of dynamiccomment
-- ----------------------------
BEGIN;
INSERT INTO `dynamiccomment` VALUES ('000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001', '123', '2017-06-05', '23', 'heyuheng');
COMMIT;

-- ----------------------------
-- Table structure for `eassy`
-- ----------------------------
DROP TABLE IF EXISTS `eassy`;
CREATE TABLE `eassy` (
`eassyid`  int(225) NOT NULL AUTO_INCREMENT ,
`username`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容' ,
`time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布时间' ,
`good`  int(20) NULL DEFAULT 0 COMMENT '点赞数量' ,
`commentid`  int(225) NULL DEFAULT NULL COMMENT '回复id' ,
`type`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'eassy' COMMENT '文章类型' ,
`tag`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标签' ,
`updatetime`  int(10) NULL DEFAULT 0 COMMENT '修改次数' ,
`eassytitle`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`imgres`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`eassyid`),
FOREIGN KEY (`username`) REFERENCES `user` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
INDEX `usernameEassy` (`username`) USING BTREE ,
INDEX `commentid` (`commentid`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=29

;

-- ----------------------------
-- Records of eassy
-- ----------------------------
BEGIN;
INSERT INTO `eassy` VALUES ('1', 'heyuheng', '<p><b>创建后台任务的两种代码模式</b></p>\r\n            <p>后台任务是每个App都需要的一些行为，毕竟主线程是大爷，拖不起，伤不起，脏活累活都只能在不见天日的后台去做。\r\n最简单的后台任务，可以说是直接开一个线程就可以了，或者说来个Service，再开个线程。但这些并不是官方认证的最佳实践，实际上，Google早就考虑到了这一点，并把这些需求进行了封装，给我们提供了非常好的后台任务解决方案，并在Training上进行了讲解：</p>', '2017-05-21', '9', null, 'eassy', null, '0', 'Go1', 'http://oq88oj5l3.bkt.clouddn.com/Termwork/eassyImg5.jpg'), ('2', 'heyuheng', '<p><b>「福利市集」第一位电商合伙人，金浩森。</b></p>\r\n            <p>他，内心居住着一位少年。看他拍的照片，仿佛脑海中那段青春记忆，被生动地展现在眼前。</p>\r\n            <p>“高颜值摄影师”金浩森笑称自己是“老腊肉金十八”，对他来说，拍照做甜品煮咖啡下厨房“那都不是事儿”，如此会生活的可人儿，必须是LOFTER福利市集的第一位电商合伙人。</p>\r\n            <p>这一次，他带来了笔记本&明信片，在福利市集，用最诚意的价格发售。</p>', '2017-05-21', '10', null, 'eassy', null, '0', 'Go2', 'http://oq88oj5l3.bkt.clouddn.com/Termwork/eassyImg2.png'), ('3', 'heyuheng', '<p><b>Android 7.1.1 之实现 3D Touch </b></p>\r\n            <p>Shortcut 是Android-25（Android 7.1）新增的一项类似iOS的 3D Touch 功能的快捷方式组件，但是有着不同的表现形式，因为Android在硬件上不支持触摸压力感应，所以表现形式为长按，而iOS须用力长按。</p>', '2017-05-21', '11', null, 'android', null, '0', 'Go3', 'http://oq88oj5l3.bkt.clouddn.com/Termwork/eassyImg4.jpg'), ('4', 'heyuheng', '<p>所谓排序，就是根据排序码的递增或者递减顺序把数据元素依次排列起来，使一组任意排列的元素变为一组按其排序码线性有序的元素。本文将介绍八种最为经典常用的内部排序算法，包括插入排序(直接插入排序，希尔排序)、选择排序(直接选择排序，堆排序)、交换排序(冒泡排序，快速排序)、归并排序、分配排序(基数排序)。实际上，无论是基本排序方法(直接插入排序，直接选择排序，冒泡排序)，还是高效排序方法(快速排序，堆排序，归并排序)等，它们各有所长，都拥有特定的使用场景。因此，在实际应用中，我们必须根据实际任务的特点和各种排序算法的特性来做出最合适的选择。一般地，我们衡量一个算法的指标包括：</p>', '2017-05-25', '5', null, 'eassy', null, '0', '排序算法概述', null), ('5', 'heyuheng', '<p>之所以做这个项目，是因为公司要尝试用Weex做开发，以减少开发工作量，达到一个人搞定前端的目标。设想当中，如果顺利的话，一个人可以同时搞定iOS/Android两端的开发，尤其是UI方面的开发。传统的工作方式中，同一个UI设计需要iOS/Android两个平台实现基本一致的开发，非常浪费。</p>', '2017-05-25', '6', null, 'eassy', null, '0', '一行代码搞定Weex蓝牙开发', null), ('6', 'heyuheng', '<p>原生函数（native function）是 JavaScript 语言的一部分，这些函数有别于开发者编写的自定义函数。当我们在 profiler 中查看代码的调用栈时，这些函数是被过滤掉的。我们在 profiler 中看到的只有自己写的代码。</p><p>当我们捕获调用栈时，Chrome 并不会捕获 C++ 写的函数。不过，在 V8 引擎中很多 javascript 原生函数都是使用 javascript 语言编写的。</p>', '2017-05-25', '7', null, 'eassy', null, '0', 'Chrome DevTools：在 Profile 性能分析中显示原生 javascript 函数 ', null), ('7', 'heyuheng', '<p>21321321hjkjhkljklkljkl12<br></p>', '2017-05-25', '8', null, 'eassy', null, '0', 'jkljkgkljklagkjkl;g', null), ('8', 'heyuheng', '<p>测试<br></p>', '2017-05-29', '9', null, 'eassy', null, '0', '测试1', null), ('9', 'heyuheng', '<p>测试<br></p>', '2017-05-29', '10', null, 'eassy', null, '0', '测试2', null), ('24', 'heyuheng', '<p>123213<br></p>', '2017-06-05', '12', null, 'eassy', null, '0', '今天开心', null), ('26', 'heyuheng', '<p>123123<br></p>', '2017-06-07', '0', null, 'eassy', null, '0', '123123', null), ('27', 'heyuheng', '<p>dgahkgjlagasg<br></p>', '2017-06-07', '0', null, 'eassy', null, '0', '123124124', null);
COMMIT;

-- ----------------------------
-- Table structure for `eassycomment`
-- ----------------------------
DROP TABLE IF EXISTS `eassycomment`;
CREATE TABLE `eassycomment` (
`commentid`  int(225) NOT NULL AUTO_INCREMENT COMMENT '评论id' ,
`content`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容' ,
`time`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间' ,
`eassyid`  int(225) NOT NULL ,
`username`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`commentid`),
FOREIGN KEY (`username`) REFERENCES `user` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`eassyid`) REFERENCES `eassy` (`eassyid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `eassyid` (`eassyid`) USING BTREE ,
INDEX `Eusername` (`username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of eassycomment
-- ----------------------------
BEGIN;
INSERT INTO `eassycomment` VALUES ('1', '123', '2017-06-05', '24', 'heyuheng'), ('2', '123', '2017-06-05', '24', 'heyuheng');
COMMIT;

-- ----------------------------
-- Table structure for `follow`
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
`followid`  int(11) NOT NULL AUTO_INCREMENT ,
`username`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`followername`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`followid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of follow
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `power`
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
`power`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '权限名字' ,
`changeuser`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '修改用户信息' ,
`deletedynamic`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除动态' ,
`deleteeassy`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除文章' ,
`deleteuser`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除用户' ,
PRIMARY KEY (`power`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of power
-- ----------------------------
BEGIN;
INSERT INTO `power` VALUES ('军阀', '1', '1', '1', '0'), ('平民', '0', '0', '0', '0'), ('总统', '1', '1', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`headres`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址' ,
`sex`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`resume`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名' ,
`email`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`password`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`tag`  varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'null' ,
`eassynum`  int(225) NULL DEFAULT 0 ,
`power`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`name`),
FOREIGN KEY (`power`) REFERENCES `power` (`power`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `power` (`power`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (null, '男', null, '123', '123', '123', 'null', '0', '平民'), (null, '男', null, '124', '124', '124', 'null', '0', '军阀'), ('http://oq88oj5l3.bkt.clouddn.com/Termwork/userheadcat1.jpg', '男', '123', 'heyuheng', '1051', 'hyh123', 'null', '0', '总统'), ('', '男', '', 'hyh11', 'hyh11', 'hyh11', '1', '0', '平民'), ('', '男', '', 'hyh2', 'hyh2', 'hyh2', '1', '0', '平民'), ('', '男', '', 'hyh4', 'hyh4', 'hyh4', '1', '0', '平民'), ('', '男', '', 'hyh7', 'hyh7', 'hyh7', '1', '0', '平民');
COMMIT;

-- ----------------------------
-- Auto increment value for `dynamic`
-- ----------------------------
ALTER TABLE `dynamic` AUTO_INCREMENT=25;

-- ----------------------------
-- Auto increment value for `dynamiccomment`
-- ----------------------------
ALTER TABLE `dynamiccomment` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `eassy`
-- ----------------------------
ALTER TABLE `eassy` AUTO_INCREMENT=29;

-- ----------------------------
-- Auto increment value for `eassycomment`
-- ----------------------------
ALTER TABLE `eassycomment` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `follow`
-- ----------------------------
ALTER TABLE `follow` AUTO_INCREMENT=1;
