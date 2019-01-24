/*
Navicat MySQL Data Transfer

Source Server         : project
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : project_db

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-01-24 09:24:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(32) NOT NULL,
  `tid` int(10) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `tid` (`tid`),
  CONSTRAINT `t_course_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `t_teacher` (`tid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------

-- ----------------------------
-- Table structure for `t_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group
-- ----------------------------
INSERT INTO `t_group` VALUES ('1', '管理员');
INSERT INTO `t_group` VALUES ('2', '上级');
INSERT INTO `t_group` VALUES ('3', '教师');
INSERT INTO `t_group` VALUES ('4', '学生');

-- ----------------------------
-- Table structure for `t_power`
-- ----------------------------
DROP TABLE IF EXISTS `t_power`;
CREATE TABLE `t_power` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `power_name` varchar(32) NOT NULL,
  `gid` int(10) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `gid` (`gid`) USING BTREE,
  CONSTRAINT `t_power_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `t_group` (`gid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_power
-- ----------------------------
INSERT INTO `t_power` VALUES ('1', '添加任意用户', '1');
INSERT INTO `t_power` VALUES ('2', '查询所有用户信息', '1');
INSERT INTO `t_power` VALUES ('3', '修改所有用户信息', '1');
INSERT INTO `t_power` VALUES ('4', '删除任意用户', '1');
INSERT INTO `t_power` VALUES ('5', '添加任意课程', '1');
INSERT INTO `t_power` VALUES ('6', '查询所有课程信息', '1');
INSERT INTO `t_power` VALUES ('7', '修改所有课程信息', '1');
INSERT INTO `t_power` VALUES ('8', '删除任意课程', '1');
INSERT INTO `t_power` VALUES ('9', '添加用户权限', '1');
INSERT INTO `t_power` VALUES ('10', '查询用户权限', '1');
INSERT INTO `t_power` VALUES ('11', '修改用户权限', '1');
INSERT INTO `t_power` VALUES ('12', '删除用户权限', '1');
INSERT INTO `t_power` VALUES ('13', '添加教师用户', '2');
INSERT INTO `t_power` VALUES ('14', '查询教师用户信息', '2');
INSERT INTO `t_power` VALUES ('15', '修改教师用户信息', '2');
INSERT INTO `t_power` VALUES ('16', '删除教师用户', '2');
INSERT INTO `t_power` VALUES ('17', '添加课程', '2');
INSERT INTO `t_power` VALUES ('18', '查询课程信息', '2');
INSERT INTO `t_power` VALUES ('19', '修改课程信息', '2');
INSERT INTO `t_power` VALUES ('20', '删除课程', '2');
INSERT INTO `t_power` VALUES ('21', '查询教师个人信息', '3');
INSERT INTO `t_power` VALUES ('22', '修改教师个人信息', '3');
INSERT INTO `t_power` VALUES ('23', '添加课程成绩', '2');
INSERT INTO `t_power` VALUES ('24', '查询课程成绩', '2');
INSERT INTO `t_power` VALUES ('25', '修改课程成绩', '2');
INSERT INTO `t_power` VALUES ('26', '删除课程成绩', '2');
INSERT INTO `t_power` VALUES ('27', '添加任课课程成绩', '3');
INSERT INTO `t_power` VALUES ('28', '查询任课课程所有成绩', '3');
INSERT INTO `t_power` VALUES ('29', '修改任课课程所有成绩', '3');
INSERT INTO `t_power` VALUES ('30', '添加学生用户', '2');
INSERT INTO `t_power` VALUES ('31', '查询学生用户信息', '2');
INSERT INTO `t_power` VALUES ('32', '修改学生用户信息', '2');
INSERT INTO `t_power` VALUES ('33', '删除学生用户', '2');
INSERT INTO `t_power` VALUES ('34', '查询学生用户信息', '3');
INSERT INTO `t_power` VALUES ('35', '修改学生用户信息', '3');
INSERT INTO `t_power` VALUES ('36', '查询学生用户个人信息', '4');
INSERT INTO `t_power` VALUES ('37', '修改学生用户个人信息', '4');
INSERT INTO `t_power` VALUES ('38', '查询课程个人成绩', '4');

-- ----------------------------
-- Table structure for `t_score`
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL,
  `sid` int(32) NOT NULL,
  `score` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_score_1` (`cid`),
  KEY `fk_score_2` (`sid`),
  CONSTRAINT `fk_score_1` FOREIGN KEY (`cid`) REFERENCES `t_course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_score_2` FOREIGN KEY (`sid`) REFERENCES `t_student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `sid` int(32) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(10) NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `tid` int(10) DEFAULT NULL,
  `s_phone` bigint(11) NOT NULL,
  `s_username` varchar(32) NOT NULL,
  `s_password` varchar(32) NOT NULL,
  `gid` int(10) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_student_1` (`tid`),
  KEY `fk_student_2` (`gid`),
  CONSTRAINT `fk_student_1` FOREIGN KEY (`tid`) REFERENCES `t_teacher` (`tid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_student_2` FOREIGN KEY (`gid`) REFERENCES `t_group` (`gid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=200002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('200001', '江借时', '男', '1926-08-16', '10001', '13826462534', 'jiang92', '123456,,192608,123456,123456', '4');

-- ----------------------------
-- Table structure for `t_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(10) NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `t_phone` bigint(11) NOT NULL,
  `t_username` varchar(32) NOT NULL,
  `t_password` varchar(32) NOT NULL,
  `gid` int(10) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `gid` (`gid`),
  CONSTRAINT `t_teacher_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `t_group` (`gid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('1', '管理员', '男', '2019-01-18', '123456', 'admin', 'admin', '1');
INSERT INTO `t_teacher` VALUES ('10001', '张三', '女', '1962-08-22', '13245284732', 'zhangsan', '123456', '2');
