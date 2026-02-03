/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80408
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 80408
 File Encoding         : 65001

 Date: 03/02/2026 18:24:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `action_id` int NOT NULL AUTO_INCREMENT COMMENT '前端页面操作表主键id',
  `action_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '前端操作的名字',
  `action_description` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '页面操作的描述',
  `default_check` tinyint(1) NOT NULL DEFAULT 0 COMMENT '当前操作是否需要校验,true为1,0为false',
  PRIMARY KEY (`action_id`) USING BTREE,
  UNIQUE INDEX `action_name`(`action_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '前端操作比如增删改查等的权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES (1, 'add', '新增', 0);
INSERT INTO `action` VALUES (2, 'query', '查询', 0);
INSERT INTO `action` VALUES (3, 'get', '详情', 0);
INSERT INTO `action` VALUES (4, 'update', '修改', 0);
INSERT INTO `action` VALUES (5, 'delete', '删除', 0);
INSERT INTO `action` VALUES (6, 'import', '导入', 0);
INSERT INTO `action` VALUES (7, 'export', '导出', 0);

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `exam_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '考试表的主键',
  `exam_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '考试名称',
  `exam_avatar` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '考试的预览图',
  `grade_volume_id` int NULL DEFAULT NULL COMMENT '考试属于哪个年段的上下册',
  `exam_description` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '考试描述',
  `exam_question_ids` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '当前考试下的题目的id用-连在一起地字符串',
  `exam_question_ids_radio` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '当前考试下的题目单选题的id用-连在一起地字符串',
  `exam_question_ids_check` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '当前考试下的题目多选题的id用-连在一起地字符串',
  `exam_question_ids_judge` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '当前考试下的题目判断题的id用-连在一起地字符串',
  `exam_score` int NOT NULL DEFAULT 0 COMMENT '当前考试的总分数',
  `exam_score_radio` int NOT NULL DEFAULT 0 COMMENT '当前考试每个单选题的分数',
  `exam_score_check` int NULL DEFAULT 0 COMMENT '当前考试每个多选题的分数',
  `exam_score_judge` int NOT NULL DEFAULT 0 COMMENT '当前考试每个判断题的分数',
  `exam_creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '考试创建者的用户id',
  `exam_time_limit` int NOT NULL DEFAULT 0 COMMENT '考试的时间限制，单位为分钟',
  `exam_start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '考试有效期开始时间',
  `exam_end_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '考试有效期结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `exam_type_id` int NULL DEFAULT NULL COMMENT '该考试状态主键',
  `exam_question_category_id` int NULL DEFAULT NULL COMMENT '该考试所属学科',
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '考试的详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('1b973a05369a4cc99045b3c537447d9b', '2025年测试', '<p><br></p>', 8, '22', '9f9cd4e079f946c5bc6e33d68620295f-', '9f9cd4e079f946c5bc6e33d68620295f', NULL, '', 5, 5, NULL, 5, '3', 20, '2026-02-03 15:53:56', '2026-02-03 15:53:56', '2026-02-03 15:53:56', '2026-02-03 16:59:06', 1, 1);
INSERT INTO `exam` VALUES ('40fb07a302c04154bb564f9591bb5594', '2025年测试', '<p><br></p>', 8, '25', '9f9cd4e079f946c5bc6e33d68620295f-144bf174dbff40e4910918e8a0297339', '9f9cd4e079f946c5bc6e33d68620295f', NULL, '144bf174dbff40e4910918e8a0297339', 10, 5, NULL, 5, '3', 90, '2026-02-03 15:58:31', '2026-02-03 15:58:31', '2026-02-03 15:58:31', '2026-02-03 16:54:37', 2, 1);
INSERT INTO `exam` VALUES ('4af7ae9fa2874a0d9ae6acbe9f0ff30d', '2025年测试', '<p><br></p>', 8, '25', '9f9cd4e079f946c5bc6e33d68620295f-', '9f9cd4e079f946c5bc6e33d68620295f', NULL, '', 5, 5, NULL, 5, '3', 90, '2026-02-03 15:58:20', '2026-02-03 15:58:20', '2026-02-03 15:58:20', '2026-02-03 15:58:20', 1, 1);
INSERT INTO `exam` VALUES ('d805dad6b52140c1ba320cc09bf289ad', '2025年测试', '<p><br></p>', 7, '瑞特', '5a211e43b0fc4f7eb041f1c6880e466e-', '5a211e43b0fc4f7eb041f1c6880e466e', NULL, '', 5, 5, NULL, 5, '3', 90, '2026-02-03 15:44:16', '2026-02-03 15:44:16', '2026-02-03 15:44:16', '2026-02-03 15:51:56', 1, 1);

-- ----------------------------
-- Table structure for exam_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_record`;
CREATE TABLE `exam_record`  (
  `exam_record_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '考试记录表的主键',
  `exam_joiner_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '考试参与者的用户id',
  `exam_join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '参加考试的时间',
  `exam_time_cost` int NULL DEFAULT 0 COMMENT '完成考试所用的时间,单位分钟',
  `exam_join_score` int NOT NULL DEFAULT 0 COMMENT '参与考试的实际得分',
  `exam_result_level` int NULL DEFAULT 0 COMMENT '考试结果的等级',
  `answer_option_ids` varchar(4096) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `exam_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`exam_record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '考试记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_record
-- ----------------------------
INSERT INTO `exam_record` VALUES ('0b20d190a7394c1287589065b1b280f8', '4', '2026-02-03 17:00:15', NULL, 0, NULL, '144bf174dbff40e4910918e8a0297339@False_0c84782421104993b6ed86aed8f0657f$9f9cd4e079f946c5bc6e33d68620295f@False_72c1b9ca9f8d43b5bbab1f5206b984e5', '40fb07a302c04154bb564f9591bb5594');
INSERT INTO `exam_record` VALUES ('3c842cd046f14bfc9a03e915420a176c', '3', '2026-02-03 16:54:54', NULL, 0, NULL, '144bf174dbff40e4910918e8a0297339@False_0c84782421104993b6ed86aed8f0657f$9f9cd4e079f946c5bc6e33d68620295f@False_72c1b9ca9f8d43b5bbab1f5206b984e5', '40fb07a302c04154bb564f9591bb5594');

-- ----------------------------
-- Table structure for exam_record_level
-- ----------------------------
DROP TABLE IF EXISTS `exam_record_level`;
CREATE TABLE `exam_record_level`  (
  `exam_record_level_id` int NOT NULL AUTO_INCREMENT COMMENT '考试结果等级表的主键',
  `exam_record_level_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '考试结果等级的名称',
  `exam_record_level_description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '考试结果等级的详细阐述',
  PRIMARY KEY (`exam_record_level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '考试结果的等级' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_record_level
-- ----------------------------
INSERT INTO `exam_record_level` VALUES (1, 'excellent', '优秀');
INSERT INTO `exam_record_level` VALUES (2, 'good', '良好');
INSERT INTO `exam_record_level` VALUES (3, 'normal', '一般');
INSERT INTO `exam_record_level` VALUES (4, 'pass', '及格');
INSERT INTO `exam_record_level` VALUES (5, 'fail', '不及格');

-- ----------------------------
-- Table structure for exam_type
-- ----------------------------
DROP TABLE IF EXISTS `exam_type`;
CREATE TABLE `exam_type`  (
  `exam_type_id` int NOT NULL AUTO_INCREMENT COMMENT '试卷类型表的主键',
  `exam_type_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '试卷类型名称',
  `exam_type_description` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '试卷类型的描述',
  PRIMARY KEY (`exam_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '问题类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_type
-- ----------------------------
INSERT INTO `exam_type` VALUES (1, '停用', NULL);
INSERT INTO `exam_type` VALUES (2, '已发布', NULL);

-- ----------------------------
-- Table structure for grade_level
-- ----------------------------
DROP TABLE IF EXISTS `grade_level`;
CREATE TABLE `grade_level`  (
  `grade_level_id` int NOT NULL AUTO_INCREMENT COMMENT '年段的主键',
  `grade_level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '年段的名字',
  `grade_level_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '年段的描述',
  PRIMARY KEY (`grade_level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade_level
-- ----------------------------
INSERT INTO `grade_level` VALUES (1, 'grade1', '一年级');
INSERT INTO `grade_level` VALUES (2, 'grade2', '二年级');
INSERT INTO `grade_level` VALUES (3, 'grade3', '三年级');
INSERT INTO `grade_level` VALUES (4, 'grade4', '四年级');
INSERT INTO `grade_level` VALUES (5, 'grade5', '五年级');
INSERT INTO `grade_level` VALUES (6, 'grade6', '六年级');

-- ----------------------------
-- Table structure for grade_volume
-- ----------------------------
DROP TABLE IF EXISTS `grade_volume`;
CREATE TABLE `grade_volume`  (
  `grade_volume_id` int NOT NULL AUTO_INCREMENT COMMENT '题目属于上下册的主键',
  `grade_volume_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '题目上下册名称',
  `grade_volume_description` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '题目上下册的描述',
  `grade_level_id` int NULL DEFAULT NULL COMMENT '所属年段ID',
  PRIMARY KEY (`grade_volume_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '问题的上下册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grade_volume
-- ----------------------------
INSERT INTO `grade_volume` VALUES (1, '一年级上册', NULL, 1);
INSERT INTO `grade_volume` VALUES (2, '一年级下册', NULL, 1);
INSERT INTO `grade_volume` VALUES (3, '二年级上册', NULL, 2);
INSERT INTO `grade_volume` VALUES (4, '二年级下册', NULL, 2);
INSERT INTO `grade_volume` VALUES (5, '三年级上册', NULL, 3);
INSERT INTO `grade_volume` VALUES (6, '三年级下册', NULL, 3);
INSERT INTO `grade_volume` VALUES (7, '四年级上册', NULL, 4);
INSERT INTO `grade_volume` VALUES (8, '四年级下册', NULL, 4);
INSERT INTO `grade_volume` VALUES (9, '五年级上册', NULL, 5);
INSERT INTO `grade_volume` VALUES (10, '五年级下册', NULL, 5);
INSERT INTO `grade_volume` VALUES (11, '六年级上册', NULL, 6);
INSERT INTO `grade_volume` VALUES (12, '六年级下册', NULL, 6);

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint NULL DEFAULT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `page_id` int NOT NULL AUTO_INCREMENT COMMENT '前端页面表主键id',
  `page_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '页面的名称,要唯一',
  `page_description` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '页面的功能性描述',
  `action_ids` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '页面对应的操作权限列表，用-连接action的id',
  PRIMARY KEY (`page_id`) USING BTREE,
  UNIQUE INDEX `page_name`(`page_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '前端页面表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES (1, 'dashboard', '仪表盘', '1-2-3-4-5');
INSERT INTO `page` VALUES (2, 'exam-card', '考试列表', '1-6-3-4');
INSERT INTO `page` VALUES (3, 'exam-record-list', '考试记录', '1-6-3-4');
INSERT INTO `page` VALUES (4, 'question-admin', '问题管理', '1-6-3-4');
INSERT INTO `page` VALUES (5, 'exam-table-list', '考试管理', '1-6-3-4');
INSERT INTO `page` VALUES (6, 'user', '个人页', '1-6-3-4-5-7');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '题目的主键',
  `question_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '题目的名字',
  `question_score` int NOT NULL DEFAULT 0 COMMENT '题目的分数',
  `question_creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '题目创建者的用户id',
  `grade_volume_id` int NULL DEFAULT NULL COMMENT '题目属于哪个年段的上下册',
  `question_level_id` int NOT NULL DEFAULT 0 COMMENT '题目难易度级别',
  `question_type_id` int NOT NULL DEFAULT 0 COMMENT '题目的类型，比如单选、多选、判断等',
  `question_category_id` int NOT NULL DEFAULT 0 COMMENT '题目的类型，比如数学、英语、政治等',
  `question_description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '题目额外的描述',
  `question_option_ids` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '题目的选项，用选项的id用-连在一起表示答案',
  `question_answer_option_ids` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '题目的答案，用选项的id用-连在一起表示答案',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '考试题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('144bf174dbff40e4910918e8a0297339', '计算机计算1+1等于2对吗', 5, '3', 8, 2, 3, 1, '<p><br></p>', '2b0d54493b724750bc1d8ff3c8200619-0c84782421104993b6ed86aed8f0657f', '2b0d54493b724750bc1d8ff3c8200619', '2026-02-03 16:54:24', '2026-02-03 16:54:24');
INSERT INTO `question` VALUES ('3ed7d961b7d14e0cbc3029219b28fde3', '<p>废旧的手机可以随便丢弃</p>', 5, '3', 7, 3, 3, 1, '<p><br></p>', '03a903a719154ef1ab8c56b6019fe258-f2292e28512a4e9984f42eb24af81f95', 'f2292e28512a4e9984f42eb24af81f95', '2026-02-03 15:40:22', '2026-02-03 15:40:22');
INSERT INTO `question` VALUES ('5860b9ec9b0f4d8fb04bd1732b576832', '<p>生活中可以随便扫描街头的二维码</p>', 5, '3', 7, 3, 3, 1, '<p><br></p>', '4124e29b9748442f9d1c68fbad14e01d-6207787a2fc641e79fa26c0bf10be369', '6207787a2fc641e79fa26c0bf10be369', '2026-02-03 15:39:46', '2026-02-03 15:39:46');
INSERT INTO `question` VALUES ('59e1aab1712148c9ae0095f421c01309', '<p>学校有2位信息老师吗</p>', 5, '3', 8, 3, 3, 1, '<p><br></p>', '65f7f623cc514db9864af72cd1123520-7c2b959c8bd141caa6b98a1771a13a18', '65f7f623cc514db9864af72cd1123520', '2026-02-03 15:59:56', '2026-02-03 15:59:56');
INSERT INTO `question` VALUES ('5a211e43b0fc4f7eb041f1c6880e466e', '<p>下列是计算机硬件的选项是</p>', 5, '3', 7, 3, 1, 1, '<p><br></p>', '1f453edfc7274804b5d534e45e51ab42-2ab8ccc3bc144d7ba521541f013cbfc2-939b0c5409154db288b60330423cde53', '1f453edfc7274804b5d534e45e51ab42', '2026-02-03 15:41:16', '2026-02-03 15:41:16');
INSERT INTO `question` VALUES ('9f9cd4e079f946c5bc6e33d68620295f', '<p>下列是算法流程图图示的为</p>', 5, '3', 8, 1, 1, 1, '<p><br></p>', '72c1b9ca9f8d43b5bbab1f5206b984e5', '', '2026-02-03 15:42:32', '2026-02-03 15:42:32');
INSERT INTO `question` VALUES ('f265a8e6688c4df8bd11629c4c89a732', '<p>计算机的1+1</p>', 5, '3', 8, 1, 1, 1, '<p><br></p>', 'b595bbcfe75e4c379048e3c5d974c804-6d57d11c75c8476084bbbf6659f09342', 'b595bbcfe75e4c379048e3c5d974c804', '2026-02-03 16:48:51', '2026-02-03 16:48:51');

-- ----------------------------
-- Table structure for question_category
-- ----------------------------
DROP TABLE IF EXISTS `question_category`;
CREATE TABLE `question_category`  (
  `question_category_id` int NOT NULL AUTO_INCREMENT COMMENT '问题类别表的主键',
  `question_category_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '问题类别名称',
  `question_category_description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '问题类别的描述',
  PRIMARY KEY (`question_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '题目类别表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question_category
-- ----------------------------
INSERT INTO `question_category` VALUES (1, '信息科技', '信息时代的眼泪');
INSERT INTO `question_category` VALUES (2, '音乐', '陶冶情操');
INSERT INTO `question_category` VALUES (3, '体育', '参加奥运会');
INSERT INTO `question_category` VALUES (4, '美术', '绘出大好山河');

-- ----------------------------
-- Table structure for question_level
-- ----------------------------
DROP TABLE IF EXISTS `question_level`;
CREATE TABLE `question_level`  (
  `question_level_id` int NOT NULL AUTO_INCREMENT COMMENT '题目难易度的主键',
  `question_level_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '题目难易度名称',
  `question_level_description` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '题目难易度的描述',
  PRIMARY KEY (`question_level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '问题的难易度级别' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question_level
-- ----------------------------
INSERT INTO `question_level` VALUES (1, 'high', '难');
INSERT INTO `question_level` VALUES (2, 'middle', '中');
INSERT INTO `question_level` VALUES (3, 'low', '易');

-- ----------------------------
-- Table structure for question_option
-- ----------------------------
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option`  (
  `question_option_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '题目选项表的主键',
  `question_option_content` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '选项的内容',
  `question_option_description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '选项的额外描述，可以用于题目答案解析',
  PRIMARY KEY (`question_option_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '题目的选项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question_option
-- ----------------------------
INSERT INTO `question_option` VALUES ('03a903a719154ef1ab8c56b6019fe258', '正确', NULL);
INSERT INTO `question_option` VALUES ('0c84782421104993b6ed86aed8f0657f', '错误', NULL);
INSERT INTO `question_option` VALUES ('1f453edfc7274804b5d534e45e51ab42', '键盘', NULL);
INSERT INTO `question_option` VALUES ('2ab8ccc3bc144d7ba521541f013cbfc2', '系统', NULL);
INSERT INTO `question_option` VALUES ('2b0d54493b724750bc1d8ff3c8200619', '正确', NULL);
INSERT INTO `question_option` VALUES ('4124e29b9748442f9d1c68fbad14e01d', '正确', NULL);
INSERT INTO `question_option` VALUES ('6207787a2fc641e79fa26c0bf10be369', '错误', NULL);
INSERT INTO `question_option` VALUES ('65f7f623cc514db9864af72cd1123520', '正确', NULL);
INSERT INTO `question_option` VALUES ('6d57d11c75c8476084bbbf6659f09342', '3', NULL);
INSERT INTO `question_option` VALUES ('72c1b9ca9f8d43b5bbab1f5206b984e5', '流程线', NULL);
INSERT INTO `question_option` VALUES ('7c2b959c8bd141caa6b98a1771a13a18', '错误', NULL);
INSERT INTO `question_option` VALUES ('939b0c5409154db288b60330423cde53', 'wps', NULL);
INSERT INTO `question_option` VALUES ('b595bbcfe75e4c379048e3c5d974c804', '2', NULL);
INSERT INTO `question_option` VALUES ('f2292e28512a4e9984f42eb24af81f95', '错误', NULL);

-- ----------------------------
-- Table structure for question_type
-- ----------------------------
DROP TABLE IF EXISTS `question_type`;
CREATE TABLE `question_type`  (
  `question_type_id` int NOT NULL AUTO_INCREMENT COMMENT '题目类型表的主键',
  `question_type_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '题目类型名称',
  `question_type_description` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '题目类型的描述',
  PRIMARY KEY (`question_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '问题类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question_type
-- ----------------------------
INSERT INTO `question_type` VALUES (1, 'single', '单选题');
INSERT INTO `question_type` VALUES (3, 'judge', '判断题');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色表主键id',
  `role_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '角色名称',
  `role_description` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '角色的描述',
  `role_detail` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '角色的详细功能阐述',
  `role_page_ids` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '当前角色所能访问的页面的id集合',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '管理员', '拥有教师和学生的所有权限', '1-2-3-4-5-6');
INSERT INTO `role` VALUES (2, 'teacher', '教师', '出题、组试卷、管理学生和试卷', '1-2-3-4-5-6');
INSERT INTO `role` VALUES (3, 'student', '学生', '参与考试，查看分数', '1-2-6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id,主键',
  `user_username` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `user_nickname` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户昵称',
  `user_password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户密码',
  `user_role_id` int NOT NULL COMMENT '当前用户的角色的id',
  `user_grade_level_id` int NULL DEFAULT NULL COMMENT '当前用户的年段的id',
  `user_class_id` int NULL DEFAULT NULL COMMENT '当前用户的班级id',
  `user_num` int NULL DEFAULT NULL COMMENT '当前用户的学号',
  `user_avatar` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户的头像地址',
  `user_description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户的自我描述',
  `user_email` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户邮箱',
  `user_phone` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户手机号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_username`(`user_username`) USING BTREE,
  UNIQUE INDEX `user_email`(`user_email`) USING BTREE,
  UNIQUE INDEX `user_phone`(`user_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'teacher', '暮雪飞扬', 'abc123', 2, 0, 2, NULL, 'https://i.loli.net/2019/11/02/OUfHKhMSwRv1ntX.jpg', '快乐就好', '1648266192@qq.com', '15261897332', '2026-02-03 08:28:04', '2026-02-03 08:28:04');
INSERT INTO `user` VALUES (2, 'student', '红领巾', 'abc123', 3, 5, 12, 1, 'https://i.loli.net/2019/11/02/rCHKVJd4jTovzW9.jpg', '好好学习，天天向上', 'liangshanguang@huawei.com', '17712345678', '2026-02-03 11:09:50', '2026-02-03 11:09:50');
INSERT INTO `user` VALUES (3, 'admin', '超级管理员', 'abc123', 1, 0, 99, NULL, 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', '绳锯木断，水滴石穿', 'liangshanguang2@gmail.com', '17601324488', '2026-02-03 09:05:41', '2026-02-03 09:05:41');
INSERT INTO `user` VALUES (4, '张扬', '张扬', 'aaa123', 3, 4, 4, 2, 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', NULL, NULL, NULL, '2026-02-03 16:59:42', '2026-02-03 16:59:42');
INSERT INTO `user` VALUES (5, '王子', '王子', 'aaa123', 3, 6, 6, 3, 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', NULL, NULL, NULL, '2026-02-03 11:09:54', '2026-02-03 11:09:54');

-- ----------------------------
-- Table structure for user_class
-- ----------------------------
DROP TABLE IF EXISTS `user_class`;
CREATE TABLE `user_class`  (
  `class_id` int NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `class_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班级名称',
  `class_description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班级描述',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_class
-- ----------------------------
INSERT INTO `user_class` VALUES (1, '1班', NULL);
INSERT INTO `user_class` VALUES (2, '2班', NULL);
INSERT INTO `user_class` VALUES (3, '3班', NULL);
INSERT INTO `user_class` VALUES (4, '4班', NULL);
INSERT INTO `user_class` VALUES (5, '5班', NULL);
INSERT INTO `user_class` VALUES (6, '6班', NULL);
INSERT INTO `user_class` VALUES (7, '7班', NULL);
INSERT INTO `user_class` VALUES (8, '8班', NULL);
INSERT INTO `user_class` VALUES (9, '9班', NULL);
INSERT INTO `user_class` VALUES (10, '10班', NULL);
INSERT INTO `user_class` VALUES (11, '11班', NULL);
INSERT INTO `user_class` VALUES (12, '12班', NULL);

SET FOREIGN_KEY_CHECKS = 1;
