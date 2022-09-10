/*
 Navicat Premium Data Transfer

 Source Server         : 139.198.104.199
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 139.198.104.199:3306
 Source Schema         : hgmes

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 01/09/2022 19:36:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for e_dict
-- ----------------------------
DROP TABLE IF EXISTS `e_dict`;
CREATE TABLE `e_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKf5wwh5osfukkeebw7h2yb4kmp`(`code`) USING BTREE,
  INDEX `FKi8lurtplfsktg01y6uevop5yp`(`create_user_id`) USING BTREE,
  INDEX `FKhxpr89ae0g4rd9xpfgcdjf0sa`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKhxpr89ae0g4rd9xpfgcdjf0sa` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKi8lurtplfsktg01y6uevop5yp` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_dict
-- ----------------------------
INSERT INTO `e_dict` VALUES (1, '2021-01-17 18:47:33', '2021-01-17 18:52:47', 'classesRestType', '班次休息时间类型', NULL, 1, 1, NULL, NULL);
INSERT INTO `e_dict` VALUES (2, '2022-08-04 14:08:09', NULL, 'workOrderType', '工单类型', NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_dict` VALUES (3, '2022-08-11 14:08:06', '2022-08-11 14:08:06', 'productionLineStatus', '产线状态', NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_dict` VALUES (4, '2022-08-11 19:08:59', '2022-08-11 19:08:59', 'controlType', '管控类型', NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_dict` VALUES (5, '2022-08-17 19:37:58', '2022-08-17 19:37:58', 'processRouteType', '工艺路线类型', NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_dict` VALUES (6, '2022-08-18 14:07:43', '2022-08-18 14:07:43', 'collectOption', '采集选项', NULL, NULL, NULL, '管理员', '管理员');

-- ----------------------------
-- Table structure for e_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `e_dict_item`;
CREATE TABLE `e_dict_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `erupt_dict_id` bigint(20) NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKl0kiq8otpn3fvtlvarebt8xkh`(`code`, `erupt_dict_id`) USING BTREE,
  INDEX `FKij9x8hwy16dra7d49h483lu2u`(`create_user_id`) USING BTREE,
  INDEX `FKmlg0pjfxwih4i6r0g0iilh1lu`(`update_user_id`) USING BTREE,
  INDEX `FKrrbi2dt94rjd8sjt830m3w0a`(`erupt_dict_id`) USING BTREE,
  CONSTRAINT `FKij9x8hwy16dra7d49h483lu2u` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmlg0pjfxwih4i6r0g0iilh1lu` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_dict_item
-- ----------------------------
INSERT INTO `e_dict_item` VALUES (1, '2021-01-17 18:48:04', NULL, '1', '早间休息', NULL, 1, 1, NULL, 1, NULL, NULL);
INSERT INTO `e_dict_item` VALUES (2, '2021-01-17 18:48:13', NULL, '2', '午间休息', NULL, 2, 1, NULL, 1, NULL, NULL);
INSERT INTO `e_dict_item` VALUES (3, '2021-01-17 18:48:22', NULL, '3', '晚间休息', NULL, 3, 1, NULL, 1, NULL, NULL);
INSERT INTO `e_dict_item` VALUES (5, '2022-08-04 14:08:28', NULL, '1', '量产', NULL, 1, 1, NULL, 2, NULL, NULL);
INSERT INTO `e_dict_item` VALUES (6, '2022-08-04 14:08:40', NULL, '2', '备产', NULL, 2, 1, NULL, 2, NULL, NULL);
INSERT INTO `e_dict_item` VALUES (7, '2022-08-11 14:08:34', '2022-08-11 14:08:34', '1', '正常', NULL, NULL, NULL, NULL, 3, '管理员', '管理员');
INSERT INTO `e_dict_item` VALUES (8, '2022-08-11 14:08:40', '2022-08-11 14:08:40', '2', '停线', NULL, NULL, NULL, NULL, 3, '管理员', '管理员');
INSERT INTO `e_dict_item` VALUES (9, '2022-08-11 14:08:48', '2022-08-11 14:08:48', '3', '故障', NULL, NULL, NULL, NULL, 3, '管理员', '管理员');
INSERT INTO `e_dict_item` VALUES (10, '2022-08-11 19:09:09', '2022-08-11 19:09:09', '1', '批次', NULL, NULL, NULL, NULL, 4, '管理员', '管理员');
INSERT INTO `e_dict_item` VALUES (11, '2022-08-17 19:38:16', '2022-08-17 19:38:16', '1', '生产', NULL, NULL, NULL, NULL, 5, '管理员', '管理员');
INSERT INTO `e_dict_item` VALUES (12, '2022-08-18 14:08:37', '2022-08-18 14:08:37', '1', '必采', NULL, NULL, NULL, NULL, 6, '管理员', '管理员');
INSERT INTO `e_dict_item` VALUES (13, '2022-08-18 14:08:43', '2022-08-18 14:08:43', '2', '可采', NULL, NULL, NULL, NULL, 6, '管理员', '管理员');
INSERT INTO `e_dict_item` VALUES (14, '2022-08-18 14:08:52', '2022-08-18 14:08:52', '3', '不可采', NULL, NULL, NULL, NULL, 6, '管理员', '管理员');

-- ----------------------------
-- Table structure for e_generator_class
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_class`;
CREATE TABLE `e_generator_class`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实体类名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生成Erupt代码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_generator_class
-- ----------------------------

-- ----------------------------
-- Table structure for e_generator_field
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_field`;
CREATE TABLE `e_generator_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `is_show` bit(1) NULL DEFAULT NULL COMMENT '是否显示',
  `link_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联实体类',
  `not_null` bit(1) NULL DEFAULT NULL COMMENT '是否必填',
  `query` bit(1) NULL DEFAULT NULL COMMENT '查询项',
  `show_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '显示顺序',
  `sortable` bit(1) NULL DEFAULT NULL COMMENT '字段排序',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑类型',
  `class_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKslwo9qwwfbgif9mbbhg072s4i`(`class_id`) USING BTREE,
  CONSTRAINT `FKslwo9qwwfbgif9mbbhg072s4i` FOREIGN KEY (`class_id`) REFERENCES `e_generator_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Erupt字段信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_generator_field
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_login_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_login_log`;
CREATE TABLE `e_upms_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP来源',
  `system_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_login_log
-- ----------------------------
INSERT INTO `e_upms_login_log` VALUES (1, 'Chrome 10 104', 'Computer', '10.10.100.176', '2022-09-01 19:31:41', '0|0|0|内网IP|内网IP', 'Windows 10', '456Dy4CiwFdhD7Z7', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (2, 'Chrome 10 104', 'Computer', '10.10.100.176', '2022-09-01 19:35:38', '0|0|0|内网IP|内网IP', 'Windows 10', '1wd285eizZmxL0Sk', 'erupt');

-- ----------------------------
-- Table structure for e_upms_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_menu`;
CREATE TABLE `e_upms_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `parent_menu_id` bigint(20) NULL DEFAULT NULL,
  `power_off` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK95xpkppt33d2bka0g2d7rgwqt`(`code`) USING BTREE,
  INDEX `FK4p5siq6l1rf9y47bosayghcsv`(`create_user_id`) USING BTREE,
  INDEX `FKtm66wffkyyluinneyva8kd2bc`(`update_user_id`) USING BTREE,
  INDEX `FK5mkgea183mm02v7ic1pdwxy5s`(`parent_menu_id`) USING BTREE,
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK4p5siq6l1rf9y47bosayghcsv` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtm66wffkyyluinneyva8kd2bc` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 401 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_menu
-- ----------------------------
INSERT INTO `e_upms_menu` VALUES (1, NULL, NULL, '$manager', 'fa fa-cogs', '系统管理', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (2, NULL, NULL, 'EruptMenu', 'fa fa-list-ul', '菜单维护', NULL, 10, 1, 'tree', 'EruptMenu', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (3, NULL, NULL, 'EruptRole', NULL, '角色维护', NULL, 20, 1, 'table', 'EruptRole', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (4, NULL, NULL, 'EruptOrg', 'fa fa-users', '组织维护', NULL, 30, 1, 'tree', 'EruptOrg', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (5, NULL, NULL, 'EruptUser', 'fa fa-user', '用户维护', NULL, 40, 1, 'table', 'EruptUser', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (6, NULL, NULL, 'EruptDict', NULL, '字典维护', NULL, 50, 1, 'table', 'EruptDict', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (7, NULL, '2021-01-17 18:46:08', 'EruptDictItem', NULL, '字典项', NULL, 10, 2, 'table', 'EruptDictItem', NULL, 1, 6, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (8, NULL, NULL, 'EruptLoginLog', NULL, '登录日志', NULL, 60, 1, 'table', 'EruptLoginLog', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (9, NULL, NULL, 'EruptOperateLog', NULL, '操作日志', NULL, 70, 1, 'table', 'EruptOperateLog', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (10, '2020-12-31 20:51:40', '2022-08-07 11:32:15', 'SIMPLE', NULL, '简单示例', NULL, 80, 2, 'table', 'Simple', 1, 1, NULL, NULL, NULL, 'erupt');
INSERT INTO `e_upms_menu` VALUES (11, NULL, NULL, '$generator', 'fa fa-code', '代码生成', NULL, 40, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (12, NULL, NULL, 'GeneratorClass', NULL, '生成Erupt代码', NULL, 0, 1, 'table', 'GeneratorClass', NULL, NULL, 11, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (13, '2021-01-16 19:11:34', '2022-08-17 21:15:26', 'FormInfo', NULL, '工艺详情', NULL, 90, 2, 'tpl', 'process-detail.html', 1, 1, NULL, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (14, '2021-01-16 19:50:46', '2021-01-16 22:31:41', 'CUSTOMER', NULL, '客户管理', NULL, 100, 2, 'table', 'Customer', 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (15, '2021-01-16 19:51:06', '2021-01-16 20:56:14', 'CONTACT', NULL, '联系人管理', NULL, 110, 2, 'table', 'Contact', 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (16, '2021-01-16 20:59:58', NULL, '$ProductionModeling', 'fa fa-product-hunt', '生产建模', NULL, 120, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (18, '2021-01-16 21:37:52', '2022-08-11 19:15:26', 'Shift', 'fa fa-user-plus', '班制', NULL, 8, 1, 'table', 'Shift', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (19, '2021-01-17 11:08:15', '2022-08-11 19:15:42', 'Classes', 'fa fa-user-plus', '班次', NULL, 9, 1, 'table', 'Classes', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (20, '2021-01-17 11:24:45', '2022-08-11 19:15:53', 'ClassesRest', 'fa fa-user-plus', '班次休息时间', NULL, 160, 2, 'table', 'ClassesRest', 1, 1, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (21, '2021-01-17 17:41:31', '2021-01-17 18:42:14', 'Article', NULL, '文章管理', NULL, 170, 2, 'table', 'Article', 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (22, '2021-01-17 17:41:47', '2021-01-17 18:42:20', 'Complex', NULL, '复杂示例', NULL, 180, 2, 'table', 'Complex', 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (23, '2021-02-09 22:42:25', NULL, 'EruptPost', 'fa fa-id-card', '岗位维护', NULL, 35, 1, 'table', 'EruptPost', 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (25, '2021-02-09 23:02:31', '2022-08-11 19:17:44', 'UnitLevel', NULL, '组织层级', NULL, 200, 2, 'tree', 'UnitLevel', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (26, '2021-02-09 23:23:27', '2022-08-11 19:17:33', 'UnitFramework', NULL, '组织架构', NULL, 210, 2, 'tree', 'UnitFramework', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (27, '2021-02-09 23:40:05', '2022-08-11 19:17:14', 'WorkshopSection', NULL, '工段', NULL, 5, 1, 'table', 'WorkshopSection', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (29, '2021-02-13 19:20:40', '2022-08-09 15:02:37', '$MaterialManagement', 'fa fa-list-alt', '物料管理', NULL, 121, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (30, '2021-02-13 19:21:20', '2022-08-11 18:50:51', 'MaterialCategory', NULL, '物料分类', NULL, 260, 1, 'tree', 'MaterialCategory', 1, 1, 29, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (31, '2021-02-13 19:59:17', '2022-08-11 19:24:47', 'ProductionClusterCategory', NULL, '产品族分类', NULL, 275, 2, 'tree', 'ProductionClusterCategory', 1, NULL, 29, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (32, '2021-02-13 19:59:47', '2022-08-11 19:24:56', 'ProductionCluster', NULL, '产品族', NULL, 280, 2, 'table', 'ProductionCluster', 1, 1, 29, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (34, '2021-02-15 20:30:51', '2022-08-11 19:18:46', 'QuickCode', NULL, '快码管理', NULL, 90, 2, 'table', 'QuickCode', 1, NULL, 1, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (35, '2021-02-15 21:24:12', '2022-08-11 11:42:32', 'WorkingProcedure', NULL, '工序', NULL, 4, 1, 'table', 'WorkingProcedure', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (37, '2021-02-16 22:21:37', '2022-08-11 19:19:35', 'Employee', NULL, '员工', NULL, 10, 1, 'table', 'Employee', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (38, '2022-08-03 18:43:14', '2022-08-11 19:16:27', 'WorkshopPosition', NULL, '工位', NULL, 7, 1, 'table', 'WorkshopPosition', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (39, '2022-08-03 19:45:53', '2022-08-11 19:19:45', 'WorkTeam', NULL, '班组', NULL, 11, 1, 'table', 'WorkTeam', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (40, '2022-08-03 20:41:25', '2022-08-11 19:09:50', 'MaterialProperty', NULL, '物料属性', NULL, 261, 2, 'table', 'MaterialProperty', 1, 1, 29, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (41, '2022-08-03 20:43:43', NULL, 'MaterialPropertyValue', NULL, '物料属性值', NULL, 262, 2, 'table', 'MaterialPropertyValue', 1, NULL, 29, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (42, '2022-08-03 21:03:59', '2022-08-11 19:09:40', 'MaterialCategoryPropertyTeam', NULL, '类别属性组', NULL, 263, 2, 'table', 'MaterialCategoryPropertyTeam', 1, NULL, 29, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (43, '2022-08-04 08:32:56', '2022-08-11 19:09:26', 'MaterialCategoryPropertyValue', NULL, '类别属性值', NULL, 264, 2, 'table', 'MaterialCategoryPropertyValue', 1, NULL, 29, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (44, '2022-08-04 10:25:40', '2022-08-11 19:11:36', 'Material', NULL, '物料信息', NULL, 265, 1, 'table', 'Material', 1, NULL, 29, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (45, '2022-08-04 11:24:32', '2022-08-09 15:02:55', '$PlanAndSchedule', 'fa fa-calendar', '生产管理', NULL, 122, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (47, '2022-08-04 14:13:21', '2022-08-09 14:56:29', 'WorkOrder', NULL, '工单管理', NULL, 340, 1, 'table', 'WorkOrder', 1, NULL, 45, NULL, NULL, 'erupt');
INSERT INTO `e_upms_menu` VALUES (48, '2022-08-04 17:09:38', '2022-09-01 18:22:30', 'MeasureUnit', NULL, '计量单位', NULL, 1, 1, 'table', 'MeasureUnit', 1, NULL, 16, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (49, '2022-08-05 18:31:21', NULL, 'EruptMenu@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptMenu@ADD', NULL, NULL, 2, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (50, '2022-08-05 18:31:21', NULL, 'EruptMenu@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptMenu@EDIT', NULL, NULL, 2, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (51, '2022-08-05 18:31:21', NULL, 'EruptMenu@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptMenu@DELETE', NULL, NULL, 2, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (52, '2022-08-05 18:31:21', NULL, 'EruptMenu@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptMenu@VIEW_DETAIL', NULL, NULL, 2, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (53, '2022-08-05 18:31:21', NULL, 'EruptRole@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptRole@ADD', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (54, '2022-08-05 18:31:21', NULL, 'EruptRole@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptRole@EDIT', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (55, '2022-08-05 18:31:21', NULL, 'EruptRole@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptRole@DELETE', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (56, '2022-08-05 18:31:21', NULL, 'EruptRole@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptRole@VIEW_DETAIL', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (57, '2022-08-05 18:31:21', NULL, 'EruptOrg@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptOrg@ADD', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (58, '2022-08-05 18:31:21', NULL, 'EruptOrg@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptOrg@EDIT', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (59, '2022-08-05 18:31:21', NULL, 'EruptOrg@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptOrg@DELETE', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (60, '2022-08-05 18:31:21', NULL, 'EruptOrg@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptOrg@VIEW_DETAIL', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (61, '2022-08-05 18:31:21', NULL, 'EruptPost@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptPost@ADD', NULL, NULL, 23, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (62, '2022-08-05 18:31:21', NULL, 'EruptPost@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptPost@EDIT', NULL, NULL, 23, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (63, '2022-08-05 18:31:21', NULL, 'EruptPost@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptPost@DELETE', NULL, NULL, 23, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (64, '2022-08-05 18:31:21', NULL, 'EruptPost@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptPost@VIEW_DETAIL', NULL, NULL, 23, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (65, '2022-08-05 18:31:21', NULL, 'EruptUser@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptUser@ADD', NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (66, '2022-08-05 18:31:21', NULL, 'EruptUser@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptUser@EDIT', NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (67, '2022-08-05 18:31:21', NULL, 'EruptUser@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptUser@DELETE', NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (68, '2022-08-05 18:31:21', NULL, 'EruptUser@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptUser@VIEW_DETAIL', NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (69, '2022-08-05 18:31:21', NULL, 'EruptDict@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptDict@ADD', NULL, NULL, 6, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (70, '2022-08-05 18:31:21', NULL, 'EruptDict@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptDict@EDIT', NULL, NULL, 6, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (71, '2022-08-05 18:31:21', NULL, 'EruptDict@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptDict@DELETE', NULL, NULL, 6, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (72, '2022-08-05 18:31:21', NULL, 'EruptDict@EXPORT', NULL, '导出', NULL, 40, 1, 'button', 'EruptDict@EXPORT', NULL, NULL, 6, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (73, '2022-08-05 18:31:21', NULL, 'EruptDict@VIEW_DETAIL', NULL, '详情', NULL, 50, 1, 'button', 'EruptDict@VIEW_DETAIL', NULL, NULL, 6, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (74, '2022-08-05 18:31:21', NULL, 'EruptDictItem@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptDictItem@ADD', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (75, '2022-08-05 18:31:21', NULL, 'EruptDictItem@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptDictItem@EDIT', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (76, '2022-08-05 18:31:21', NULL, 'EruptDictItem@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptDictItem@DELETE', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (77, '2022-08-05 18:31:21', NULL, 'EruptDictItem@EXPORT', NULL, '导出', NULL, 40, 1, 'button', 'EruptDictItem@EXPORT', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (78, '2022-08-05 18:31:21', NULL, 'EruptDictItem@VIEW_DETAIL', NULL, '详情', NULL, 50, 1, 'button', 'EruptDictItem@VIEW_DETAIL', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (79, '2022-08-05 18:31:21', NULL, 'EruptOnline', '', '在线用户', NULL, 65, 1, 'table', 'EruptOnline', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (80, '2022-08-05 18:31:21', NULL, 'EruptOnline@EXPORT', NULL, '导出', NULL, 10, 1, 'button', 'EruptOnline@EXPORT', NULL, NULL, 79, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (81, '2022-08-05 18:31:21', NULL, 'EruptLoginLog@EXPORT', NULL, '导出', NULL, 10, 1, 'button', 'EruptLoginLog@EXPORT', NULL, NULL, 8, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (82, '2022-08-05 18:31:21', NULL, 'GeneratorClass@ADD', NULL, '新增', NULL, 10, 1, 'button', 'GeneratorClass@ADD', NULL, NULL, 12, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (83, '2022-08-05 18:31:21', NULL, 'GeneratorClass@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'GeneratorClass@EDIT', NULL, NULL, 12, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (84, '2022-08-05 18:31:21', NULL, 'GeneratorClass@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'GeneratorClass@DELETE', NULL, NULL, 12, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (85, '2022-08-05 18:31:21', NULL, 'GeneratorClass@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'GeneratorClass@VIEW_DETAIL', NULL, NULL, 12, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (86, '2022-08-05 18:55:38', '2022-08-05 18:55:38', 'SWJutPC4', NULL, '新增', NULL, 10, 1, 'button', 'QuickCode@ADD', NULL, NULL, 34, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (87, '2022-08-05 18:56:23', '2022-08-05 18:56:23', 'zzFgUxhH', NULL, '新增', NULL, 10, 1, 'button', 'WorkTeam@ADD', NULL, NULL, 39, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (88, '2022-08-05 18:56:47', '2022-08-05 18:56:47', 'S4TtM63i', NULL, '修改', NULL, 350, 1, 'button', 'WorkTeam@EDIT', NULL, NULL, 39, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (89, '2022-08-05 18:57:07', '2022-08-05 18:57:07', 'plSeWHHu', NULL, '删除', NULL, 360, 1, 'button', 'WorkTeam@DELETE', NULL, NULL, 39, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (90, '2022-08-05 18:57:31', '2022-08-05 18:57:31', 'CGa46CLu', NULL, '详情', NULL, 370, 1, 'button', 'WorkTeam@VIEW_DETAIL', NULL, NULL, 39, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (91, '2022-08-05 19:18:13', '2022-08-05 19:18:13', '8q7bcVCs', NULL, '新增', NULL, 10, 1, 'button', 'MeasureUnit@ADD', NULL, NULL, 48, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (92, '2022-08-05 19:18:35', '2022-08-05 19:18:35', '19ERu43Q', NULL, '修改', NULL, 380, 1, 'button', 'MeasureUnit@EDIT', NULL, NULL, 48, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (93, '2022-08-05 19:18:54', '2022-08-05 19:18:54', 'fLdRIxEZ', NULL, '删除', NULL, 390, 1, 'button', 'MeasureUnit@DELETE', NULL, NULL, 48, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (94, '2022-08-05 19:19:14', '2022-08-05 19:19:14', 'ZXDR3kSY', NULL, '详情', NULL, 400, 1, 'button', 'MeasureUnit@VIEW_DETAIL', NULL, NULL, 48, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (95, '2022-08-05 20:43:04', '2022-08-11 11:27:38', 'pNbBrvY7', NULL, '工作日历', NULL, 13, 1, 'table', 'Calendar', NULL, NULL, 16, NULL, 'erupt', '管理员');
INSERT INTO `e_upms_menu` VALUES (104, '2022-08-07 10:34:45', '2022-09-01 18:23:07', '62XF280A', NULL, '车间建模', NULL, 2, 1, 'table', 'Workshop', NULL, NULL, 16, NULL, 'erupt', '管理员');
INSERT INTO `e_upms_menu` VALUES (121, '2022-08-07 11:32:15', NULL, 'dI9tapGZ', NULL, '新增', NULL, 10, 1, 'button', 'Simple@ADD', NULL, NULL, 10, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (122, '2022-08-07 11:32:15', NULL, 'xEhT4s0A', NULL, '修改', NULL, 20, 1, 'button', 'Simple@EDIT', NULL, NULL, 10, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (123, '2022-08-07 11:32:15', NULL, 'zcuhzf4e', NULL, '删除', NULL, 30, 1, 'button', 'Simple@DELETE', NULL, NULL, 10, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (124, '2022-08-07 11:32:15', NULL, '3AbKyGIa', NULL, '导出', NULL, 40, 1, 'button', 'Simple@EXPORT', NULL, NULL, 10, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (125, '2022-08-07 11:32:15', NULL, 'Mp8NpFLW', NULL, '导入', NULL, 50, 1, 'button', 'Simple@IMPORTABLE', NULL, NULL, 10, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (126, '2022-08-07 11:32:15', NULL, 'k1RORDF7', NULL, '详情', NULL, 60, 1, 'button', 'Simple@VIEW_DETAIL', NULL, NULL, 10, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (127, '2022-08-07 14:46:26', '2022-08-11 14:07:15', 'XLtW7coN', NULL, '产线建模', NULL, 3, 1, 'table', 'ProductionLine', NULL, NULL, 16, NULL, 'erupt', '管理员');
INSERT INTO `e_upms_menu` VALUES (132, '2022-08-07 15:31:58', '2022-08-09 15:07:34', 'wDo5HAXf', 'fa fa-tv', '设备管理', NULL, 126, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'erupt', '管理员');
INSERT INTO `e_upms_menu` VALUES (133, '2022-08-07 15:32:19', '2022-08-07 15:32:49', 'iP9IAONr', NULL, '设备分类', NULL, 10, 1, 'tree', 'DeviceCategory', NULL, NULL, 132, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (134, '2022-08-07 15:32:19', NULL, 'rWGdB1ZD', NULL, '新增', NULL, 10, 1, 'button', 'DeviceCategory@ADD', NULL, NULL, 133, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (135, '2022-08-07 15:32:19', NULL, 'QVl0QXgb', NULL, '修改', NULL, 20, 1, 'button', 'DeviceCategory@EDIT', NULL, NULL, 133, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (136, '2022-08-07 15:32:19', NULL, 'rIXh9ae2', NULL, '删除', NULL, 30, 1, 'button', 'DeviceCategory@DELETE', NULL, NULL, 133, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (137, '2022-08-07 15:32:19', NULL, 'UjXN6vJw', NULL, '详情', NULL, 40, 1, 'button', 'DeviceCategory@VIEW_DETAIL', NULL, NULL, 133, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (138, '2022-08-07 16:06:49', '2022-08-11 18:19:11', 'LlUGuhwv', NULL, '供应商', NULL, 10, 1, 'table', 'Supplier', NULL, NULL, 29, NULL, 'erupt', '管理员');
INSERT INTO `e_upms_menu` VALUES (143, '2022-08-07 16:20:21', '2022-08-11 18:24:42', 'wCu7YfkW', NULL, '线边仓', NULL, 20, 1, 'table', 'Warehouse', NULL, NULL, 29, NULL, 'erupt', '管理员');
INSERT INTO `e_upms_menu` VALUES (156, '2022-08-07 17:37:34', '2022-08-07 17:37:34', '4nVuboXR', NULL, '设备台账', NULL, 20, 1, 'table', 'Device', NULL, NULL, 132, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (157, '2022-08-07 17:37:34', NULL, 'F8Ho4cpU', NULL, '新增', NULL, 10, 1, 'button', 'Device@ADD', NULL, NULL, 156, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (158, '2022-08-07 17:37:34', NULL, 'yofphVTQ', NULL, '修改', NULL, 20, 1, 'button', 'Device@EDIT', NULL, NULL, 156, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (159, '2022-08-07 17:37:34', NULL, '1mgtYaXB', NULL, '删除', NULL, 30, 1, 'button', 'Device@DELETE', NULL, NULL, 156, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (160, '2022-08-07 17:37:34', NULL, 'ZX2KCVVG', NULL, '导出', NULL, 40, 1, 'button', 'Device@EXPORT', NULL, NULL, 156, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (161, '2022-08-07 17:37:34', NULL, 'IT0CZaiY', NULL, '导入', NULL, 50, 1, 'button', 'Device@IMPORTABLE', NULL, NULL, 156, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (162, '2022-08-07 17:37:34', NULL, 'uGJ4pVkU', NULL, '详情', NULL, 60, 1, 'button', 'Device@VIEW_DETAIL', NULL, NULL, 156, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (163, '2022-08-07 17:55:26', '2022-08-07 17:55:26', 'esYtCvaX', NULL, '工作中心', NULL, 12, 1, 'table', 'WorkingCenter', NULL, NULL, 16, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (164, '2022-08-07 17:55:26', NULL, '2fL3wis6', NULL, '新增', NULL, 10, 1, 'button', 'WorkingCenter@ADD', NULL, NULL, 163, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (165, '2022-08-07 17:55:26', NULL, 'DLAo5e1a', NULL, '修改', NULL, 20, 1, 'button', 'WorkingCenter@EDIT', NULL, NULL, 163, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (166, '2022-08-07 17:55:26', NULL, '53hBEv5h', NULL, '删除', NULL, 30, 1, 'button', 'WorkingCenter@DELETE', NULL, NULL, 163, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (167, '2022-08-07 17:55:26', NULL, '73H7B9Eh', NULL, '详情', NULL, 40, 1, 'button', 'WorkingCenter@VIEW_DETAIL', NULL, NULL, 163, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (168, '2022-08-07 18:14:32', '2022-08-11 19:45:43', '4pO5ZW4a', NULL, '物料BOM', NULL, 266, 1, 'table', 'MaterialBOM', NULL, NULL, 29, NULL, 'erupt', '管理员');
INSERT INTO `e_upms_menu` VALUES (173, '2022-08-08 19:59:11', '2022-08-08 19:59:11', 'dmptBt41', NULL, '新增', NULL, 10, 1, 'button', 'WorkOrder@ADD', NULL, NULL, 47, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (174, '2022-08-08 19:59:31', '2022-08-08 19:59:31', 'hyr5goQ4', NULL, '修改', NULL, 20, 1, 'button', 'WorkOrder@EDIT', NULL, NULL, 47, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (175, '2022-08-08 19:59:52', '2022-08-08 19:59:52', 'jAz3ja6q', NULL, '删除', NULL, 30, 1, 'button', 'WorkOrder@DELETE', NULL, NULL, 47, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (176, '2022-08-08 20:00:17', '2022-08-08 20:00:17', 'sQXXsOXo', NULL, '详情', NULL, 40, 1, 'button', 'WorkOrder@VIEW_DETAIL', NULL, NULL, 47, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (178, '2022-08-09 09:51:56', '2022-09-01 18:25:18', 'P3PvZUWZ', NULL, '工艺路线', NULL, 6, 1, 'table', 'ProcessRoute', NULL, NULL, 16, NULL, 'erupt', '管理员');
INSERT INTO `e_upms_menu` VALUES (183, '2022-08-09 11:19:30', '2022-08-09 17:31:25', 'vt3TE588', NULL, '工艺路线关联工序', NULL, 268, 3, 'table', 'ProcessRouteWorkingProcedure', NULL, NULL, 29, NULL, 'erupt', '管理员');
INSERT INTO `e_upms_menu` VALUES (188, '2022-08-09 14:13:42', '2022-08-09 14:13:42', 'dahUvZ7N', NULL, '生产领料', NULL, 269, 1, 'table', 'ProductionPicking', NULL, NULL, 29, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (189, '2022-08-09 14:13:42', NULL, 'UUAnjjim', NULL, '新增', NULL, 10, 1, 'button', 'ProductionPicking@ADD', NULL, NULL, 188, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (190, '2022-08-09 14:13:42', NULL, 'CcOTTL7K', NULL, '修改', NULL, 20, 1, 'button', 'ProductionPicking@EDIT', NULL, NULL, 188, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (191, '2022-08-09 14:13:42', NULL, 'xXS3uvgs', NULL, '删除', NULL, 30, 1, 'button', 'ProductionPicking@DELETE', NULL, NULL, 188, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (192, '2022-08-09 14:13:42', NULL, 'Mpkyij1O', NULL, '详情', NULL, 40, 1, 'button', 'ProductionPicking@VIEW_DETAIL', NULL, NULL, 188, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (193, '2022-08-09 14:29:05', '2022-08-09 14:29:05', 'Z1GB2tCd', NULL, '常规领料', NULL, 270, 1, 'table', 'CommonPicking', NULL, NULL, 29, NULL, 'erupt', 'erupt');
INSERT INTO `e_upms_menu` VALUES (194, '2022-08-09 14:29:05', NULL, '6ccVjGER', NULL, '新增', NULL, 10, 1, 'button', 'CommonPicking@ADD', NULL, NULL, 193, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (195, '2022-08-09 14:29:05', NULL, 'VNS6QNLV', NULL, '修改', NULL, 20, 1, 'button', 'CommonPicking@EDIT', NULL, NULL, 193, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (196, '2022-08-09 14:29:05', NULL, 'Jmh4X6Aw', NULL, '删除', NULL, 30, 1, 'button', 'CommonPicking@DELETE', NULL, NULL, 193, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (197, '2022-08-09 14:29:05', NULL, 'Nq5OmVRp', NULL, '详情', NULL, 40, 1, 'button', 'CommonPicking@VIEW_DETAIL', NULL, NULL, 193, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (202, '2022-08-09 15:03:34', '2022-08-09 15:03:34', 'sVxJpnpU', 'fa fa-cog', '质量管理', NULL, 123, 1, NULL, NULL, NULL, NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (203, '2022-08-09 15:04:18', '2022-08-28 10:29:23', '1oXwjsNR', 'fa fa-reply', '追溯管理', NULL, 124, 2, NULL, NULL, NULL, NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (204, '2022-08-09 15:07:15', '2022-08-17 18:52:20', 'EQN0QkBD', 'fa fa-scissors', '维保管理', NULL, 125, 2, NULL, NULL, NULL, NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (205, '2022-08-09 15:09:26', '2022-08-17 18:51:39', 'F9kX6HTE', 'fa fa-cutlery', '工装管理', NULL, 128, 2, NULL, NULL, NULL, NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (206, '2022-08-09 15:11:04', '2022-08-17 18:51:27', 'wQRnrgit', 'fa fa-exclamation-triangle', '预警管理', NULL, 130, 2, NULL, NULL, NULL, NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (207, '2022-08-09 15:15:07', '2022-08-17 18:51:31', 'Vl0Nswsq', 'fa fa-wrench', '维修管理', NULL, 129, 2, NULL, NULL, NULL, NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (208, '2022-08-09 15:15:49', '2022-08-17 18:51:21', 'E6iXvAiJ', 'fa fa-window-close', '异常管理', NULL, 131, 2, NULL, NULL, NULL, NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (209, '2022-08-09 15:27:32', '2022-08-09 15:27:32', 'Mmp6kVtR', NULL, '检验项定义', NULL, 10, 1, 'table', 'InspectionItemDefinition', NULL, NULL, 202, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (210, '2022-08-09 15:27:32', NULL, 'EcgL8h97', NULL, '新增', NULL, 10, 1, 'button', 'InspectionItemDefinition@ADD', NULL, NULL, 209, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (211, '2022-08-09 15:27:32', NULL, 'a1H1CSjp', NULL, '修改', NULL, 20, 1, 'button', 'InspectionItemDefinition@EDIT', NULL, NULL, 209, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (212, '2022-08-09 15:27:32', NULL, '5lv5px6Z', NULL, '删除', NULL, 30, 1, 'button', 'InspectionItemDefinition@DELETE', NULL, NULL, 209, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (213, '2022-08-09 15:27:32', NULL, 'yTIez6ab', NULL, '详情', NULL, 40, 1, 'button', 'InspectionItemDefinition@VIEW_DETAIL', NULL, NULL, 209, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (214, '2022-08-09 15:51:59', '2022-08-09 15:51:59', 'AhijTJjr', NULL, '检验清单', NULL, 20, 1, 'table', 'InspectionBill', NULL, NULL, 202, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (215, '2022-08-09 15:51:59', NULL, 'hdeZE5Ut', NULL, '新增', NULL, 10, 1, 'button', 'InspectionBill@ADD', NULL, NULL, 214, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (216, '2022-08-09 15:51:59', NULL, 'dGOfgq0R', NULL, '修改', NULL, 20, 1, 'button', 'InspectionBill@EDIT', NULL, NULL, 214, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (217, '2022-08-09 15:51:59', NULL, 'qtDNHuf7', NULL, '删除', NULL, 30, 1, 'button', 'InspectionBill@DELETE', NULL, NULL, 214, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (218, '2022-08-09 15:51:59', NULL, 'GfQEXdsq', NULL, '导出', NULL, 40, 1, 'button', 'InspectionBill@EXPORT', NULL, NULL, 214, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (219, '2022-08-09 15:51:59', NULL, '1Qow2NZJ', NULL, '导入', NULL, 50, 1, 'button', 'InspectionBill@IMPORTABLE', NULL, NULL, 214, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (220, '2022-08-09 15:51:59', NULL, '8CVGz4JN', NULL, '详情', NULL, 60, 1, 'button', 'InspectionBill@VIEW_DETAIL', NULL, NULL, 214, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (226, '2022-08-09 17:30:42', NULL, 'VdONwwWV', NULL, '新增', NULL, 10, 1, 'button', 'ProcessRouteWorkingProcedure@ADD', NULL, NULL, 183, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (227, '2022-08-09 17:30:42', NULL, 'CSae4mef', NULL, '修改', NULL, 20, 1, 'button', 'ProcessRouteWorkingProcedure@EDIT', NULL, NULL, 183, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (228, '2022-08-09 17:30:42', NULL, 'kOD2VQqu', NULL, '删除', NULL, 30, 1, 'button', 'ProcessRouteWorkingProcedure@DELETE', NULL, NULL, 183, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (229, '2022-08-09 17:30:42', NULL, 'jH8UG7q0', NULL, '详情', NULL, 40, 1, 'button', 'ProcessRouteWorkingProcedure@VIEW_DETAIL', NULL, NULL, 183, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (230, '2022-08-09 17:40:35', '2022-08-17 21:30:41', 'UgRrXCmI', NULL, '工艺详情', NULL, 268, 2, 'tpl', 'tree-table.html', NULL, NULL, NULL, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (231, '2022-08-10 18:24:15', '2022-08-10 18:24:15', 'tazapNEi', NULL, '导入', NULL, 50, 1, 'button', 'MeasureUnit@IMPORTABLE', NULL, NULL, 48, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (232, '2022-08-10 18:24:37', '2022-08-10 18:24:37', 'MJ4PviNW', NULL, '导出', NULL, 60, 1, 'button', 'MeasureUnit@EXPORT', NULL, NULL, 48, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (233, '2022-08-10 18:50:23', NULL, '3bFPsiT7', NULL, '新增', NULL, 10, 1, 'button', 'Workshop@ADD', NULL, NULL, 104, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (234, '2022-08-10 18:50:23', NULL, 'UWNzKGZN', NULL, '修改', NULL, 20, 1, 'button', 'Workshop@EDIT', NULL, NULL, 104, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (235, '2022-08-10 18:50:23', NULL, 'cjtPebgR', NULL, '删除', NULL, 30, 1, 'button', 'Workshop@DELETE', NULL, NULL, 104, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (236, '2022-08-10 18:50:23', NULL, 'zlXqkRsZ', NULL, '导出', NULL, 40, 1, 'button', 'Workshop@EXPORT', NULL, NULL, 104, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (237, '2022-08-10 18:50:23', NULL, 'NxIGeQRS', NULL, '导入', NULL, 50, 1, 'button', 'Workshop@IMPORTABLE', NULL, NULL, 104, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (238, '2022-08-10 18:50:23', NULL, 'MzTWgUVn', NULL, '详情', NULL, 60, 1, 'button', 'Workshop@VIEW_DETAIL', NULL, NULL, 104, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (239, '2022-08-10 19:52:14', NULL, 'EbOXtlPY', NULL, '新增', NULL, 10, 1, 'button', 'Employee@ADD', NULL, NULL, 37, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (240, '2022-08-10 19:52:14', NULL, 'yIewT8XJ', NULL, '修改', NULL, 20, 1, 'button', 'Employee@EDIT', NULL, NULL, 37, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (241, '2022-08-10 19:52:14', NULL, 'eJgaDLso', NULL, '删除', NULL, 30, 1, 'button', 'Employee@DELETE', NULL, NULL, 37, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (242, '2022-08-10 19:52:14', NULL, 'VaQipTcQ', NULL, '导出', NULL, 40, 1, 'button', 'Employee@EXPORT', NULL, NULL, 37, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (243, '2022-08-10 19:52:14', NULL, 'u5bgWefe', NULL, '导入', NULL, 50, 1, 'button', 'Employee@IMPORTABLE', NULL, NULL, 37, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (244, '2022-08-10 19:52:14', NULL, 'LwP0NSpr', NULL, '详情', NULL, 60, 1, 'button', 'Employee@VIEW_DETAIL', NULL, NULL, 37, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (245, '2022-08-10 21:15:14', NULL, 'HvFfOfcs', NULL, '新增', NULL, 10, 1, 'button', 'ClassesRest@ADD', NULL, NULL, 20, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (246, '2022-08-10 21:15:14', NULL, '9SpWyljc', NULL, '修改', NULL, 20, 1, 'button', 'ClassesRest@EDIT', NULL, NULL, 20, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (247, '2022-08-10 21:15:14', NULL, '8gKo5EeT', NULL, '删除', NULL, 30, 1, 'button', 'ClassesRest@DELETE', NULL, NULL, 20, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (248, '2022-08-10 21:15:14', NULL, 'UaX3lCJX', NULL, '详情', NULL, 40, 1, 'button', 'ClassesRest@VIEW_DETAIL', NULL, NULL, 20, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (253, '2022-08-10 21:44:36', NULL, '7m7umffQ', NULL, '新增', NULL, 10, 1, 'button', 'Shift@ADD', NULL, NULL, 18, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (254, '2022-08-10 21:44:36', NULL, 'vwufMf00', NULL, '修改', NULL, 20, 1, 'button', 'Shift@EDIT', NULL, NULL, 18, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (255, '2022-08-10 21:44:36', NULL, 'jXVLTJZo', NULL, '删除', NULL, 30, 1, 'button', 'Shift@DELETE', NULL, NULL, 18, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (256, '2022-08-10 21:44:36', NULL, 'pfrtM1ya', NULL, '导出', NULL, 40, 1, 'button', 'Shift@EXPORT', NULL, NULL, 18, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (257, '2022-08-10 21:44:36', NULL, 'YNRYXRcf', NULL, '导入', NULL, 50, 1, 'button', 'Shift@IMPORTABLE', NULL, NULL, 18, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (258, '2022-08-10 21:44:36', NULL, 'QV41PP0D', NULL, '详情', NULL, 60, 1, 'button', 'Shift@VIEW_DETAIL', NULL, NULL, 18, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (259, '2022-08-10 21:45:04', NULL, 'e8iIeyeS', NULL, '新增', NULL, 10, 1, 'button', 'Classes@ADD', NULL, NULL, 19, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (260, '2022-08-10 21:45:04', NULL, 'M1Mtxe45', NULL, '修改', NULL, 20, 1, 'button', 'Classes@EDIT', NULL, NULL, 19, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (261, '2022-08-10 21:45:04', NULL, 'bEHe4ljO', NULL, '删除', NULL, 30, 1, 'button', 'Classes@DELETE', NULL, NULL, 19, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (262, '2022-08-10 21:45:04', NULL, '3J5WxdZv', NULL, '导出', NULL, 40, 1, 'button', 'Classes@EXPORT', NULL, NULL, 19, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (263, '2022-08-10 21:45:04', NULL, '556jCGhh', NULL, '导入', NULL, 50, 1, 'button', 'Classes@IMPORTABLE', NULL, NULL, 19, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (264, '2022-08-10 21:45:04', NULL, 'JP1v86Ar', NULL, '详情', NULL, 60, 1, 'button', 'Classes@VIEW_DETAIL', NULL, NULL, 19, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (265, '2022-08-10 21:55:44', NULL, 'Jd2qZdC9', NULL, '新增', NULL, 10, 1, 'button', 'UnitFramework@ADD', NULL, NULL, 26, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (266, '2022-08-10 21:55:44', NULL, '6hG2gVZ7', NULL, '修改', NULL, 20, 1, 'button', 'UnitFramework@EDIT', NULL, NULL, 26, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (267, '2022-08-10 21:55:44', NULL, 'evktsNSp', NULL, '删除', NULL, 30, 1, 'button', 'UnitFramework@DELETE', NULL, NULL, 26, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (268, '2022-08-10 21:55:44', NULL, 'egn8EioU', NULL, '详情', NULL, 40, 1, 'button', 'UnitFramework@VIEW_DETAIL', NULL, NULL, 26, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (269, '2022-08-10 21:55:55', NULL, '1s7HJiBv', NULL, '新增', NULL, 10, 1, 'button', 'UnitLevel@ADD', NULL, NULL, 25, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (270, '2022-08-10 21:55:55', NULL, 'X2JyiZb7', NULL, '修改', NULL, 20, 1, 'button', 'UnitLevel@EDIT', NULL, NULL, 25, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (271, '2022-08-10 21:55:55', NULL, '1BnBg8tw', NULL, '删除', NULL, 30, 1, 'button', 'UnitLevel@DELETE', NULL, NULL, 25, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (272, '2022-08-10 21:55:55', NULL, 'kEMX6aZ9', NULL, '详情', NULL, 40, 1, 'button', 'UnitLevel@VIEW_DETAIL', NULL, NULL, 25, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (273, '2022-08-11 08:28:35', NULL, '1OTuwWg5', NULL, '新增', NULL, 10, 1, 'button', 'ProductionClusterCategory@ADD', NULL, NULL, 31, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (274, '2022-08-11 08:28:35', NULL, 'iQor0MnU', NULL, '修改', NULL, 20, 1, 'button', 'ProductionClusterCategory@EDIT', NULL, NULL, 31, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (275, '2022-08-11 08:28:35', NULL, 'B0PzbEqU', NULL, '删除', NULL, 30, 1, 'button', 'ProductionClusterCategory@DELETE', NULL, NULL, 31, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (276, '2022-08-11 08:28:35', NULL, 'wA7asrq0', NULL, '导出', NULL, 40, 1, 'button', 'ProductionClusterCategory@EXPORT', NULL, NULL, 31, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (277, '2022-08-11 08:28:35', NULL, 'mEYq8XkB', NULL, '导入', NULL, 50, 1, 'button', 'ProductionClusterCategory@IMPORTABLE', NULL, NULL, 31, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (278, '2022-08-11 08:28:35', NULL, 'uJWem3TB', NULL, '详情', NULL, 60, 1, 'button', 'ProductionClusterCategory@VIEW_DETAIL', NULL, NULL, 31, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (279, '2022-08-11 08:28:44', NULL, 'YvIu6560', NULL, '新增', NULL, 10, 1, 'button', 'ProductionCluster@ADD', NULL, NULL, 32, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (280, '2022-08-11 08:28:44', NULL, 'Nq8cWsYE', NULL, '修改', NULL, 20, 1, 'button', 'ProductionCluster@EDIT', NULL, NULL, 32, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (281, '2022-08-11 08:28:44', NULL, 'Lg2rJZ1x', NULL, '删除', NULL, 30, 1, 'button', 'ProductionCluster@DELETE', NULL, NULL, 32, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (282, '2022-08-11 08:28:44', NULL, 'gu2N9mH5', NULL, '导出', NULL, 40, 1, 'button', 'ProductionCluster@EXPORT', NULL, NULL, 32, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (283, '2022-08-11 08:28:44', NULL, 'GUjvv4vm', NULL, '导入', NULL, 50, 1, 'button', 'ProductionCluster@IMPORTABLE', NULL, NULL, 32, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (284, '2022-08-11 08:28:44', NULL, 'NYZuJIlU', NULL, '详情', NULL, 60, 1, 'button', 'ProductionCluster@VIEW_DETAIL', NULL, NULL, 32, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (285, '2022-08-11 11:27:38', NULL, 'qxlBs1du', NULL, '新增', NULL, 10, 1, 'button', 'Calendar@ADD', NULL, NULL, 95, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (286, '2022-08-11 11:27:38', NULL, 'A4j9DYqo', NULL, '修改', NULL, 20, 1, 'button', 'Calendar@EDIT', NULL, NULL, 95, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (287, '2022-08-11 11:27:38', NULL, '6UaXugea', NULL, '删除', NULL, 30, 1, 'button', 'Calendar@DELETE', NULL, NULL, 95, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (288, '2022-08-11 11:27:38', NULL, '08DSPNB4', NULL, '导出', NULL, 40, 1, 'button', 'Calendar@EXPORT', NULL, NULL, 95, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (289, '2022-08-11 11:27:38', NULL, 'bSlKDr9Z', NULL, '导入', NULL, 50, 1, 'button', 'Calendar@IMPORTABLE', NULL, NULL, 95, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (290, '2022-08-11 11:27:38', NULL, 'VGBQfl8x', NULL, '详情', NULL, 60, 1, 'button', 'Calendar@VIEW_DETAIL', NULL, NULL, 95, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (291, '2022-08-11 11:42:32', NULL, 'mubowB5Z', NULL, '新增', NULL, 10, 1, 'button', 'WorkingProcedure@ADD', NULL, NULL, 35, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (292, '2022-08-11 11:42:32', NULL, '3bBUcZut', NULL, '修改', NULL, 20, 1, 'button', 'WorkingProcedure@EDIT', NULL, NULL, 35, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (293, '2022-08-11 11:42:32', NULL, '6TVAl5Qw', NULL, '删除', NULL, 30, 1, 'button', 'WorkingProcedure@DELETE', NULL, NULL, 35, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (294, '2022-08-11 11:42:32', NULL, '21ibCdw6', NULL, '导出', NULL, 40, 1, 'button', 'WorkingProcedure@EXPORT', NULL, NULL, 35, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (295, '2022-08-11 11:42:32', NULL, 'cZHzwuOw', NULL, '导入', NULL, 50, 1, 'button', 'WorkingProcedure@IMPORTABLE', NULL, NULL, 35, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (296, '2022-08-11 11:42:32', NULL, 'imZNModS', NULL, '详情', NULL, 60, 1, 'button', 'WorkingProcedure@VIEW_DETAIL', NULL, NULL, 35, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (297, '2022-08-11 14:07:15', NULL, 'LvYUydvk', NULL, '新增', NULL, 10, 1, 'button', 'ProductionLine@ADD', NULL, NULL, 127, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (298, '2022-08-11 14:07:15', NULL, 'gAvESYx1', NULL, '修改', NULL, 20, 1, 'button', 'ProductionLine@EDIT', NULL, NULL, 127, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (299, '2022-08-11 14:07:15', NULL, 'e9jSJ0Zo', NULL, '删除', NULL, 30, 1, 'button', 'ProductionLine@DELETE', NULL, NULL, 127, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (300, '2022-08-11 14:07:15', NULL, 'X4N9IDDn', NULL, '导出', NULL, 40, 1, 'button', 'ProductionLine@EXPORT', NULL, NULL, 127, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (301, '2022-08-11 14:07:15', NULL, 'QCm4s6Do', NULL, '导入', NULL, 50, 1, 'button', 'ProductionLine@IMPORTABLE', NULL, NULL, 127, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (302, '2022-08-11 14:07:15', NULL, 'otzu0UmX', NULL, '详情', NULL, 60, 1, 'button', 'ProductionLine@VIEW_DETAIL', NULL, NULL, 127, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (303, '2022-08-11 14:38:01', NULL, 'MoMrxc5w', NULL, '新增', NULL, 10, 1, 'button', 'WorkshopSection@ADD', NULL, NULL, 27, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (304, '2022-08-11 14:38:01', NULL, '5KzlrorU', NULL, '修改', NULL, 20, 1, 'button', 'WorkshopSection@EDIT', NULL, NULL, 27, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (305, '2022-08-11 14:38:01', NULL, 'kYqWizLd', NULL, '删除', NULL, 30, 1, 'button', 'WorkshopSection@DELETE', NULL, NULL, 27, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (306, '2022-08-11 14:38:01', NULL, 'kDkK60qE', NULL, '导出', NULL, 40, 1, 'button', 'WorkshopSection@EXPORT', NULL, NULL, 27, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (307, '2022-08-11 14:38:01', NULL, 'UVfH0q1I', NULL, '导入', NULL, 50, 1, 'button', 'WorkshopSection@IMPORTABLE', NULL, NULL, 27, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (308, '2022-08-11 14:38:01', NULL, 'AfJRx0KE', NULL, '详情', NULL, 60, 1, 'button', 'WorkshopSection@VIEW_DETAIL', NULL, NULL, 27, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (309, '2022-08-11 17:06:11', NULL, '2eSWEMPt', NULL, '新增', NULL, 10, 1, 'button', 'WorkshopPosition@ADD', NULL, NULL, 38, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (310, '2022-08-11 17:06:11', NULL, 'Cn4niKfp', NULL, '修改', NULL, 20, 1, 'button', 'WorkshopPosition@EDIT', NULL, NULL, 38, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (311, '2022-08-11 17:06:11', NULL, 'kCTkzAQD', NULL, '删除', NULL, 30, 1, 'button', 'WorkshopPosition@DELETE', NULL, NULL, 38, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (312, '2022-08-11 17:06:11', NULL, 'GWnRDpYr', NULL, '导出', NULL, 40, 1, 'button', 'WorkshopPosition@EXPORT', NULL, NULL, 38, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (313, '2022-08-11 17:06:11', NULL, '31L04iK0', NULL, '导入', NULL, 50, 1, 'button', 'WorkshopPosition@IMPORTABLE', NULL, NULL, 38, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (314, '2022-08-11 17:06:11', NULL, 'oD7kMBYo', NULL, '详情', NULL, 60, 1, 'button', 'WorkshopPosition@VIEW_DETAIL', NULL, NULL, 38, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (315, '2022-08-11 18:19:11', NULL, 'u67SCXad', NULL, '新增', NULL, 10, 1, 'button', 'Supplier@ADD', NULL, NULL, 138, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (316, '2022-08-11 18:19:11', NULL, 'I3L8Yf2F', NULL, '修改', NULL, 20, 1, 'button', 'Supplier@EDIT', NULL, NULL, 138, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (317, '2022-08-11 18:19:11', NULL, 'D9sD6KVq', NULL, '删除', NULL, 30, 1, 'button', 'Supplier@DELETE', NULL, NULL, 138, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (318, '2022-08-11 18:19:11', NULL, 'm7gRfOl2', NULL, '导出', NULL, 40, 1, 'button', 'Supplier@EXPORT', NULL, NULL, 138, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (319, '2022-08-11 18:19:11', NULL, 'lCYwuF58', NULL, '导入', NULL, 50, 1, 'button', 'Supplier@IMPORTABLE', NULL, NULL, 138, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (320, '2022-08-11 18:19:11', NULL, 'JeacU7Wq', NULL, '详情', NULL, 60, 1, 'button', 'Supplier@VIEW_DETAIL', NULL, NULL, 138, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (321, '2022-08-11 18:24:42', NULL, 'PE2HMTCZ', NULL, '新增', NULL, 10, 1, 'button', 'Warehouse@ADD', NULL, NULL, 143, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (322, '2022-08-11 18:24:42', NULL, 'tZLYwWfN', NULL, '修改', NULL, 20, 1, 'button', 'Warehouse@EDIT', NULL, NULL, 143, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (323, '2022-08-11 18:24:42', NULL, 'OI6stxec', NULL, '删除', NULL, 30, 1, 'button', 'Warehouse@DELETE', NULL, NULL, 143, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (324, '2022-08-11 18:24:42', NULL, 'j9PvNxV8', NULL, '导出', NULL, 40, 1, 'button', 'Warehouse@EXPORT', NULL, NULL, 143, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (325, '2022-08-11 18:24:42', NULL, 'jVWgoxuC', NULL, '导入', NULL, 50, 1, 'button', 'Warehouse@IMPORTABLE', NULL, NULL, 143, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (326, '2022-08-11 18:24:42', NULL, 'rTK5OXOg', NULL, '详情', NULL, 60, 1, 'button', 'Warehouse@VIEW_DETAIL', NULL, NULL, 143, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (327, '2022-08-11 18:50:51', NULL, '56eTHNzK', NULL, '新增', NULL, 10, 1, 'button', 'MaterialCategory@ADD', NULL, NULL, 30, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (328, '2022-08-11 18:50:51', NULL, 'dqZ2YpeA', NULL, '修改', NULL, 20, 1, 'button', 'MaterialCategory@EDIT', NULL, NULL, 30, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (329, '2022-08-11 18:50:51', NULL, 'Pc7bFXwe', NULL, '删除', NULL, 30, 1, 'button', 'MaterialCategory@DELETE', NULL, NULL, 30, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (330, '2022-08-11 18:50:51', NULL, '26D1slxs', NULL, '导出', NULL, 40, 1, 'button', 'MaterialCategory@EXPORT', NULL, NULL, 30, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (331, '2022-08-11 18:50:51', NULL, 'aTWROP1J', NULL, '导入', NULL, 50, 1, 'button', 'MaterialCategory@IMPORTABLE', NULL, NULL, 30, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (332, '2022-08-11 18:50:51', NULL, '8JE6EKWG', NULL, '详情', NULL, 60, 1, 'button', 'MaterialCategory@VIEW_DETAIL', NULL, NULL, 30, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (333, '2022-08-11 19:09:26', NULL, 'ZiFbBw48', NULL, '新增', NULL, 10, 1, 'button', 'MaterialCategoryPropertyValue@ADD', NULL, NULL, 43, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (334, '2022-08-11 19:09:40', NULL, 'xXrgHVCM', NULL, '新增', NULL, 10, 1, 'button', 'MaterialCategoryPropertyTeam@ADD', NULL, NULL, 42, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (335, '2022-08-11 19:09:40', NULL, 'wPbQPpQT', NULL, '修改', NULL, 20, 1, 'button', 'MaterialCategoryPropertyTeam@EDIT', NULL, NULL, 42, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (336, '2022-08-11 19:09:40', NULL, 'NtJ4EpFA', NULL, '删除', NULL, 30, 1, 'button', 'MaterialCategoryPropertyTeam@DELETE', NULL, NULL, 42, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (337, '2022-08-11 19:09:40', NULL, 'ShicOZhR', NULL, '详情', NULL, 40, 1, 'button', 'MaterialCategoryPropertyTeam@VIEW_DETAIL', NULL, NULL, 42, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (338, '2022-08-11 19:09:50', NULL, 'aCHfW886', NULL, '新增', NULL, 10, 1, 'button', 'MaterialProperty@ADD', NULL, NULL, 40, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (339, '2022-08-11 19:09:50', NULL, 'jPieh7tk', NULL, '修改', NULL, 20, 1, 'button', 'MaterialProperty@EDIT', NULL, NULL, 40, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (340, '2022-08-11 19:09:50', NULL, '1e27Bm6S', NULL, '删除', NULL, 30, 1, 'button', 'MaterialProperty@DELETE', NULL, NULL, 40, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (341, '2022-08-11 19:09:50', NULL, 'cnWKVYWU', NULL, '详情', NULL, 40, 1, 'button', 'MaterialProperty@VIEW_DETAIL', NULL, NULL, 40, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (342, '2022-08-11 19:11:36', NULL, '23YRInpw', NULL, '新增', NULL, 10, 1, 'button', 'Material@ADD', NULL, NULL, 44, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (343, '2022-08-11 19:11:36', NULL, 'qd55ZYOX', NULL, '修改', NULL, 20, 1, 'button', 'Material@EDIT', NULL, NULL, 44, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (344, '2022-08-11 19:11:36', NULL, 'vsqZb32V', NULL, '删除', NULL, 30, 1, 'button', 'Material@DELETE', NULL, NULL, 44, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (345, '2022-08-11 19:11:36', NULL, 'hT11i1FF', NULL, '导出', NULL, 40, 1, 'button', 'Material@EXPORT', NULL, NULL, 44, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (346, '2022-08-11 19:11:36', NULL, 'cSsX3Tij', NULL, '导入', NULL, 50, 1, 'button', 'Material@IMPORTABLE', NULL, NULL, 44, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (347, '2022-08-11 19:11:36', NULL, 'I3ECO0wH', NULL, '详情', NULL, 60, 1, 'button', 'Material@VIEW_DETAIL', NULL, NULL, 44, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (348, '2022-08-11 19:45:43', NULL, 'Nm09UMpa', NULL, '新增', NULL, 10, 1, 'button', 'MaterialBOM@ADD', NULL, NULL, 168, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (349, '2022-08-11 19:45:43', NULL, 'OXmMFVmx', NULL, '修改', NULL, 20, 1, 'button', 'MaterialBOM@EDIT', NULL, NULL, 168, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (350, '2022-08-11 19:45:43', NULL, 'vuIwmPCf', NULL, '删除', NULL, 30, 1, 'button', 'MaterialBOM@DELETE', NULL, NULL, 168, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (351, '2022-08-11 19:45:43', NULL, 'NeikNK5U', NULL, '导出', NULL, 40, 1, 'button', 'MaterialBOM@EXPORT', NULL, NULL, 168, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (352, '2022-08-11 19:45:44', NULL, 'APcoFs38', NULL, '导入', NULL, 50, 1, 'button', 'MaterialBOM@IMPORTABLE', NULL, NULL, 168, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (353, '2022-08-11 19:45:44', NULL, 'Y1LH8uv7', NULL, '详情', NULL, 60, 1, 'button', 'MaterialBOM@VIEW_DETAIL', NULL, NULL, 168, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (355, '2022-08-17 20:02:37', '2022-09-01 18:30:35', 'magic-api', NULL, '接口配置', NULL, 50, 2, 'tpl', 'magic-api.ftl', NULL, NULL, NULL, NULL, NULL, '管理员');
INSERT INTO `e_upms_menu` VALUES (356, '2022-08-17 20:02:37', NULL, 'magic-api-function', NULL, '函数', NULL, 10, 1, 'button', 'ERUPT_MAGIC_FUNCTION', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (357, '2022-08-17 20:02:37', NULL, 'magic-api-datasource', NULL, '数据源', NULL, 20, 1, 'button', 'ERUPT_MAGIC_DATASOURCE', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (358, '2022-08-17 20:02:37', NULL, 'magic-api-save', NULL, '保存', NULL, 30, 1, 'button', 'ERUPT_MAGIC_SAVE', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (359, '2022-08-17 20:02:37', NULL, 'magic-api-view', NULL, '查看', NULL, 40, 1, 'button', 'ERUPT_MAGIC_VIEW', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (360, '2022-08-17 20:02:37', NULL, 'magic-api-delete', NULL, '删除', NULL, 50, 1, 'button', 'ERUPT_MAGIC_DELETE', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (361, '2022-08-17 20:02:37', NULL, 'magic-api-download', NULL, '导出', NULL, 60, 1, 'button', 'ERUPT_MAGIC_DOWNLOAD', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (362, '2022-08-17 20:02:37', NULL, 'magic-api-upload', NULL, '上传', NULL, 70, 1, 'button', 'ERUPT_MAGIC_UPLOAD', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (363, '2022-08-17 20:02:37', NULL, 'magic-api-push', NULL, '远程推送', NULL, 80, 1, 'button', 'ERUPT_MAGIC_PUSH', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (364, '2022-08-17 20:02:37', NULL, 'magic-api-lock', NULL, '锁定', NULL, 90, 1, 'button', 'ERUPT_MAGIC_LOCK', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (365, '2022-08-17 20:02:37', NULL, 'magic-api-unlock', NULL, '解锁', NULL, 100, 1, 'button', 'ERUPT_MAGIC_UNLOCK', NULL, NULL, 355, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (366, '2022-08-18 11:07:28', '2022-08-18 11:07:28', 'YZhtWhB3', NULL, '工艺物料需求', NULL, 420, 2, 'table', 'ProcessRouteWorkingProcedureMaterialDemand', NULL, NULL, 183, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (367, '2022-08-18 11:07:28', NULL, 'LtHoNm5S', NULL, '新增', NULL, 10, 1, 'button', 'ProcessRouteWorkingProcedureMaterialDemand@ADD', NULL, NULL, 366, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (368, '2022-08-18 11:07:28', NULL, 'ghfjKc5K', NULL, '修改', NULL, 20, 1, 'button', 'ProcessRouteWorkingProcedureMaterialDemand@EDIT', NULL, NULL, 366, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (369, '2022-08-18 11:07:28', NULL, 'LoWW41zL', NULL, '删除', NULL, 30, 1, 'button', 'ProcessRouteWorkingProcedureMaterialDemand@DELETE', NULL, NULL, 366, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (370, '2022-08-18 11:07:28', NULL, 'QOYZsrHZ', NULL, '详情', NULL, 40, 1, 'button', 'ProcessRouteWorkingProcedureMaterialDemand@VIEW_DETAIL', NULL, NULL, 366, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (371, '2022-08-18 17:43:54', '2022-08-18 17:43:54', 'iKjdXhjg', NULL, '生产计划', NULL, 10, 1, 'table', 'ProductionPlan', NULL, NULL, 45, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (372, '2022-08-18 17:43:54', NULL, 'a6B8cd5Y', NULL, '新增', NULL, 10, 1, 'button', 'ProductionPlan@ADD', NULL, NULL, 371, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (373, '2022-08-18 17:43:54', NULL, 'hEJQtFdE', NULL, '修改', NULL, 20, 1, 'button', 'ProductionPlan@EDIT', NULL, NULL, 371, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (374, '2022-08-18 17:43:54', NULL, '7fRiESVE', NULL, '删除', NULL, 30, 1, 'button', 'ProductionPlan@DELETE', NULL, NULL, 371, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (375, '2022-08-18 17:43:54', NULL, 'vVJ1ZRbH', NULL, '导出', NULL, 40, 1, 'button', 'ProductionPlan@EXPORT', NULL, NULL, 371, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (376, '2022-08-18 17:43:54', NULL, 'vw2YtHp2', NULL, '导入', NULL, 50, 1, 'button', 'ProductionPlan@IMPORTABLE', NULL, NULL, 371, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (377, '2022-08-18 17:43:54', NULL, 'aT8anL2s', NULL, '详情', NULL, 60, 1, 'button', 'ProductionPlan@VIEW_DETAIL', NULL, NULL, 371, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (378, '2022-08-27 22:04:55', NULL, 'lAJYbOcb', NULL, '新增', NULL, 10, 1, 'button', 'ProcessRoute@ADD', NULL, NULL, 178, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (379, '2022-08-27 22:04:55', NULL, '37ZBJzgF', NULL, '修改', NULL, 20, 1, 'button', 'ProcessRoute@EDIT', NULL, NULL, 178, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (380, '2022-08-27 22:04:55', NULL, 'z1ZTeanr', NULL, '删除', NULL, 30, 1, 'button', 'ProcessRoute@DELETE', NULL, NULL, 178, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (381, '2022-08-27 22:04:55', NULL, 'N2JNnKuZ', NULL, '导出', NULL, 40, 1, 'button', 'ProcessRoute@EXPORT', NULL, NULL, 178, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (382, '2022-08-27 22:04:55', NULL, 'hZB5dDUV', NULL, '导入', NULL, 50, 1, 'button', 'ProcessRoute@IMPORTABLE', NULL, NULL, 178, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (383, '2022-08-27 22:04:55', NULL, 'SXrFo5iD', NULL, '详情', NULL, 60, 1, 'button', 'ProcessRoute@VIEW_DETAIL', NULL, NULL, 178, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (384, '2022-08-27 23:47:35', '2022-08-27 23:47:35', '3nq3W0qH', NULL, '车间收料', NULL, 271, 1, 'table', 'WorkshopReceive', NULL, NULL, 29, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (385, '2022-08-27 23:47:35', NULL, 'npzZmgE6', NULL, '新增', NULL, 10, 1, 'button', 'WorkshopReceive@ADD', NULL, NULL, 384, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (386, '2022-08-27 23:47:35', NULL, 'xCtGLXsR', NULL, '修改', NULL, 20, 1, 'button', 'WorkshopReceive@EDIT', NULL, NULL, 384, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (387, '2022-08-27 23:47:35', NULL, '2CCkQkJQ', NULL, '删除', NULL, 30, 1, 'button', 'WorkshopReceive@DELETE', NULL, NULL, 384, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (388, '2022-08-27 23:47:35', NULL, 'UhNUPk7m', NULL, '详情', NULL, 40, 1, 'button', 'WorkshopReceive@VIEW_DETAIL', NULL, NULL, 384, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (389, '2022-08-28 10:10:40', '2022-08-28 10:12:20', 'm1AQxosD', NULL, '生产退料', NULL, 272, 1, 'table', 'ProductionBack', NULL, NULL, 29, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (390, '2022-08-28 10:11:01', '2022-08-28 10:13:02', 'zLvpZzeE', NULL, '物料报废', NULL, 273, 1, 'table', 'MaterialScrap', NULL, NULL, 29, NULL, '管理员', '管理员');
INSERT INTO `e_upms_menu` VALUES (391, '2022-08-28 10:12:20', NULL, 'DV3ZXZEO', NULL, '新增', NULL, 10, 1, 'button', 'ProductionBack@ADD', NULL, NULL, 389, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (392, '2022-08-28 10:12:20', NULL, '40kX2DGM', NULL, '修改', NULL, 20, 1, 'button', 'ProductionBack@EDIT', NULL, NULL, 389, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (393, '2022-08-28 10:12:20', NULL, 'Jgf07MLY', NULL, '删除', NULL, 30, 1, 'button', 'ProductionBack@DELETE', NULL, NULL, 389, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (394, '2022-08-28 10:12:20', NULL, '8ch4EdIM', NULL, '详情', NULL, 40, 1, 'button', 'ProductionBack@VIEW_DETAIL', NULL, NULL, 389, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (395, '2022-08-28 10:13:02', NULL, 'EoTlawR2', NULL, '新增', NULL, 10, 1, 'button', 'MaterialScrap@ADD', NULL, NULL, 390, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (396, '2022-08-28 10:13:02', NULL, 'nVjivbTr', NULL, '修改', NULL, 20, 1, 'button', 'MaterialScrap@EDIT', NULL, NULL, 390, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (397, '2022-08-28 10:13:02', NULL, 'VDBqaF07', NULL, '删除', NULL, 30, 1, 'button', 'MaterialScrap@DELETE', NULL, NULL, 390, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (398, '2022-08-28 10:13:02', NULL, 'vumB9zHG', NULL, '导出', NULL, 40, 1, 'button', 'MaterialScrap@EXPORT', NULL, NULL, 390, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (399, '2022-08-28 10:13:02', NULL, 'YirOnR3D', NULL, '导入', NULL, 50, 1, 'button', 'MaterialScrap@IMPORTABLE', NULL, NULL, 390, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (400, '2022-08-28 10:13:02', NULL, 'OXhOYQGF', NULL, '详情', NULL, 60, 1, 'button', 'MaterialScrap@VIEW_DETAIL', NULL, NULL, 390, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for e_upms_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_operate_log`;
CREATE TABLE `e_upms_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '记录时间',
  `error_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `operate_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP来源',
  `req_addr` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `req_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `req_param` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `status` bit(1) NULL DEFAULT NULL COMMENT '是否成功',
  `total_time` bigint(20) NULL DEFAULT NULL COMMENT '请求耗时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_org
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_org`;
CREATE TABLE `e_upms_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `parent_org_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKc2wj35ujq2m84uw59dx6wy3gj`(`code`) USING BTREE,
  INDEX `FKtj7222kjnkt7pv9kfn9g8ck4h`(`parent_org_id`) USING BTREE,
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_org
-- ----------------------------
INSERT INTO `e_upms_org` VALUES (6, 'COMPANY', '泉州闲鹿机械股份有限公司', NULL, NULL);
INSERT INTO `e_upms_org` VALUES (7, 'QZ', '泉州总公司', 1, 6);
INSERT INTO `e_upms_org` VALUES (8, 'BJ', '北京分公司', 2, 6);
INSERT INTO `e_upms_org` VALUES (9, 'SH', '上海办事处', 3, 6);
INSERT INTO `e_upms_org` VALUES (10, 'ZZB', '制造部', NULL, 7);
INSERT INTO `e_upms_org` VALUES (11, 'ZP', '装配制造部', NULL, 10);
INSERT INTO `e_upms_org` VALUES (12, 'XL', '下料制造部', NULL, 10);
INSERT INTO `e_upms_org` VALUES (13, 'IT', '信息中心', NULL, 7);

-- ----------------------------
-- Table structure for e_upms_post
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_post`;
CREATE TABLE `e_upms_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `weight` int(11) NULL DEFAULT NULL COMMENT '岗位权重',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKltq5h3n5cyyk5nxtjhg9lhidg`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位维护' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_post
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role`;
CREATE TABLE `e_upms_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '展示顺序',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKjgxkp7mr4183tcwosrbqpsl3a`(`code`) USING BTREE,
  INDEX `FKad39xpgtpmhq0fp5newnabv1g`(`create_user_id`) USING BTREE,
  INDEX `FKbghup2p4f1x9eokeygyg8p658`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKad39xpgtpmhq0fp5newnabv1g` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbghup2p4f1x9eokeygyg8p658` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_role
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role_menu`;
CREATE TABLE `e_upms_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FKr6bl403chgwjnb6jk0uqqd9x8`(`menu_id`) USING BTREE,
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_user
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user`;
CREATE TABLE `e_upms_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `is_admin` bit(1) NULL DEFAULT NULL COMMENT '超管用户',
  `status` bit(1) NULL DEFAULT NULL COMMENT '账户状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `is_md5` bit(1) NULL DEFAULT NULL COMMENT 'md5加密',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `reset_pwd_time` datetime(0) NULL DEFAULT NULL COMMENT '重置密码时间',
  `white_ip` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip白名单',
  `erupt_org_id` bigint(20) NULL DEFAULT NULL COMMENT '所属组织',
  `erupt_post_id` bigint(20) NULL DEFAULT NULL COMMENT '岗位',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `erupt_menu_id` bigint(20) NULL DEFAULT NULL COMMENT '首页菜单',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK812t22yn0295dkkvx5gjgahax`(`account`) USING BTREE,
  INDEX `FK1re8jv3614mkk2wfxscvgvmnm`(`erupt_org_id`) USING BTREE,
  INDEX `FK53cice19aydjcuykpv847ocdv`(`erupt_post_id`) USING BTREE,
  INDEX `FKdvwfw4x66ahh1tavd69cnx4i0`(`create_user_id`) USING BTREE,
  INDEX `FKct3f9stm4eti10401f7rbh5ey`(`update_user_id`) USING BTREE,
  INDEX `FKga0jd7sahnn1tv14mq4dy5kba`(`erupt_menu_id`) USING BTREE,
  CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单用户对象' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_user
-- ----------------------------
INSERT INTO `e_upms_user` VALUES (1, 'erupt', 'erupt', b'1', b'1', '2022-09-01 19:31:26', NULL, NULL, b'1', '610d44f73b7709169e8e06ca4ac5af8e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for e_upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user_role`;
CREATE TABLE `e_upms_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `FKes2ylim5w3ej690ss84sb956x`(`user_id`) USING BTREE,
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_approve_form
-- ----------------------------
DROP TABLE IF EXISTS `t_approve_form`;
CREATE TABLE `t_approve_form`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation_id` bigint(20) NULL DEFAULT NULL COMMENT '关联单据ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  `result` bit(1) NULL DEFAULT NULL COMMENT '审核结果',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '审核表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_approve_form
-- ----------------------------

-- ----------------------------
-- Table structure for t_calendar
-- ----------------------------
DROP TABLE IF EXISTS `t_calendar`;
CREATE TABLE `t_calendar`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日历名称',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作日历' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_calendar
-- ----------------------------

-- ----------------------------
-- Table structure for t_calendar_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_calendar_detail`;
CREATE TABLE `t_calendar_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cycle_period` bit(1) NULL DEFAULT NULL COMMENT '循环周期',
  `days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '天数',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '周期',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `time_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '间隔',
  `type` bit(1) NULL DEFAULT NULL COMMENT '日历类型',
  `weight` float NULL DEFAULT NULL COMMENT '权重',
  `calendar_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5am3ni26lw5ebg6eav33rlcyy`(`calendar_id`) USING BTREE,
  CONSTRAINT `FK5am3ni26lw5ebg6eav33rlcyy` FOREIGN KEY (`calendar_id`) REFERENCES `t_calendar` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作日历明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_calendar_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_classes
-- ----------------------------
DROP TABLE IF EXISTS `t_classes`;
CREATE TABLE `t_classes`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班次编码',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班次名称',
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班次' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_classes
-- ----------------------------

-- ----------------------------
-- Table structure for t_classes_rest
-- ----------------------------
DROP TABLE IF EXISTS `t_classes_rest`;
CREATE TABLE `t_classes_rest`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NULL DEFAULT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班次休息时间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_classes_rest
-- ----------------------------

-- ----------------------------
-- Table structure for t_common_picking
-- ----------------------------
DROP TABLE IF EXISTS `t_common_picking`;
CREATE TABLE `t_common_picking`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单号',
  `picking_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领料时间',
  `picking_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领料人',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '接收线边仓',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK70ree49ylxj9si09v59u6qdjh`(`warehouse_id`) USING BTREE,
  CONSTRAINT `FK70ree49ylxj9si09v59u6qdjh` FOREIGN KEY (`warehouse_id`) REFERENCES `t_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '常规领料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_common_picking
-- ----------------------------

-- ----------------------------
-- Table structure for t_common_picking_material_move_order
-- ----------------------------
DROP TABLE IF EXISTS `t_common_picking_material_move_order`;
CREATE TABLE `t_common_picking_material_move_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实际数量',
  `control_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管控类型',
  `demand_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需求数量',
  `material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '物料名称',
  `common_picking_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsydfwqimi7215y9y9xnt1d42y`(`material_id`) USING BTREE,
  INDEX `FKm3phxsv4awwbime30i4mgeox5`(`common_picking_id`) USING BTREE,
  CONSTRAINT `FKm3phxsv4awwbime30i4mgeox5` FOREIGN KEY (`common_picking_id`) REFERENCES `t_common_picking` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsydfwqimi7215y9y9xnt1d42y` FOREIGN KEY (`material_id`) REFERENCES `t_material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '常规领料物料移动单明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_common_picking_material_move_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_contact
-- ----------------------------
DROP TABLE IF EXISTS `t_contact`;
CREATE TABLE `t_contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `customer_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbecrdjt5vrhubxtajt3oe80f9`(`customer_id`) USING BTREE,
  CONSTRAINT `FKbecrdjt5vrhubxtajt3oe80f9` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_contact
-- ----------------------------

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备编码',
  `manufacture_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产日期',
  `manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产商',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `device_category_id` bigint(20) NULL DEFAULT NULL COMMENT '设备分类',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商',
  `workshop_id` bigint(20) NULL DEFAULT NULL COMMENT '所属车间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKr82omi16jvb3gfuru32ymvlxt`(`device_category_id`) USING BTREE,
  INDEX `FKmsp6m6553fuy360ki1ee4mvn7`(`supplier_id`) USING BTREE,
  INDEX `FKr8li3e5hblhdie01yvcyp1k93`(`workshop_id`) USING BTREE,
  CONSTRAINT `FKmsp6m6553fuy360ki1ee4mvn7` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr82omi16jvb3gfuru32ymvlxt` FOREIGN KEY (`device_category_id`) REFERENCES `t_device_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr8li3e5hblhdie01yvcyp1k93` FOREIGN KEY (`workshop_id`) REFERENCES `t_workshop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备台账' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_device
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_category
-- ----------------------------
DROP TABLE IF EXISTS `t_device_category`;
CREATE TABLE `t_device_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级分类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8dwbfpjb3bnvde4uxwlvd6j35`(`parent_id`) USING BTREE,
  CONSTRAINT `FK8dwbfpjb3bnvde4uxwlvd6j35` FOREIGN KEY (`parent_id`) REFERENCES `t_device_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_device_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `birth_date` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `employee_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `enter_date` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `on_job` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sex` bit(1) NULL DEFAULT NULL COMMENT '性别',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `erupt_org_id` bigint(20) NULL DEFAULT NULL COMMENT '所属组织',
  `erupt_user_id` bigint(20) NULL DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK538c2xnlctm4cimp0whtxoht2`(`create_user_id`) USING BTREE,
  INDEX `FKtfljj9jek8ud0pttus1owv34y`(`update_user_id`) USING BTREE,
  INDEX `FKe5j24ksni1s9dpay6dku4elc7`(`erupt_org_id`) USING BTREE,
  INDEX `FKbli8hujea9fsm9s8u24v37khb`(`erupt_user_id`) USING BTREE,
  CONSTRAINT `FK538c2xnlctm4cimp0whtxoht2` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbli8hujea9fsm9s8u24v37khb` FOREIGN KEY (`erupt_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKe5j24ksni1s9dpay6dku4elc7` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtfljj9jek8ud0pttus1owv34y` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------

-- ----------------------------
-- Table structure for t_inspection_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_inspection_bill`;
CREATE TABLE `t_inspection_bill`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '检验清单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_inspection_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_inspection_bill_inspection_item
-- ----------------------------
DROP TABLE IF EXISTS `t_inspection_bill_inspection_item`;
CREATE TABLE `t_inspection_bill_inspection_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goal_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目标值',
  `inspection_item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项编码',
  `inspection_standard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验标准',
  `max_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上限',
  `measure_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计量单位',
  `min_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下限',
  `inspection_item_id` bigint(20) NULL DEFAULT NULL COMMENT '检验项名称',
  `inspection_bill_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKh9lco75nj7a57d8ipqqf8uje6`(`inspection_item_id`) USING BTREE,
  INDEX `FKmhryo5s2h00guj0mhymtehy4d`(`inspection_bill_id`) USING BTREE,
  CONSTRAINT `FKh9lco75nj7a57d8ipqqf8uje6` FOREIGN KEY (`inspection_item_id`) REFERENCES `t_inspection_item_definition` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmhryo5s2h00guj0mhymtehy4d` FOREIGN KEY (`inspection_bill_id`) REFERENCES `t_inspection_bill` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '检验清单检验项明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_inspection_bill_inspection_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_inspection_bill_material
-- ----------------------------
DROP TABLE IF EXISTS `t_inspection_bill_material`;
CREATE TABLE `t_inspection_bill_material`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `control_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管控类型',
  `material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '物料名称',
  `inspection_bill_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKoa1wks4y9qe47l8sed30j3e3s`(`material_id`) USING BTREE,
  INDEX `FK1djbx3d57h9dsmo3d0deko1i7`(`inspection_bill_id`) USING BTREE,
  CONSTRAINT `FK1djbx3d57h9dsmo3d0deko1i7` FOREIGN KEY (`inspection_bill_id`) REFERENCES `t_inspection_bill` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKoa1wks4y9qe47l8sed30j3e3s` FOREIGN KEY (`material_id`) REFERENCES `t_material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '检验清单物料明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_inspection_bill_material
-- ----------------------------

-- ----------------------------
-- Table structure for t_inspection_item_definition
-- ----------------------------
DROP TABLE IF EXISTS `t_inspection_item_definition`;
CREATE TABLE `t_inspection_item_definition`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `goal_value` int(11) NULL DEFAULT NULL COMMENT '目标值',
  `inspection_standard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验标准',
  `max_value` int(11) NULL DEFAULT NULL COMMENT '最大值',
  `min_value` int(11) NULL DEFAULT NULL COMMENT '最小值',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `quantitative_qualitative` bit(1) NULL DEFAULT NULL COMMENT '定量定性',
  `measure_unit_id` bigint(20) NULL DEFAULT NULL COMMENT '计量单位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8nqk0tabjuv9svpedrg4un8c1`(`measure_unit_id`) USING BTREE,
  CONSTRAINT `FK8nqk0tabjuv9svpedrg4un8c1` FOREIGN KEY (`measure_unit_id`) REFERENCES `t_measure_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '检验项定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_inspection_item_definition
-- ----------------------------

-- ----------------------------
-- Table structure for t_material
-- ----------------------------
DROP TABLE IF EXISTS `t_material`;
CREATE TABLE `t_material`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `control_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管控类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料描述',
  `model_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '型号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料名称',
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `material_category_id` bigint(20) NULL DEFAULT NULL COMMENT '所属分类',
  `measure_unit_id` bigint(20) NULL DEFAULT NULL COMMENT '计量单位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKqgau3hy71b89ielake8cy0cmm`(`material_category_id`) USING BTREE,
  INDEX `FK2adxw3eqo419pokp7a649hys3`(`measure_unit_id`) USING BTREE,
  CONSTRAINT `FK2adxw3eqo419pokp7a649hys3` FOREIGN KEY (`measure_unit_id`) REFERENCES `t_measure_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKqgau3hy71b89ielake8cy0cmm` FOREIGN KEY (`material_category_id`) REFERENCES `t_material_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_bom
-- ----------------------------
DROP TABLE IF EXISTS `t_material_bom`;
CREATE TABLE `t_material_bom`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BOM编码',
  `material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BOM描述',
  `production_number` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '物料名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7sujhyvuqhhmxgf01jp3gkora`(`material_id`) USING BTREE,
  CONSTRAINT `FK7sujhyvuqhhmxgf01jp3gkora` FOREIGN KEY (`material_id`) REFERENCES `t_material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料BOM' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_bom
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_bom_material
-- ----------------------------
DROP TABLE IF EXISTS `t_material_bom_material`;
CREATE TABLE `t_material_bom_material`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_number` int(11) NULL DEFAULT NULL COMMENT '数量',
  `material_usage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用途',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '物料名称',
  `measure_unit_id` bigint(20) NULL DEFAULT NULL COMMENT '计量单位',
  `material_bom_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK35kj2js0yg5x5y648mrsv4iu2`(`material_id`) USING BTREE,
  INDEX `FKbjkl2024wnmxbw03w8l1rivqa`(`measure_unit_id`) USING BTREE,
  INDEX `FK1v1r7vltxgqwo8gnutdvw63bt`(`material_bom_id`) USING BTREE,
  CONSTRAINT `FK1v1r7vltxgqwo8gnutdvw63bt` FOREIGN KEY (`material_bom_id`) REFERENCES `t_material_bom` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK35kj2js0yg5x5y648mrsv4iu2` FOREIGN KEY (`material_id`) REFERENCES `t_material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbjkl2024wnmxbw03w8l1rivqa` FOREIGN KEY (`measure_unit_id`) REFERENCES `t_measure_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料BOM明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_bom_material
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_category
-- ----------------------------
DROP TABLE IF EXISTS `t_material_category`;
CREATE TABLE `t_material_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级分类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKacq3g19kgpbu8de7p6lfiaa0m`(`parent_id`) USING BTREE,
  CONSTRAINT `FKacq3g19kgpbu8de7p6lfiaa0m` FOREIGN KEY (`parent_id`) REFERENCES `t_material_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_category_property_team
-- ----------------------------
DROP TABLE IF EXISTS `t_material_category_property_team`;
CREATE TABLE `t_material_category_property_team`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `material_category_id` bigint(20) NULL DEFAULT NULL COMMENT '物料类别',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKlqwhw8k6qvyvhskuvyixnwku2`(`material_category_id`) USING BTREE,
  CONSTRAINT `FKlqwhw8k6qvyvhskuvyixnwku2` FOREIGN KEY (`material_category_id`) REFERENCES `t_material_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类别属性组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_category_property_team
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_category_property_team_property
-- ----------------------------
DROP TABLE IF EXISTS `t_material_category_property_team_property`;
CREATE TABLE `t_material_category_property_team_property`  (
  `material_category_property_team_id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  INDEX `FKnwrfrj08wdna4bcldtvb1u3x`(`property_id`) USING BTREE,
  INDEX `FK4roywb9ngfm5v8gj98agykq9v`(`material_category_property_team_id`) USING BTREE,
  CONSTRAINT `FK4roywb9ngfm5v8gj98agykq9v` FOREIGN KEY (`material_category_property_team_id`) REFERENCES `t_material_category_property_team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnwrfrj08wdna4bcldtvb1u3x` FOREIGN KEY (`property_id`) REFERENCES `t_material_property` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_category_property_team_property
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_category_property_value
-- ----------------------------
DROP TABLE IF EXISTS `t_material_category_property_value`;
CREATE TABLE `t_material_category_property_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `material_category_id` bigint(20) NULL DEFAULT NULL COMMENT '物料类别',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKq57pn5s7g45je0trqmcjitjoq`(`material_category_id`) USING BTREE,
  CONSTRAINT `FKq57pn5s7g45je0trqmcjitjoq` FOREIGN KEY (`material_category_id`) REFERENCES `t_material_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类别属性值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_category_property_value
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_property
-- ----------------------------
DROP TABLE IF EXISTS `t_material_property`;
CREATE TABLE `t_material_property`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_property
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_property_value
-- ----------------------------
DROP TABLE IF EXISTS `t_material_property_value`;
CREATE TABLE `t_material_property_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性值',
  `material_property_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKmlaxlu72ah4yg9hr45b753u0l`(`material_property_id`) USING BTREE,
  CONSTRAINT `FKmlaxlu72ah4yg9hr45b753u0l` FOREIGN KEY (`material_property_id`) REFERENCES `t_material_property` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料属性值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_property_value
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_scrap
-- ----------------------------
DROP TABLE IF EXISTS `t_material_scrap`;
CREATE TABLE `t_material_scrap`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单号',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `scrap_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请时间',
  `scrap_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '接收线边仓',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKgbni4r2hdywpwlnvem5k0nrit`(`create_user_id`) USING BTREE,
  INDEX `FKji4jvjj6obd9abxrhtnleilj8`(`update_user_id`) USING BTREE,
  INDEX `FKt6p23q8c4g26h18ajej2rnbai`(`warehouse_id`) USING BTREE,
  CONSTRAINT `FKgbni4r2hdywpwlnvem5k0nrit` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKji4jvjj6obd9abxrhtnleilj8` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt6p23q8c4g26h18ajej2rnbai` FOREIGN KEY (`warehouse_id`) REFERENCES `t_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料报废' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_scrap
-- ----------------------------

-- ----------------------------
-- Table structure for t_material_scrap_material_move_order
-- ----------------------------
DROP TABLE IF EXISTS `t_material_scrap_material_move_order`;
CREATE TABLE `t_material_scrap_material_move_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `confirm_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认数量',
  `control_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管控类型',
  `material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `scrap_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报废数量',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '物料名称',
  `material_scrap_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK26glua3jtfxxv0v49h1ay7yfc`(`material_id`) USING BTREE,
  INDEX `FKaksdn91hk4vx7ous7iicqxdeu`(`material_scrap_id`) USING BTREE,
  CONSTRAINT `FK26glua3jtfxxv0v49h1ay7yfc` FOREIGN KEY (`material_id`) REFERENCES `t_material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKaksdn91hk4vx7ous7iicqxdeu` FOREIGN KEY (`material_scrap_id`) REFERENCES `t_material_scrap` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料报废物料移动单明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_material_scrap_material_move_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_measure_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_measure_unit`;
CREATE TABLE `t_measure_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chinese_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中文名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `english_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '计量单位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_measure_unit
-- ----------------------------

-- ----------------------------
-- Table structure for t_process_route
-- ----------------------------
DROP TABLE IF EXISTS `t_process_route`;
CREATE TABLE `t_process_route`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bom_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BOM',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工艺路线编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工艺路线名称',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工艺路线类型',
  `product_name_id` bigint(20) NULL DEFAULT NULL COMMENT '产品名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKar35t5q9h4wdlv6sb5gtlhokb`(`product_name_id`) USING BTREE,
  CONSTRAINT `FKar35t5q9h4wdlv6sb5gtlhokb` FOREIGN KEY (`product_name_id`) REFERENCES `t_material_bom` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工艺路线' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_process_route
-- ----------------------------

-- ----------------------------
-- Table structure for t_process_route_working_procedure
-- ----------------------------
DROP TABLE IF EXISTS `t_process_route_working_procedure`;
CREATE TABLE `t_process_route_working_procedure`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prepare_hour` int(11) NULL DEFAULT NULL COMMENT '准备工时',
  `sort_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顺序',
  `standard_hour` int(11) NULL DEFAULT NULL COMMENT '标准工时',
  `working_procedure_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序编码',
  `working_procedure_id` bigint(20) NULL DEFAULT NULL COMMENT '工序名称',
  `process_route_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKklfr6sjcipqef9ewaubprv8di`(`working_procedure_id`) USING BTREE,
  INDEX `FKkh56v555p4olwjdd1q9g19q42`(`process_route_id`) USING BTREE,
  CONSTRAINT `FKkh56v555p4olwjdd1q9g19q42` FOREIGN KEY (`process_route_id`) REFERENCES `t_process_route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKklfr6sjcipqef9ewaubprv8di` FOREIGN KEY (`working_procedure_id`) REFERENCES `t_working_procedure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关联工序明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_process_route_working_procedure
-- ----------------------------

-- ----------------------------
-- Table structure for t_process_route_working_procedure_material_demand
-- ----------------------------
DROP TABLE IF EXISTS `t_process_route_working_procedure_material_demand`;
CREATE TABLE `t_process_route_working_procedure_material_demand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `collect_option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集选项',
  `control_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管控类型',
  `demand_number` int(11) NULL DEFAULT NULL COMMENT '需求数量',
  `material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '物料名称',
  `process_route_working_procedure_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3q6w9jpo9ail8mm6y4oftai2`(`material_id`) USING BTREE,
  INDEX `FKdjvkt3hnr6h19mx6ckaer5ayg`(`process_route_working_procedure_id`) USING BTREE,
  CONSTRAINT `FK3q6w9jpo9ail8mm6y4oftai2` FOREIGN KEY (`material_id`) REFERENCES `t_material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdjvkt3hnr6h19mx6ckaer5ayg` FOREIGN KEY (`process_route_working_procedure_id`) REFERENCES `t_process_route_working_procedure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工艺物料需求明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_process_route_working_procedure_material_demand
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_back
-- ----------------------------
DROP TABLE IF EXISTS `t_production_back`;
CREATE TABLE `t_production_back`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `back_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退料时间',
  `back_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退料人',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单号',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '接收线边仓',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKm8vowq52uayijlnb5irp9wqpe`(`create_user_id`) USING BTREE,
  INDEX `FK6gejeo0blhv0w0l7muisbaleo`(`update_user_id`) USING BTREE,
  INDEX `FK9shk41f22ot7i9qjnliirl51f`(`warehouse_id`) USING BTREE,
  CONSTRAINT `FK6gejeo0blhv0w0l7muisbaleo` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK9shk41f22ot7i9qjnliirl51f` FOREIGN KEY (`warehouse_id`) REFERENCES `t_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKm8vowq52uayijlnb5irp9wqpe` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产退料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_back
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_back_material_move_order
-- ----------------------------
DROP TABLE IF EXISTS `t_production_back_material_move_order`;
CREATE TABLE `t_production_back_material_move_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `back_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退料数量',
  `confirm_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认数量',
  `control_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管控类型',
  `material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '物料名称',
  `production_back_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3w93q11gxr8qny16bxx4ko8r8`(`material_id`) USING BTREE,
  INDEX `FKl0pbnqb1hgddgklhaxcqnbxo1`(`production_back_id`) USING BTREE,
  CONSTRAINT `FK3w93q11gxr8qny16bxx4ko8r8` FOREIGN KEY (`material_id`) REFERENCES `t_material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl0pbnqb1hgddgklhaxcqnbxo1` FOREIGN KEY (`production_back_id`) REFERENCES `t_production_back` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产退料物料移动单明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_back_material_move_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_cluster
-- ----------------------------
DROP TABLE IF EXISTS `t_production_cluster`;
CREATE TABLE `t_production_cluster`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品族编号',
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主材质',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品型号',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '产品族分类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7pm1tomvboq9wbqw7y6fdefbe`(`category_id`) USING BTREE,
  CONSTRAINT `FK7pm1tomvboq9wbqw7y6fdefbe` FOREIGN KEY (`category_id`) REFERENCES `t_production_cluster_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品族' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_cluster_category
-- ----------------------------
DROP TABLE IF EXISTS `t_production_cluster_category`;
CREATE TABLE `t_production_cluster_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级分类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1sfx05uk3lbdew7ymgx914lcl`(`parent_id`) USING BTREE,
  CONSTRAINT `FK1sfx05uk3lbdew7ymgx914lcl` FOREIGN KEY (`parent_id`) REFERENCES `t_production_cluster_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品族分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_cluster_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_line
-- ----------------------------
DROP TABLE IF EXISTS `t_production_line`;
CREATE TABLE `t_production_line`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产线编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产线名称',
  `standard_energy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标准产能',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `measure_unit_id` bigint(20) NULL DEFAULT NULL COMMENT '产能单位',
  `principal_id` bigint(20) NULL DEFAULT NULL COMMENT '责任人',
  `workshop_id` bigint(20) NULL DEFAULT NULL COMMENT '所属车间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKgl4nc3bk0hlbyyplcuh1vkuud`(`create_user_id`) USING BTREE,
  INDEX `FK3d9ixg1l8xn3r0jy39sny80le`(`update_user_id`) USING BTREE,
  INDEX `FKcgl9b8bq2xkx0mo4t66dduc8m`(`measure_unit_id`) USING BTREE,
  INDEX `FKieuohdud42amenlycrwjpjfds`(`principal_id`) USING BTREE,
  INDEX `FKp42owb2hxewcbwaplwxjg4n2c`(`workshop_id`) USING BTREE,
  CONSTRAINT `FK3d9ixg1l8xn3r0jy39sny80le` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcgl9b8bq2xkx0mo4t66dduc8m` FOREIGN KEY (`measure_unit_id`) REFERENCES `t_measure_unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKgl4nc3bk0hlbyyplcuh1vkuud` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKieuohdud42amenlycrwjpjfds` FOREIGN KEY (`principal_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKp42owb2hxewcbwaplwxjg4n2c` FOREIGN KEY (`workshop_id`) REFERENCES `t_workshop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产线建模' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_line
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_line_working_procedure
-- ----------------------------
DROP TABLE IF EXISTS `t_production_line_working_procedure`;
CREATE TABLE `t_production_line_working_procedure`  (
  `production_line_id` bigint(20) NOT NULL,
  `working_procedure_id` bigint(20) NOT NULL,
  INDEX `FK5mo76tmtcrw785bdxf13f82o`(`working_procedure_id`) USING BTREE,
  INDEX `FK65h4jfm9st1ip79a6wc5eudop`(`production_line_id`) USING BTREE,
  CONSTRAINT `FK5mo76tmtcrw785bdxf13f82o` FOREIGN KEY (`working_procedure_id`) REFERENCES `t_working_procedure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK65h4jfm9st1ip79a6wc5eudop` FOREIGN KEY (`production_line_id`) REFERENCES `t_production_line` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_line_working_procedure
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_picking
-- ----------------------------
DROP TABLE IF EXISTS `t_production_picking`;
CREATE TABLE `t_production_picking`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单号',
  `picking_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领料时间',
  `picking_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领料人',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '接收线边仓',
  `work_order_id` bigint(20) NULL DEFAULT NULL COMMENT '工单编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKc8doxmxs88ermk5aqcvnt5c6k`(`create_user_id`) USING BTREE,
  INDEX `FK45g1cfbtgf7xf39vdic6w4bts`(`update_user_id`) USING BTREE,
  INDEX `FK948k1hbui8nhbsdm5re4mtg6i`(`warehouse_id`) USING BTREE,
  INDEX `FKq7vwnqr4gu06pseummourxv9q`(`work_order_id`) USING BTREE,
  CONSTRAINT `FK45g1cfbtgf7xf39vdic6w4bts` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK948k1hbui8nhbsdm5re4mtg6i` FOREIGN KEY (`warehouse_id`) REFERENCES `t_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKc8doxmxs88ermk5aqcvnt5c6k` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKq7vwnqr4gu06pseummourxv9q` FOREIGN KEY (`work_order_id`) REFERENCES `t_work_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产领料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_picking
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_picking_material_move_order
-- ----------------------------
DROP TABLE IF EXISTS `t_production_picking_material_move_order`;
CREATE TABLE `t_production_picking_material_move_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实际数量',
  `control_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管控类型',
  `demand_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需求数量',
  `material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '物料名称',
  `production_picking_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKco4y20r5qrvf6eacatjed83dc`(`material_id`) USING BTREE,
  INDEX `FKi27nvn1seayli3cqw82lvem0b`(`production_picking_id`) USING BTREE,
  CONSTRAINT `FKco4y20r5qrvf6eacatjed83dc` FOREIGN KEY (`material_id`) REFERENCES `t_material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKi27nvn1seayli3cqw82lvem0b` FOREIGN KEY (`production_picking_id`) REFERENCES `t_production_picking` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产领料物料移动单明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_picking_material_move_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_production_plan`;
CREATE TABLE `t_production_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划编码',
  `finish_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完工数量',
  `plan_end_date` datetime(0) NULL DEFAULT NULL COMMENT '计划结束日期',
  `plan_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划数量',
  `plan_start_date` datetime(0) NULL DEFAULT NULL COMMENT '计划开始日期',
  `produce_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产数量',
  `product_name_id` bigint(20) NULL DEFAULT NULL COMMENT '产品选择',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKlx5lys025kail9r1wypyohbu1`(`product_name_id`) USING BTREE,
  CONSTRAINT `FKlx5lys025kail9r1wypyohbu1` FOREIGN KEY (`product_name_id`) REFERENCES `t_material_bom` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产计划' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_plan
-- ----------------------------

-- ----------------------------
-- Table structure for t_production_plan_split
-- ----------------------------
DROP TABLE IF EXISTS `t_production_plan_split`;
CREATE TABLE `t_production_plan_split`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `can_split_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可拆解数量',
  `plan_end_date` datetime(0) NULL DEFAULT NULL COMMENT '计划结束日期',
  `plan_start_date` datetime(0) NULL DEFAULT NULL COMMENT '计划开始日期',
  `priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优先级',
  `split_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拆解数量',
  `process_route_id` bigint(20) NULL DEFAULT NULL COMMENT '工艺路线',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKd14ttyfwur8qdgfywd9nlbeh1`(`process_route_id`) USING BTREE,
  CONSTRAINT `FKd14ttyfwur8qdgfywd9nlbeh1` FOREIGN KEY (`process_route_id`) REFERENCES `t_process_route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产计划拆解表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_production_plan_split
-- ----------------------------

-- ----------------------------
-- Table structure for t_quick_code
-- ----------------------------
DROP TABLE IF EXISTS `t_quick_code`;
CREATE TABLE `t_quick_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '快码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_quick_code
-- ----------------------------

-- ----------------------------
-- Table structure for t_shift
-- ----------------------------
DROP TABLE IF EXISTS `t_shift`;
CREATE TABLE `t_shift`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班制编码',
  `cross_day` bit(1) NULL DEFAULT NULL COMMENT '是否跨日',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班制名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班制' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shift
-- ----------------------------

-- ----------------------------
-- Table structure for t_shift_classes
-- ----------------------------
DROP TABLE IF EXISTS `t_shift_classes`;
CREATE TABLE `t_shift_classes`  (
  `shift_id` bigint(20) NOT NULL,
  `classes_id` bigint(20) NOT NULL,
  INDEX `FKi9by7u6plsb33o3csrfoe4b4g`(`classes_id`) USING BTREE,
  INDEX `FK628hls2rk1vitf3e4xyl74tsq`(`shift_id`) USING BTREE,
  CONSTRAINT `FK628hls2rk1vitf3e4xyl74tsq` FOREIGN KEY (`shift_id`) REFERENCES `t_shift` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKi9by7u6plsb33o3csrfoe4b4g` FOREIGN KEY (`classes_id`) REFERENCES `t_classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shift_classes
-- ----------------------------

-- ----------------------------
-- Table structure for t_simple
-- ----------------------------
DROP TABLE IF EXISTS `t_simple`;
CREATE TABLE `t_simple`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bool` bit(1) NULL DEFAULT NULL COMMENT '布尔',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `input` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文本',
  `number` float NULL DEFAULT NULL COMMENT '数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单的例子' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_simple
-- ----------------------------

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商编码',
  `link_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `linkman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for t_unit_framework
-- ----------------------------
DROP TABLE IF EXISTS `t_unit_framework`;
CREATE TABLE `t_unit_framework`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `resource` bit(1) NULL DEFAULT NULL COMMENT '是否资源',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父组织架构',
  `unit_level_id` bigint(20) NULL DEFAULT NULL COMMENT '层级名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKdy1je19y1ooiqsmagngxhfjs2`(`parent_id`) USING BTREE,
  INDEX `FKdapxv7lqvncay6923j24qq5xh`(`unit_level_id`) USING BTREE,
  CONSTRAINT `FKdapxv7lqvncay6923j24qq5xh` FOREIGN KEY (`unit_level_id`) REFERENCES `t_unit_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdy1je19y1ooiqsmagngxhfjs2` FOREIGN KEY (`parent_id`) REFERENCES `t_unit_framework` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织架构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_unit_framework
-- ----------------------------

-- ----------------------------
-- Table structure for t_unit_level
-- ----------------------------
DROP TABLE IF EXISTS `t_unit_level`;
CREATE TABLE `t_unit_level`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `resource` bit(1) NULL DEFAULT NULL COMMENT '是否资源',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK30smwpkxkko2f3rnva07426xt`(`parent_id`) USING BTREE,
  CONSTRAINT `FK30smwpkxkko2f3rnva07426xt` FOREIGN KEY (`parent_id`) REFERENCES `t_unit_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织层级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_unit_level
-- ----------------------------

-- ----------------------------
-- Table structure for t_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `t_warehouse`;
CREATE TABLE `t_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `principal_id` bigint(20) NULL DEFAULT NULL COMMENT '责任人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8gbutm8119pg7gvq0u53t8ep`(`create_user_id`) USING BTREE,
  INDEX `FK6dsvbygk8sx8auq22g1acfavm`(`update_user_id`) USING BTREE,
  INDEX `FKkhf8p2bb3i2j2j6bn7dvdtfmy`(`principal_id`) USING BTREE,
  CONSTRAINT `FK6dsvbygk8sx8auq22g1acfavm` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8gbutm8119pg7gvq0u53t8ep` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKkhf8p2bb3i2j2j6bn7dvdtfmy` FOREIGN KEY (`principal_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线边仓' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_warehouse
-- ----------------------------

-- ----------------------------
-- Table structure for t_warehouse_production_line
-- ----------------------------
DROP TABLE IF EXISTS `t_warehouse_production_line`;
CREATE TABLE `t_warehouse_production_line`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `production_line_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产线编码',
  `production_line_id` bigint(20) NULL DEFAULT NULL COMMENT '产线名称',
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK96pook3vglwcvxyx32umscev2`(`production_line_id`) USING BTREE,
  INDEX `FKd9g8yadb4al06qns7x3h8r5fg`(`warehouse_id`) USING BTREE,
  CONSTRAINT `FK96pook3vglwcvxyx32umscev2` FOREIGN KEY (`production_line_id`) REFERENCES `t_production_line` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKd9g8yadb4al06qns7x3h8r5fg` FOREIGN KEY (`warehouse_id`) REFERENCES `t_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线边仓关联产线明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_warehouse_production_line
-- ----------------------------

-- ----------------------------
-- Table structure for t_work_order
-- ----------------------------
DROP TABLE IF EXISTS `t_work_order`;
CREATE TABLE `t_work_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_date` datetime(0) NULL DEFAULT NULL COMMENT '实际结束日期',
  `actual_start_date` datetime(0) NULL DEFAULT NULL COMMENT '实际开始日期',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工单编码',
  `finish_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完工数量',
  `no_outsourcing` bit(1) NULL DEFAULT NULL COMMENT '委外状态',
  `plan_end_date` datetime(0) NULL DEFAULT NULL COMMENT '计划结束日期',
  `plan_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划数量',
  `plan_start_date` datetime(0) NULL DEFAULT NULL COMMENT '计划开始日期',
  `priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优先级',
  `schedule` bit(1) NULL DEFAULT NULL COMMENT '是否排程',
  `work_order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工单类型',
  `process_route_id` bigint(20) NULL DEFAULT NULL COMMENT '工艺路线',
  `product_name_id` bigint(20) NULL DEFAULT NULL COMMENT '产品选择',
  `production_plan_id` bigint(20) NULL DEFAULT NULL COMMENT '生产计划',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKdunu0ybnd6k7qsfplo1x5ap41`(`process_route_id`) USING BTREE,
  INDEX `FK77rha3dy7bu3oq4271rr2ny37`(`product_name_id`) USING BTREE,
  INDEX `FK3q2j3sanmsshhvq1v6y5adqsg`(`production_plan_id`) USING BTREE,
  CONSTRAINT `FK3q2j3sanmsshhvq1v6y5adqsg` FOREIGN KEY (`production_plan_id`) REFERENCES `t_production_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK77rha3dy7bu3oq4271rr2ny37` FOREIGN KEY (`product_name_id`) REFERENCES `t_material_bom` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdunu0ybnd6k7qsfplo1x5ap41` FOREIGN KEY (`process_route_id`) REFERENCES `t_process_route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产工单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_work_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_work_team
-- ----------------------------
DROP TABLE IF EXISTS `t_work_team`;
CREATE TABLE `t_work_team`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班组编码',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班组名称',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `workshop_id` bigint(20) NULL DEFAULT NULL COMMENT '所属车间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKrc4l777sqc9bcp1c6jj7p7xp5`(`create_user_id`) USING BTREE,
  INDEX `FK7jjqrtwhhl74bt1ntrvyfb43a`(`update_user_id`) USING BTREE,
  INDEX `FKbbxeju1a3l6y6q7ncg0f6j2a4`(`workshop_id`) USING BTREE,
  CONSTRAINT `FK7jjqrtwhhl74bt1ntrvyfb43a` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbbxeju1a3l6y6q7ncg0f6j2a4` FOREIGN KEY (`workshop_id`) REFERENCES `t_workshop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrc4l777sqc9bcp1c6jj7p7xp5` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_work_team
-- ----------------------------

-- ----------------------------
-- Table structure for t_work_team_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_work_team_employee`;
CREATE TABLE `t_work_team_employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `principal` bit(1) NULL DEFAULT NULL COMMENT '是否负责人',
  `employee_id` bigint(20) NULL DEFAULT NULL COMMENT '姓名',
  `work_team_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKnafmg9usbb8nga5g3ip8n6ayv`(`employee_id`) USING BTREE,
  INDEX `FKkbvcn0iqis2w0wev3e8mt7ndn`(`work_team_id`) USING BTREE,
  CONSTRAINT `FKkbvcn0iqis2w0wev3e8mt7ndn` FOREIGN KEY (`work_team_id`) REFERENCES `t_work_team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnafmg9usbb8nga5g3ip8n6ayv` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班组员工明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_work_team_employee
-- ----------------------------

-- ----------------------------
-- Table structure for t_working_center
-- ----------------------------
DROP TABLE IF EXISTS `t_working_center`;
CREATE TABLE `t_working_center`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `principal_id` bigint(20) NULL DEFAULT NULL COMMENT '责任人',
  `workshop_id` bigint(20) NULL DEFAULT NULL COMMENT '所属车间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKe6dvhcsokxiyg2j2r6pve30e1`(`principal_id`) USING BTREE,
  INDEX `FKnrblfrb1y0f84yp974yyllj2w`(`workshop_id`) USING BTREE,
  CONSTRAINT `FKe6dvhcsokxiyg2j2r6pve30e1` FOREIGN KEY (`principal_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnrblfrb1y0f84yp974yyllj2w` FOREIGN KEY (`workshop_id`) REFERENCES `t_workshop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_working_center
-- ----------------------------

-- ----------------------------
-- Table structure for t_working_center_device
-- ----------------------------
DROP TABLE IF EXISTS `t_working_center_device`;
CREATE TABLE `t_working_center_device`  (
  `working_center_id` bigint(20) NOT NULL,
  `device_id` bigint(20) NOT NULL,
  INDEX `FKgv4kn4rvl11w18r86rreq930y`(`device_id`) USING BTREE,
  INDEX `FKhadj9rjm3n5m2y0qp0vj9cyf7`(`working_center_id`) USING BTREE,
  CONSTRAINT `FKgv4kn4rvl11w18r86rreq930y` FOREIGN KEY (`device_id`) REFERENCES `t_device` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhadj9rjm3n5m2y0qp0vj9cyf7` FOREIGN KEY (`working_center_id`) REFERENCES `t_working_center` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_working_center_device
-- ----------------------------

-- ----------------------------
-- Table structure for t_working_center_working_procedure
-- ----------------------------
DROP TABLE IF EXISTS `t_working_center_working_procedure`;
CREATE TABLE `t_working_center_working_procedure`  (
  `working_center_id` bigint(20) NOT NULL,
  `working_procedure_id` bigint(20) NOT NULL,
  INDEX `FKnn17yjw4hbhqyf0ncohr6u00m`(`working_procedure_id`) USING BTREE,
  INDEX `FKn897lgd9cn03aicxh29tw5de5`(`working_center_id`) USING BTREE,
  CONSTRAINT `FKn897lgd9cn03aicxh29tw5de5` FOREIGN KEY (`working_center_id`) REFERENCES `t_working_center` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnn17yjw4hbhqyf0ncohr6u00m` FOREIGN KEY (`working_procedure_id`) REFERENCES `t_working_procedure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_working_center_working_procedure
-- ----------------------------

-- ----------------------------
-- Table structure for t_working_position_procedure
-- ----------------------------
DROP TABLE IF EXISTS `t_working_position_procedure`;
CREATE TABLE `t_working_position_procedure`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `procedure_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序编码',
  `working_procedure_id` bigint(20) NULL DEFAULT NULL COMMENT '工序名称',
  `working_section_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9jr0euvcxdfms3noplu9p24sd`(`working_procedure_id`) USING BTREE,
  INDEX `FK9a5kdx1wxrawl4quwshqqusm`(`working_section_id`) USING BTREE,
  CONSTRAINT `FK9a5kdx1wxrawl4quwshqqusm` FOREIGN KEY (`working_section_id`) REFERENCES `t_workshop_position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK9jr0euvcxdfms3noplu9p24sd` FOREIGN KEY (`working_procedure_id`) REFERENCES `t_working_procedure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工位关联工序明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_working_position_procedure
-- ----------------------------

-- ----------------------------
-- Table structure for t_working_procedure
-- ----------------------------
DROP TABLE IF EXISTS `t_working_procedure`;
CREATE TABLE `t_working_procedure`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工序' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_working_procedure
-- ----------------------------

-- ----------------------------
-- Table structure for t_working_section_procedure
-- ----------------------------
DROP TABLE IF EXISTS `t_working_section_procedure`;
CREATE TABLE `t_working_section_procedure`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `procedure_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序编码',
  `sort_no` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `working_procedure_id` bigint(20) NULL DEFAULT NULL COMMENT '工序名称',
  `working_section_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKaos86imsv24oqdy1faf7tjgt0`(`working_procedure_id`) USING BTREE,
  INDEX `FK2833upbpcpd59kf6mh87xl5y8`(`working_section_id`) USING BTREE,
  CONSTRAINT `FK2833upbpcpd59kf6mh87xl5y8` FOREIGN KEY (`working_section_id`) REFERENCES `t_workshop_section` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKaos86imsv24oqdy1faf7tjgt0` FOREIGN KEY (`working_procedure_id`) REFERENCES `t_working_procedure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工段关联工序明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_working_section_procedure
-- ----------------------------

-- ----------------------------
-- Table structure for t_workshop
-- ----------------------------
DROP TABLE IF EXISTS `t_workshop`;
CREATE TABLE `t_workshop`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车间编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车间名称',
  `calendar_id` bigint(20) NULL DEFAULT NULL COMMENT '工作日历',
  `principal_id` bigint(20) NULL DEFAULT NULL COMMENT '责任人',
  `shift_id` bigint(20) NULL DEFAULT NULL COMMENT '班制',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4n27uyrhf8g2vuht4deg1c0vx`(`calendar_id`) USING BTREE,
  INDEX `FKcqy4tot96mkaseflhi9m12y8f`(`principal_id`) USING BTREE,
  INDEX `FK5fpeo084rfrikroofys0pl5gp`(`shift_id`) USING BTREE,
  CONSTRAINT `FK4n27uyrhf8g2vuht4deg1c0vx` FOREIGN KEY (`calendar_id`) REFERENCES `t_calendar` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5fpeo084rfrikroofys0pl5gp` FOREIGN KEY (`shift_id`) REFERENCES `t_shift` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcqy4tot96mkaseflhi9m12y8f` FOREIGN KEY (`principal_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车间建模' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_workshop
-- ----------------------------

-- ----------------------------
-- Table structure for t_workshop_position
-- ----------------------------
DROP TABLE IF EXISTS `t_workshop_position`;
CREATE TABLE `t_workshop_position`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工位编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工位名称',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `production_line_id` bigint(20) NULL DEFAULT NULL COMMENT '所属产线',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKr1setaieyeavbfbqcvxpe6s12`(`create_user_id`) USING BTREE,
  INDEX `FKf0hw6qwor5udv6gfvrlandqrg`(`update_user_id`) USING BTREE,
  INDEX `FK4v1b1cpq142gajbka4by9d45r`(`production_line_id`) USING BTREE,
  CONSTRAINT `FK4v1b1cpq142gajbka4by9d45r` FOREIGN KEY (`production_line_id`) REFERENCES `t_production_line` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKf0hw6qwor5udv6gfvrlandqrg` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr1setaieyeavbfbqcvxpe6s12` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_workshop_position
-- ----------------------------

-- ----------------------------
-- Table structure for t_workshop_section
-- ----------------------------
DROP TABLE IF EXISTS `t_workshop_section`;
CREATE TABLE `t_workshop_section`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工段编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工段名称',
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `workshop_id` bigint(20) NULL DEFAULT NULL COMMENT '所属车间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKjaurs5hn98m3xagocdy2j5bdm`(`create_user_id`) USING BTREE,
  INDEX `FK8rfpulf7r2xus00rmuewpw0m8`(`update_user_id`) USING BTREE,
  INDEX `FKl88yts8fomtc1tr9okj1vxxia`(`workshop_id`) USING BTREE,
  CONSTRAINT `FK8rfpulf7r2xus00rmuewpw0m8` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKjaurs5hn98m3xagocdy2j5bdm` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl88yts8fomtc1tr9okj1vxxia` FOREIGN KEY (`workshop_id`) REFERENCES `t_workshop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_workshop_section
-- ----------------------------

-- ----------------------------
-- Table structure for v_workshop_receive
-- ----------------------------
-- 详见视图 SQL
-- ----------------------------
-- Records of v_workshop_receive
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
