/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : ssm2

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 12/10/2018 02:07:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'dfsdfsadf',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (1, 'java1班', '0', 0);
INSERT INTO `classes` VALUES (2, 'Java2班', '1', 0);
INSERT INTO `classes` VALUES (3, 'UI一班', '1', 0);
INSERT INTO `classes` VALUES (4, 'UI二班', '1', 0);
INSERT INTO `classes` VALUES (5, 'Java高级班', '0', 0);
INSERT INTO `classes` VALUES (6, '6', '1', 0);
INSERT INTO `classes` VALUES (12, 'llll', '0', NULL);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '模拟电路', '1');
INSERT INTO `course` VALUES (5, '线性代数', '0');
INSERT INTO `course` VALUES (7, 'Java', '1');
INSERT INTO `course` VALUES (8, 'c#', '1');
INSERT INTO `course` VALUES (9, 'java基础', '0');
INSERT INTO `course` VALUES (10, '毛泽东思想', '1');

-- ----------------------------
-- Table structure for ctc
-- ----------------------------
DROP TABLE IF EXISTS `ctc`;
CREATE TABLE `ctc`  (
  `couid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `claid` int(11) NOT NULL,
  PRIMARY KEY (`couid`, `tid`, `claid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  INDEX `claid`(`claid`) USING BTREE,
  INDEX `couid`(`couid`) USING BTREE,
  CONSTRAINT `claid` FOREIGN KEY (`claid`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `couid` FOREIGN KEY (`couid`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tid` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ctc
-- ----------------------------
INSERT INTO `ctc` VALUES (1, 1, 2);
INSERT INTO `ctc` VALUES (1, 1, 3);
INSERT INTO `ctc` VALUES (1, 1, 4);
INSERT INTO `ctc` VALUES (1, 1, 5);
INSERT INTO `ctc` VALUES (5, 1, 1);
INSERT INTO `ctc` VALUES (5, 1, 2);
INSERT INTO `ctc` VALUES (5, 1, 4);
INSERT INTO `ctc` VALUES (5, 1, 5);
INSERT INTO `ctc` VALUES (7, 1, 2);
INSERT INTO `ctc` VALUES (7, 1, 3);
INSERT INTO `ctc` VALUES (7, 1, 4);
INSERT INTO `ctc` VALUES (7, 1, 5);
INSERT INTO `ctc` VALUES (8, 1, 4);
INSERT INTO `ctc` VALUES (8, 1, 5);
INSERT INTO `ctc` VALUES (9, 1, 4);
INSERT INTO `ctc` VALUES (9, 1, 5);
INSERT INTO `ctc` VALUES (9, 1, 6);
INSERT INTO `ctc` VALUES (10, 1, 2);
INSERT INTO `ctc` VALUES (10, 1, 3);
INSERT INTO `ctc` VALUES (10, 1, 5);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT 0,
  `cid` int(11) DEFAULT 0,
  `tid` int(11) DEFAULT NULL,
  `pgrade` double DEFAULT NULL,
  `kgrade` double DEFAULT NULL,
  `zgrade` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid2`(`cid`) USING BTREE,
  INDEX `tid2`(`tid`) USING BTREE,
  INDEX `sid2`(`sid`) USING BTREE,
  CONSTRAINT `cid2` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sid2` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tid2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kss` int(11) NOT NULL,
  `ksrq` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (14, 1, '2018-10-12', 3, 58);
INSERT INTO `record` VALUES (15, 1, '2018-10-11', 3, 1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sykss` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'qqq', '15635354675', '男', 22, '342522199602081257', 93);
INSERT INTO `student` VALUES (21, '22', '222', '男', 11, '3', 12);
INSERT INTO `student` VALUES (38, 'wwww', '15635385193', '男', 12, '123', 21);
INSERT INTO `student` VALUES (50, 'laa', '18395589212', '男', 22, '342522199606046666', 22);
INSERT INTO `student` VALUES (51, 'wwww', '15635385193', '男', 12, '123', 5);
INSERT INTO `student` VALUES (53, 'wwww', '15635385193', '男', 12, '123', 43);
INSERT INTO `student` VALUES (55, 'aas', '18395546152', '男', 18, '342512199804145632', 15);
INSERT INTO `student` VALUES (56, 'cccc', '18395524563', '男', 16, '342861199506131458', 19);
INSERT INTO `student` VALUES (57, 'zzz', '18352467412', '男', 19, '342519199605241856', 31);
INSERT INTO `student` VALUES (58, 'QQQ', '18395589542', '女', 66, '342522198002145781', 87);
INSERT INTO `student` VALUES (59, 'cccc', '18395524563', '男', 16, '342861199506131458', 21);
INSERT INTO `student` VALUES (60, 'cccc', '18395524563', '男', 16, '342861199506131458', 21);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'aaaaaa',
  `usertype` int(11) NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '王老师', '18395584512', '男', 24, '342522199505145287', 'wls', '123', 2);
INSERT INTO `teacher` VALUES (3, '张三', '13856248597', '男', 30, '342521184505193452', 'zs', '123', 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `usertype` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', 1);
INSERT INTO `user` VALUES (2, 'zhaojing', 'aaa', 1);

SET FOREIGN_KEY_CHECKS = 1;
