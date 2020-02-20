/*
Navicat MySQL Data Transfer

Source Server         : xiangping
Source Server Version : 50561
Source Host           : localhost:3306
Source Database       : xp

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2019-07-18 14:10:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for depat_info
-- ----------------------------
DROP TABLE IF EXISTS `depat_info`;
CREATE TABLE `depat_info` (
  `DEP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEP_NAME` varchar(50) NOT NULL,
  `DEP_DESC` varchar(255) NOT NULL,
  `DEP_STATE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DEP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depat_info
-- ----------------------------
INSERT INTO `depat_info` VALUES ('1', '技术部', '技术', '0');
INSERT INTO `depat_info` VALUES ('2', '研发部', '研发产品', '0');
INSERT INTO `depat_info` VALUES ('3', '工程部', '维修', '0');
INSERT INTO `depat_info` VALUES ('4', '开发部', '开发工具', '0');
INSERT INTO `depat_info` VALUES ('5', '综合部', '服务人民', '0');
INSERT INTO `depat_info` VALUES ('6', '测试工程部', '测试软件', '0');
INSERT INTO `depat_info` VALUES ('7', '摄影部', '拍照', '0');
INSERT INTO `depat_info` VALUES ('8', '消防部', '消防灭火', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(255) NOT NULL,
  `USER_SEX` varchar(6) NOT NULL,
  `USER_STATE` int(11) NOT NULL DEFAULT '0',
  `DEP_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `DEP_ID` (`DEP_ID`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`DEP_ID`) REFERENCES `depat_info` (`DEP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '小黄', '女', '1', '5');
INSERT INTO `user_info` VALUES ('2', '杨玉环', '女', '1', '6');
INSERT INTO `user_info` VALUES ('3', '王军', '男', '0', '3');
INSERT INTO `user_info` VALUES ('4', '李彤', '女', '1', '3');
INSERT INTO `user_info` VALUES ('5', '王永军', '男', '1', '4');
INSERT INTO `user_info` VALUES ('6', '刘小静', '女', '0', '6');
INSERT INTO `user_info` VALUES ('7', '李伟', '男', '1', '5');
INSERT INTO `user_info` VALUES ('8', '刘辉', '男', '0', '4');
INSERT INTO `user_info` VALUES ('9', '刘静', '女', '1', '6');
INSERT INTO `user_info` VALUES ('10', '路一行', '男', '0', '3');
INSERT INTO `user_info` VALUES ('11', '张三梵', '男', '1', '2');
INSERT INTO `user_info` VALUES ('12', '陆凌峰', '男', '0', '2');
INSERT INTO `user_info` VALUES ('16', '鹿鸣苑', '男', '0', '4');
INSERT INTO `user_info` VALUES ('17', '路明非', '男', '1', '2');
INSERT INTO `user_info` VALUES ('18', '楚子航', '男', '0', '6');
INSERT INTO `user_info` VALUES ('19', '苏溪', '女', '0', '5');
INSERT INTO `user_info` VALUES ('20', '凯撒', '男', '1', '3');
INSERT INTO `user_info` VALUES ('21', '老唐', '男', '0', '4');
INSERT INTO `user_info` VALUES ('22', '小范', '男', '1', '6');
INSERT INTO `user_info` VALUES ('23', '施耐德', '男', '0', '1');
INSERT INTO `user_info` VALUES ('24', '小张', '男', '0', '1');
INSERT INTO `user_info` VALUES ('25', '小明', '男', '0', '4');
INSERT INTO `user_info` VALUES ('26', '孙悟空', '男', '1', '2');
INSERT INTO `user_info` VALUES ('27', '九月', '女', '0', '5');
INSERT INTO `user_info` VALUES ('28', '唐三', '男', '1', '4');
INSERT INTO `user_info` VALUES ('29', '小舞', '女', '1', '6');
INSERT INTO `user_info` VALUES ('30', '红孩儿', '男', '0', '1');
INSERT INTO `user_info` VALUES ('31', '刑天', '男', '0', '1');
INSERT INTO `user_info` VALUES ('32', '鳌拜', '男', '1', '3');
INSERT INTO `user_info` VALUES ('33', '女娲', '女', '0', '6');
INSERT INTO `user_info` VALUES ('34', '贞子', '女', '0', '4');
INSERT INTO `user_info` VALUES ('35', '甑子丹', '男', '1', '1');
INSERT INTO `user_info` VALUES ('36', '姚明', '男', '0', '3');
INSERT INTO `user_info` VALUES ('37', '王麻子', '男', '1', '3');
INSERT INTO `user_info` VALUES ('38', '张麻子', '男', '0', '3');
INSERT INTO `user_info` VALUES ('39', '刘红', '女', '0', '4');
INSERT INTO `user_info` VALUES ('40', '小冷', '女', '1', '3');
INSERT INTO `user_info` VALUES ('41', '啸天', '男', '0', '3');
INSERT INTO `user_info` VALUES ('42', '小谭', '男', '0', '4');
INSERT INTO `user_info` VALUES ('43', '小甜甜', '女', '0', '2');
INSERT INTO `user_info` VALUES ('44', '黑寡妇', '女', '1', '6');
INSERT INTO `user_info` VALUES ('45', '哪吒', '男', '0', '2');
INSERT INTO `user_info` VALUES ('46', '精卫', '女', '0', '3');
INSERT INTO `user_info` VALUES ('47', '小土豆', '男', '1', '1');
INSERT INTO `user_info` VALUES ('48', '二郎神', '男', '0', '2');
INSERT INTO `user_info` VALUES ('49', '敖烈', '男', '0', '2');
INSERT INTO `user_info` VALUES ('50', '小玉', '女', '0', '5');
INSERT INTO `user_info` VALUES ('51', '小鱼', '女', '0', '3');
INSERT INTO `user_info` VALUES ('52', '龙女', '女', '1', '6');
INSERT INTO `user_info` VALUES ('53', '陈墨瞳', '女', '0', '5');
INSERT INTO `user_info` VALUES ('54', '伊莎贝尔	', '女', '0', '6');
INSERT INTO `user_info` VALUES ('55', '诺玛', '女', '1', '4');
INSERT INTO `user_info` VALUES ('56', '路鸣泽', '男', '0', '2');
INSERT INTO `user_info` VALUES ('57', '酒德麻衣', '女', '1', '5');
INSERT INTO `user_info` VALUES ('58', '上杉绘梨衣', '女', '0', '6');
INSERT INTO `user_info` VALUES ('59', '诺顿', '男', '0', '3');
INSERT INTO `user_info` VALUES ('60', '康斯坦丁', '男', '1', '3');
INSERT INTO `user_info` VALUES ('61', '耶梦加得', '女', '0', '2');
INSERT INTO `user_info` VALUES ('62', '奥丁', '男', '0', '3');
INSERT INTO `user_info` VALUES ('63', '赫尔佐格', '男', '1', '3');
INSERT INTO `user_info` VALUES ('64', '源稚生', '男', '0', '1');
INSERT INTO `user_info` VALUES ('65', '周元', '男', '1', '1');
INSERT INTO `user_info` VALUES ('66', '小妖', '女', '0', '5');
INSERT INTO `user_info` VALUES ('67', '小小于', '女', '1', '1');
INSERT INTO `user_info` VALUES ('68', '杨玉', '女', '0', '5');
INSERT INTO `user_info` VALUES ('69', '小美', '女', '0', '5');
INSERT INTO `user_info` VALUES ('70', '明飞', '男', '0', '1');
INSERT INTO `user_info` VALUES ('71', '小花', '女', '1', '5');
INSERT INTO `user_info` VALUES ('72', '小杨', '女', '0', '3');
