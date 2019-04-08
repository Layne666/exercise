/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯云
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 118.25.128.234:3306
 Source Schema         : ssm2

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 31/03/2019 14:00:57
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
  `ksze` double(20, 2) NOT NULL DEFAULT 0.00,
  `ksrq` date NOT NULL,
  `tid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (58, 1, 160.00, '2019-01-02', 4, 70);
INSERT INTO `record` VALUES (59, 1, 180.00, '2019-01-02', 6, 63);
INSERT INTO `record` VALUES (64, 8, 1280.00, '2019-01-12', 5, 62);
INSERT INTO `record` VALUES (66, 5, 800.00, '2019-01-14', 4, 65);
INSERT INTO `record` VALUES (70, 1, 160.00, '2019-01-21', 6, 75);
INSERT INTO `record` VALUES (71, 3, 480.00, '2019-01-22', 5, 62);
INSERT INTO `record` VALUES (72, 1, 160.00, '2019-01-22', 6, 65);
INSERT INTO `record` VALUES (73, 2, 320.00, '2019-01-25', 4, 75);
INSERT INTO `record` VALUES (74, 1, 160.00, '2019-01-25', 4, 65);
INSERT INTO `record` VALUES (75, 1, 180.00, '2019-01-26', 6, 63);
INSERT INTO `record` VALUES (81, 160, 1.00, '2019-02-24', 6, 73);
INSERT INTO `record` VALUES (83, 1, 160.00, '2019-02-25', 6, 67);
INSERT INTO `record` VALUES (86, 1, 160.00, '2019-03-01', 9, 64);
INSERT INTO `record` VALUES (87, 1, 160.00, '2019-03-03', 6, 67);
INSERT INTO `record` VALUES (88, 1, 160.00, '2019-03-03', 9, 78);
INSERT INTO `record` VALUES (89, 1, 160.00, '2019-03-03', 9, 64);
INSERT INTO `record` VALUES (90, 1, 160.00, '2019-03-04', 9, 79);
INSERT INTO `record` VALUES (91, 1, 160.00, '2019-03-04', 6, 77);
INSERT INTO `record` VALUES (92, 1, 160.00, '2019-03-04', 9, 69);
INSERT INTO `record` VALUES (93, 1, 180.00, '2019-03-04', 9, 72);
INSERT INTO `record` VALUES (94, 1, 126.00, '2019-03-04', 8, 82);
INSERT INTO `record` VALUES (95, 1, 160.00, '2019-03-05', 9, 64);
INSERT INTO `record` VALUES (96, 1, 126.00, '2019-03-06', 8, 82);
INSERT INTO `record` VALUES (97, 1, 180.00, '2019-03-06', 8, 71);
INSERT INTO `record` VALUES (98, 1, 160.00, '2019-03-06', 9, 69);
INSERT INTO `record` VALUES (99, 5, 800.00, '2019-03-06', 4, 65);
INSERT INTO `record` VALUES (100, 5, 800.00, '2019-03-06', 4, 75);
INSERT INTO `record` VALUES (101, 1, 160.00, '2019-03-06', 6, 67);
INSERT INTO `record` VALUES (102, 1, 160.00, '2019-03-07', 9, 69);
INSERT INTO `record` VALUES (103, 1, 160.00, '2019-03-07', 5, 80);
INSERT INTO `record` VALUES (104, 1, 160.00, '2019-03-07', 9, 79);
INSERT INTO `record` VALUES (105, 1, 126.00, '2019-03-07', 8, 82);
INSERT INTO `record` VALUES (106, 1, 153.00, '2019-03-07', 5, 87);
INSERT INTO `record` VALUES (107, 1, 160.00, '2019-03-07', 9, 78);
INSERT INTO `record` VALUES (108, 1, 153.00, '2019-03-08', 6, 87);
INSERT INTO `record` VALUES (109, 1, 160.00, '2019-03-08', 6, 67);
INSERT INTO `record` VALUES (110, 1, 160.00, '2019-03-08', 5, 80);
INSERT INTO `record` VALUES (112, 1, 126.00, '2019-03-10', 5, 88);
INSERT INTO `record` VALUES (113, 2, 306.00, '2019-03-10', 5, 89);
INSERT INTO `record` VALUES (114, 1, 160.00, '2019-03-10', 9, 64);
INSERT INTO `record` VALUES (115, 1, 153.00, '2019-03-10', 6, 87);
INSERT INTO `record` VALUES (116, 1, 160.00, '2019-03-11', 9, 69);
INSERT INTO `record` VALUES (117, 1, 126.00, '2019-03-11', 8, 83);
INSERT INTO `record` VALUES (118, 1, 126.00, '2019-03-11', 8, 82);
INSERT INTO `record` VALUES (119, 1, 160.00, '2019-03-11', 6, 77);
INSERT INTO `record` VALUES (120, 1, 160.00, '2019-03-11', 6, 67);
INSERT INTO `record` VALUES (121, 1, 126.00, '2019-03-12', 8, 83);
INSERT INTO `record` VALUES (122, 1, 126.00, '2019-03-12', 8, 82);
INSERT INTO `record` VALUES (123, 1, 160.00, '2019-03-12', 9, 69);
INSERT INTO `record` VALUES (124, 1, 160.00, '2019-03-12', 9, 64);
INSERT INTO `record` VALUES (125, 1, 160.00, '2019-03-13', 8, 68);
INSERT INTO `record` VALUES (126, 1, 160.00, '2019-03-13', 9, 79);
INSERT INTO `record` VALUES (127, 1, 153.00, '2019-03-13', 5, 89);
INSERT INTO `record` VALUES (128, 1, 160.00, '2019-03-13', 5, 80);
INSERT INTO `record` VALUES (129, 1, 160.00, '2019-03-13', 9, 69);
INSERT INTO `record` VALUES (130, 1, 160.00, '2019-03-13', 5, 80);
INSERT INTO `record` VALUES (131, 1, 160.00, '2019-03-13', 5, 80);
INSERT INTO `record` VALUES (132, 1, 126.00, '2019-03-15', 8, 82);
INSERT INTO `record` VALUES (133, 1, 126.00, '2019-03-15', 8, 83);
INSERT INTO `record` VALUES (134, 1, 160.00, '2019-03-15', 8, 68);
INSERT INTO `record` VALUES (135, 1, 160.00, '2019-03-15', 9, 64);
INSERT INTO `record` VALUES (136, 1, 160.00, '2019-03-16', 5, 80);
INSERT INTO `record` VALUES (137, 1, 126.00, '2019-03-18', 8, 88);
INSERT INTO `record` VALUES (138, 2, 320.00, '2019-03-19', 9, 64);
INSERT INTO `record` VALUES (139, 1, 126.00, '2019-03-19', 8, 83);
INSERT INTO `record` VALUES (140, 2, 320.00, '2019-03-19', 4, 65);
INSERT INTO `record` VALUES (141, 2, 306.00, '2019-03-19', 4, 87);
INSERT INTO `record` VALUES (142, 1, 180.00, '2019-03-19', 4, 91);
INSERT INTO `record` VALUES (143, 1, 160.00, '2019-03-19', 6, 90);
INSERT INTO `record` VALUES (144, 1, 108.00, '2019-03-19', 9, 92);
INSERT INTO `record` VALUES (145, 1, 160.00, '2019-03-19', 5, 80);
INSERT INTO `record` VALUES (146, 1, 160.00, '2019-03-20', 8, 68);
INSERT INTO `record` VALUES (147, 1, 153.00, '2019-03-20', 5, 89);
INSERT INTO `record` VALUES (148, 1, 108.00, '2019-03-21', 9, 92);
INSERT INTO `record` VALUES (149, 1, 160.00, '2019-03-21', 6, 67);
INSERT INTO `record` VALUES (150, 1, 160.00, '2019-03-21', 6, 90);
INSERT INTO `record` VALUES (151, 1, 160.00, '2019-03-21', 6, 80);
INSERT INTO `record` VALUES (152, 1, 108.00, '2019-03-22', 9, 92);
INSERT INTO `record` VALUES (153, 2, 320.00, '2019-03-23', 5, 80);
INSERT INTO `record` VALUES (154, 1, 108.00, '2019-03-24', 9, 92);
INSERT INTO `record` VALUES (155, 1, 160.00, '2019-03-24', 9, 78);
INSERT INTO `record` VALUES (156, 1, 160.00, '2019-03-25', 8, 68);
INSERT INTO `record` VALUES (157, 1, 160.00, '2019-03-25', 8, 68);
INSERT INTO `record` VALUES (158, 1, 160.00, '2019-03-25', 8, 68);
INSERT INTO `record` VALUES (159, 2, 360.00, '2019-03-25', 4, 91);
INSERT INTO `record` VALUES (160, 1, 160.00, '2019-03-25', 4, 77);
INSERT INTO `record` VALUES (161, 1, 160.00, '2019-03-25', 4, 65);
INSERT INTO `record` VALUES (162, 1, 160.00, '2019-03-26', 9, 69);
INSERT INTO `record` VALUES (163, 1, 108.00, '2019-03-26', 9, 92);
INSERT INTO `record` VALUES (164, 1, 160.00, '2019-03-26', 9, 78);
INSERT INTO `record` VALUES (165, 1, 160.00, '2019-03-26', 6, 67);
INSERT INTO `record` VALUES (166, 1, 160.00, '2019-03-26', 6, 90);
INSERT INTO `record` VALUES (167, 1, 160.00, '2019-03-28', 9, 69);
INSERT INTO `record` VALUES (168, 1, 160.00, '2019-03-28', 6, 67);
INSERT INTO `record` VALUES (169, 1, 160.00, '2019-03-28', 6, 90);
INSERT INTO `record` VALUES (170, 1, 160.00, '2019-03-29', 9, 69);
INSERT INTO `record` VALUES (171, 1, 160.00, '2019-03-29', 9, 78);
INSERT INTO `record` VALUES (172, 1, 108.00, '2019-03-29', 9, 92);
INSERT INTO `record` VALUES (173, 1, 160.00, '2019-03-29', 5, 80);

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
  `sykss` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (62, '邰龙 100*160', '13888888888', '男', 40, 70);
INSERT INTO `student` VALUES (63, '扎木子 20*180拳击课', '13666666666', '女', 25, 16);
INSERT INTO `student` VALUES (65, '翟睿 30*160', '18605553200', '男', 40, 0);
INSERT INTO `student` VALUES (66, '吴静 20*160', '13705558303', '女', 36, 3);
INSERT INTO `student` VALUES (67, '廖子晴  18*160', '17888888888', '女', 35, 1);
INSERT INTO `student` VALUES (68, '杨云红50*160', '13339053522', '女', 40, 33);
INSERT INTO `student` VALUES (69, '迟梦雨 20*160+20*160', '13522052658', '女', 20, 11);
INSERT INTO `student` VALUES (70, '王存弟80*160', '17755553699', '女', 37, 79);
INSERT INTO `student` VALUES (71, '韦昕拉伸12*180', '18260080820', '男', 22, 8);
INSERT INTO `student` VALUES (72, '扎木子  30*180', '13666666666', '女', 25, 26);
INSERT INTO `student` VALUES (73, '薛雨菲  12*180', '13285557977', '女', 29, 9);
INSERT INTO `student` VALUES (74, '陈思洋  28*180', '18895563085', '女', 27, 26);
INSERT INTO `student` VALUES (75, '陈小雨 12*160', '17749490160', '女', 23, 3);
INSERT INTO `student` VALUES (77, '杨雪15*160', '17855591250', '女', 20, 12);
INSERT INTO `student` VALUES (78, '吕霞州20*160', '18712348234', '男', 23, 15);
INSERT INTO `student` VALUES (79, '候显安15*160', '13665555371', '男', 35, 12);
INSERT INTO `student` VALUES (80, '周浩36*160', '18862222298', '男', 45, 25);
INSERT INTO `student` VALUES (81, '翟睿38*126', '18260082820', '男', 40, 38);
INSERT INTO `student` VALUES (82, '王建琼38*126', '18260080820', '女', 38, 32);
INSERT INTO `student` VALUES (83, '王吉凤40*126', '18260080820', '女', 33, 36);
INSERT INTO `student` VALUES (84, '杨敏38*126', '15505552166', '女', 32, 38);
INSERT INTO `student` VALUES (85, '周娜38*126', '16605555996', '女', 36, 38);
INSERT INTO `student` VALUES (86, '许艳38*126', '13855505509', '女', 32, 38);
INSERT INTO `student` VALUES (87, '力心38*153', '18482310944', '女', 26, 33);
INSERT INTO `student` VALUES (88, '胡婷婷38*126', '18655552110', '女', 32, 36);
INSERT INTO `student` VALUES (89, '王倩38*153', '13285558989', '女', 24, 34);
INSERT INTO `student` VALUES (90, '廖俊勇15*160', '15655570676', '男', 29, 11);
INSERT INTO `student` VALUES (91, '刘娟40*180', '18855566552', '女', 26, 37);
INSERT INTO `student` VALUES (92, '韦昕100*108', '13865558687', '男', 40, 94);
INSERT INTO `student` VALUES (93, '范妮15*160', '15656505505', '女', 33, 15);
INSERT INTO `student` VALUES (94, '佀晓琦15*180', '17755525573', '女', 23, 15);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (4, '刘儒', '18395561571', '男', 24, '232331199502092715', '刘儒', '19950209', 2);
INSERT INTO `teacher` VALUES (5, '陈紫涵', '15395553111', '女', 25, '342622199408182402', '陈紫涵', '588520', 2);
INSERT INTO `teacher` VALUES (6, '成伟', '13285557977', '男', 29, '342626198907123299', '成伟', '008788', 2);
INSERT INTO `teacher` VALUES (7, '刘越泽', '15655510610', '女', 24, '230604199402183041', '刘越泽', '940218', 2);
INSERT INTO `teacher` VALUES (8, '杨烁', '18260080820', '女', 26, '340504199208200223', '杨烁', '820', 2);
INSERT INTO `teacher` VALUES (9, '陈发智', '15249887567', '男', 26, '340521199301080816', '陈发智', 'cfz243000', 2);

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
