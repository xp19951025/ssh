/*
Navicat MySQL Data Transfer

Source Server         : xiangping
Source Server Version : 50561
Source Host           : localhost:3306
Source Database       : xp

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2019-07-18 14:11:31
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
