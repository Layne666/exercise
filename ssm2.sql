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

 Date: 02/10/2018 10:26:42
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (7, 1, 1, 1, 23, 45, 68);
INSERT INTO `grade` VALUES (8, 1, 7, 1, 34, 54, 88);
INSERT INTO `grade` VALUES (9, 1, 10, 1, 33, 55, 88);

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `sid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`sid`, `cid`) USING BTREE,
  INDEX `cId1`(`cid`) USING BTREE,
  INDEX `tId1`(`tid`) USING BTREE,
  CONSTRAINT `cId1` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sId1` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tId1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (1, 1, 1);
INSERT INTO `sc` VALUES (1, 1, 7);
INSERT INTO `sc` VALUES (1, 1, 10);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `classid` int(30) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `s_c`(`classid`) USING BTREE,
  CONSTRAINT `classid` FOREIGN KEY (`classid`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'ahui', '15635354675', '男', 18, '123', 5);
INSERT INTO `student` VALUES (8, '赵璇', '123432133', '男', 18, '23', 1);
INSERT INTO `student` VALUES (9, '张宇航111', '11111', '男', 18, '23', 2);
INSERT INTO `student` VALUES (21, '22', '222', '男', 11, '3', 1);
INSERT INTO `student` VALUES (28, '22', '111', '男', 12, '123', 1);
INSERT INTO `student` VALUES (29, 'ee', '15635385193', '男', 12, '123', 1);
INSERT INTO `student` VALUES (38, 'wwww', '15635385193', '男', 12, '123', 1);
INSERT INTO `student` VALUES (41, '张小兰', '15525365434', '男', 13, '123', 2);
INSERT INTO `student` VALUES (43, 'ddd', 'dd', '男', 31, '123', 2);
INSERT INTO `student` VALUES (44, 'qq', '2222222222', '男', 13, '123', 4);
INSERT INTO `student` VALUES (45, 'ww', '1121', '男', 31, '123', 2);
INSERT INTO `student` VALUES (46, '22', '222', '男', 13, '213', 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `usertype` int(11) DEFAULT 3,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'aaaaaa',
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '王老师', 3, 'wls', '123', '12');
INSERT INTO `teacher` VALUES (2, '王老师师', 3, NULL, 'aaaaaa', '123');
INSERT INTO `teacher` VALUES (4, 'zhaojing', 3, 'zhaojing', 'aaaaaa', NULL);
INSERT INTO `teacher` VALUES (5, '利润率', 3, NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (6, 'wwww', 3, NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (10, '张小姐', 3, NULL, 'aaaaaa', NULL);
INSERT INTO `teacher` VALUES (11, '李晓玉111', 3, 'lixiaoyu', '1111', NULL);

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
