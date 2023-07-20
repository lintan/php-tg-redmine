/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : tgbot

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 20/07/2023 09:30:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_extension_histories
-- ----------------------------
DROP TABLE IF EXISTS `admin_extension_histories`;
CREATE TABLE `admin_extension_histories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_extension_histories_name_index`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_extension_histories
-- ----------------------------

-- ----------------------------
-- Table structure for admin_extensions
-- ----------------------------
DROP TABLE IF EXISTS `admin_extensions`;
CREATE TABLE `admin_extensions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_extensions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_extensions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Index', 'feather icon-bar-chart-2', '/', '', 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, 'Admin', 'feather icon-settings', '', '', 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, 'Users', '', 'auth/users', '', 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, 'Roles', '', 'auth/roles', '', 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, 'Permission', '', 'auth/permissions', '', 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, 'Menu', '', 'auth/menu', '', 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, 'Extensions', '', 'auth/extensions', '', 1, '2023-04-27 01:59:46', NULL);

-- ----------------------------
-- Table structure for admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu`  (
  `permission_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_permission_menu_permission_id_menu_id_unique`(`permission_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'Auth management', 'auth-management', '', '', 1, 0, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Users', 'users', '', '/auth/users*', 2, 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Roles', 'roles', '', '/auth/roles*', 3, 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (4, 'Permissions', 'permissions', '', '/auth/permissions*', 4, 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Menu', 'menu', '', '/auth/menu*', 5, 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (6, 'Extension', 'extension', '', '/auth/extensions*', 6, 1, '2023-04-27 01:59:46', NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_menu_role_id_menu_id_unique`(`role_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_permissions_role_id_permission_id_unique`(`role_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_users_role_id_user_id_unique`(`role_id`, `user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, '2023-04-27 01:59:46', '2023-04-27 01:59:46');

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2023-04-27 01:59:46', '2023-04-27 01:59:46');

-- ----------------------------
-- Table structure for admin_settings
-- ----------------------------
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE `admin_settings`  (
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`slug`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_settings
-- ----------------------------

-- ----------------------------
-- Table structure for admin_test
-- ----------------------------
DROP TABLE IF EXISTS `admin_test`;
CREATE TABLE `admin_test`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `test` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_test
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$5gyfCp4E2yRDuCUOqSX7FOgpXaQ5QfwQyi98Dh9LAOxoASzFfXlHe', 'Administrator', NULL, NULL, '2023-04-27 01:59:46', '2023-04-27 01:59:46');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` bigint(16) NULL DEFAULT NULL COMMENT '群组id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '状态',
  `service_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客服链接',
  `recharge_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '充值链接',
  `channel_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '频道链接',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, -1001909275918, '测试', 1, 'https://t.me/cody0512', 'https://t.me/cody0512', 'https://t.me/codychannel123', NULL, '2023-07-17 16:10:58');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '配置key',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '配置值',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `group_id` bigint(16) NULL DEFAULT NULL COMMENT '群组id',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx`(`group_id`, `name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'lucky_num', '3', NULL, NULL, -1001909275918, 1, '发包数量');
INSERT INTO `config` VALUES (5, 'platform_commission', '5', '2023-07-17 17:39:57', '2023-07-17 17:39:57', -1001909275918, 1, '5%');
INSERT INTO `config` VALUES (3, 'lose_rate', '1.8', NULL, NULL, -1001909275918, 1, '中雷赔付倍数');
INSERT INTO `config` VALUES (4, 'valid_time', '60', NULL, NULL, -1001909275918, 1, '红包过期时间');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for lucky_history
-- ----------------------------
DROP TABLE IF EXISTS `lucky_history`;
CREATE TABLE `lucky_history`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(16) NULL DEFAULT NULL COMMENT '领取用户id',
  `lucky_id` int(10) NULL DEFAULT NULL COMMENT '红包id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_thunder` tinyint(2) NULL DEFAULT NULL COMMENT '是否中雷',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '领取金额',
  `lose_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '损失金额',
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lucky_id_idx`(`lucky_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lucky_history
-- ----------------------------
INSERT INTO `lucky_history` VALUES (24, 169759671, 24, '2023-05-06 18:21:50', '2023-05-06 18:21:50', 1, 5.52, 18.00, 'Lee');
INSERT INTO `lucky_history` VALUES (25, 861921942, 24, '2023-05-06 18:22:23', '2023-05-06 18:22:23', 0, 3.80, 0.00, 'MadHrose');
INSERT INTO `lucky_history` VALUES (30, 5050084802, 24, '2023-05-06 18:36:25', '2023-05-06 18:36:25', 0, 0.68, 0.00, '妖');
INSERT INTO `lucky_history` VALUES (31, 5050084802, 25, '2023-05-06 19:10:59', '2023-05-06 19:10:59', 0, 0.77, 0.00, '妖');
INSERT INTO `lucky_history` VALUES (32, 5050084802, 26, '2023-05-08 10:37:34', '2023-05-08 10:37:34', 0, 4.55, 0.00, '妖');
INSERT INTO `lucky_history` VALUES (33, 2112707429, 26, '2023-05-08 10:38:05', '2023-05-08 10:38:05', 0, 3.75, 0.00, '珠宝');
INSERT INTO `lucky_history` VALUES (34, 2084547410, 26, '2023-05-08 10:38:28', '2023-05-08 10:38:28', 0, 1.70, 0.00, '游荡');
INSERT INTO `lucky_history` VALUES (35, 2084547410, 27, '2023-05-08 11:02:14', '2023-05-08 11:02:14', 1, 5.62, 18.00, '游荡');
INSERT INTO `lucky_history` VALUES (36, 2112707429, 27, '2023-05-08 11:02:38', '2023-05-08 11:02:38', 1, 0.22, 18.00, '珠宝');
INSERT INTO `lucky_history` VALUES (37, 5050084802, 27, '2023-05-08 11:03:02', '2023-05-08 11:03:02', 0, 4.16, 0.00, '妖');
INSERT INTO `lucky_history` VALUES (38, 5050084802, 28, '2023-05-08 11:31:47', '2023-05-08 11:31:47', 1, 4.81, 18.00, '妖');
INSERT INTO `lucky_history` VALUES (39, 2112707429, 28, '2023-05-08 11:32:18', '2023-05-08 11:32:18', 0, 4.68, 0.00, '珠宝');
INSERT INTO `lucky_history` VALUES (40, 2084547410, 28, '2023-05-08 11:32:37', '2023-05-08 11:32:37', 1, 0.51, 18.00, '游荡');
INSERT INTO `lucky_history` VALUES (41, 2084547410, 29, '2023-05-08 11:37:52', '2023-05-08 11:37:52', 0, 0.45, 0.00, '游荡');
INSERT INTO `lucky_history` VALUES (42, 2112707429, 29, '2023-05-08 11:38:10', '2023-05-08 11:38:10', 0, 5.60, 0.00, '珠宝');
INSERT INTO `lucky_history` VALUES (43, 5050084802, 29, '2023-05-08 11:38:29', '2023-05-08 11:38:29', 0, 3.95, 0.00, '妖');
INSERT INTO `lucky_history` VALUES (44, 5050084802, 30, '2023-05-08 11:47:51', '2023-05-08 11:47:51', 0, 0.28, 0.00, '妖');
INSERT INTO `lucky_history` VALUES (45, 2112707429, 30, '2023-05-08 11:48:08', '2023-05-08 11:48:08', 0, 5.47, 0.00, '珠宝');
INSERT INTO `lucky_history` VALUES (46, 2084547410, 30, '2023-05-08 11:48:29', '2023-05-08 11:48:29', 0, 4.25, 0.00, '游荡');
INSERT INTO `lucky_history` VALUES (47, 2084547410, 31, '2023-05-08 15:09:45', '2023-05-08 15:09:45', 0, 3.66, 0.00, '游荡');
INSERT INTO `lucky_history` VALUES (48, 2112707429, 31, '2023-05-08 15:13:52', '2023-05-08 15:13:52', 0, 2.92, 0.00, '珠宝');
INSERT INTO `lucky_history` VALUES (49, 169759671, 31, '2023-05-08 15:14:06', '2023-05-08 15:14:06', 0, 2.42, 0.00, 'Lee');
INSERT INTO `lucky_history` VALUES (50, 2112707429, 33, '2023-05-08 15:23:20', '2023-05-08 15:23:20', 0, 6.06, 0.00, '珠宝');
INSERT INTO `lucky_history` VALUES (51, 169759671, 33, '2023-05-08 15:23:26', '2023-05-08 15:23:26', 0, 2.78, 0.00, 'Lee');
INSERT INTO `lucky_history` VALUES (52, 861921942, 33, '2023-05-08 15:23:41', '2023-05-08 15:23:41', 0, 1.16, 0.00, 'MadHrose');
INSERT INTO `lucky_history` VALUES (53, 2084547410, 37, '2023-05-08 17:44:29', '2023-05-08 17:44:29', 0, 0.84, 0.00, '游荡');
INSERT INTO `lucky_history` VALUES (54, 861921942, 37, '2023-05-08 17:44:35', '2023-05-08 17:44:35', 1, 4.52, 18.00, 'MadHrose');
INSERT INTO `lucky_history` VALUES (55, 2112707429, 37, '2023-05-08 17:44:46', '2023-05-08 17:44:46', 0, 4.64, 0.00, '珠宝');
INSERT INTO `lucky_history` VALUES (56, 5050084802, 36, '2023-05-08 17:45:28', '2023-05-08 17:45:28', 0, 5.86, 0.00, '妖');
INSERT INTO `lucky_history` VALUES (57, 2112707429, 36, '2023-05-08 17:45:35', '2023-05-08 17:45:35', 0, 1.69, 0.00, '珠宝');
INSERT INTO `lucky_history` VALUES (58, 861921942, 36, '2023-05-08 17:45:45', '2023-05-08 17:45:45', 0, 2.45, 0.00, 'MadHrose');
INSERT INTO `lucky_history` VALUES (59, 2084547410, 44, '2023-05-09 16:48:42', '2023-05-09 16:48:42', 0, 12.62, 0.00, '游荡');
INSERT INTO `lucky_history` VALUES (60, 5050084802, 44, '2023-05-09 16:48:50', '2023-05-09 16:48:50', 0, 1.96, 0.00, '妖');
INSERT INTO `lucky_history` VALUES (61, 169759671, 44, '2023-05-09 16:48:55', '2023-05-09 16:48:55', 0, 5.42, 0.00, 'Lee');

-- ----------------------------
-- Table structure for lucky_money
-- ----------------------------
DROP TABLE IF EXISTS `lucky_money`;
CREATE TABLE `lucky_money`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(16) NULL DEFAULT NULL COMMENT '发送用户id',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '红包金额',
  `received` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '被领取金额',
  `number` int(3) NULL DEFAULT NULL COMMENT '红包个数',
  `lucky` tinyint(2) NULL DEFAULT NULL COMMENT '是否随机',
  `thunder` int(11) NULL DEFAULT NULL COMMENT '雷',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `chat_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '群组id',
  `red_list` json NULL COMMENT '红包数组',
  `sender_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `lose_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '红包倍数',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态:1=正常;2=已领完;3=已过期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lucky_money
-- ----------------------------
INSERT INTO `lucky_money` VALUES (24, 1838650949, 10.00, 10.00, 3, 1, 2, '2023-05-06 18:21:28', '2023-05-08 18:19:40', '-821134288', '[5.52, 3.8, 0.68]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (25, 1838650949, 10.00, 10.00, 3, 1, 2, '2023-05-06 19:10:53', '2023-05-08 18:19:42', '-821134288', '[0.77, 6.37, 2.86]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (26, 1838650949, 10.00, 10.00, 3, 1, 1, '2023-05-08 10:37:19', '2023-05-08 18:19:43', '-821134288', '[4.55, 3.75, 1.7]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (27, 1838650949, 10.00, 10.00, 3, 1, 2, '2023-05-08 11:02:03', '2023-05-08 18:17:25', '-821134288', '[5.62, 0.22, 4.16]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (28, 1838650949, 10.00, 10.00, 3, 1, 1, '2023-05-08 11:31:17', '2023-05-08 18:17:26', '-821134288', '[4.81, 4.68, 0.51]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (29, 1838650949, 10.00, 10.00, 3, 1, 2, '2023-05-08 11:37:39', '2023-05-08 18:17:27', '-821134288', '[0.45, 5.6, 3.95]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (30, 1838650949, 10.00, 10.00, 3, 1, 2, '2023-05-08 11:47:36', '2023-05-08 18:17:29', '-821134288', '[0.28, 5.47, 4.25]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (31, 1838650949, 9.00, 9.00, 3, 1, 9, '2023-05-08 15:04:44', '2023-05-08 18:17:30', '-821134288', '[3.66, 2.92, 2.42]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (32, 1838650949, 10.00, 0.00, 3, 1, 2, '2023-05-08 15:22:56', '2023-05-08 18:30:35', '-821134288', '[3.86, 2.29, 3.85]', 'Cody', 1.80, 3);
INSERT INTO `lucky_money` VALUES (33, 1838650949, 10.00, 10.00, 3, 1, 2, '2023-05-08 15:23:12', '2023-05-08 18:17:33', '-821134288', '[6.06, 2.78, 1.16]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (34, 1838650949, 10.00, 0.00, 3, 1, 2, '2023-05-08 16:46:49', '2023-05-08 18:30:36', '-821134288', '[4.13, 3.66, 2.21]', 'Cody', 1.80, 3);
INSERT INTO `lucky_money` VALUES (35, 1838650949, 10.00, 0.00, 3, 1, 2, '2023-05-08 16:47:39', '2023-05-08 18:30:38', '-821134288', '[1.67, 2.23, 6.1]', 'Cody', 1.80, 3);
INSERT INTO `lucky_money` VALUES (36, 1838650949, 10.00, 10.00, 3, 1, 2, '2023-05-08 16:48:53', '2023-05-08 18:17:37', '-821134288', '[5.86, 1.69, 2.45]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (37, 1838650949, 10.00, 10.00, 3, 1, 2, '2023-05-08 16:55:16', '2023-05-08 18:17:39', '-821134288', '[0.84, 4.52, 4.64]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (38, 1838650949, 10.00, 0.00, 6, 1, 2, '2023-05-09 16:26:51', '2023-05-09 16:26:51', '-1001909275918', '[2.97, 1.49, 1.42, 2.95, 0.77, 0.4]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (39, 1838650949, 10.00, 0.00, 3, 1, 2, '2023-05-09 16:27:22', '2023-05-09 16:27:22', '-1001909275918', '[0.11, 3.29, 6.6]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (40, 1838650949, 10.00, 0.00, 3, 1, 2, '2023-05-09 16:43:10', '2023-05-09 16:43:10', '-1001909275918', '[3.04, 5.69, 1.27]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (41, 1838650949, 10.00, 0.00, 3, 1, 2, '2023-05-09 16:46:50', '2023-05-09 16:46:50', '-1001909275918', '[3.77, 5.77, 0.46]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (42, 1838650949, 10.00, 0.00, 3, 1, 2, '2023-05-09 16:46:55', '2023-05-09 16:46:55', '-1001909275918', '[2.08, 1.35, 6.57]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (43, 1838650949, 10.00, 0.00, 3, 1, 3, '2023-05-09 16:47:43', '2023-05-09 16:47:43', '-1001909275918', '[0.59, 3.36, 6.05]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (44, 1838650949, 20.00, 20.00, 3, 1, 3, '2023-05-09 16:48:37', '2023-05-09 16:48:55', '-1001909275918', '[12.62, 1.96, 5.42]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (45, 1838650949, 10.00, 0.00, 3, 1, 2, '2023-05-09 17:43:54', '2023-05-09 17:43:54', '-1001909275918', '[1.84, 6.22, 1.94]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (46, 1838650949, 10.00, 0.00, 3, 1, 2, '2023-05-09 17:43:57', '2023-05-09 17:43:57', '-1001909275918', '[2.04, 2.32, 5.64]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (47, 1838650949, 10.00, 0.00, 3, 1, 4, '2023-05-09 17:45:44', '2023-05-09 17:45:44', '-1001909275918', '[4.22, 2.25, 3.53]', 'Cody', 1.80, 1);
INSERT INTO `lucky_money` VALUES (48, 1838650949, 10.00, 0.00, 3, 1, 3, '2023-05-09 17:47:11', '2023-05-09 17:47:11', '-1001909275918', '[0.62, 4.41, 4.97]', 'Cody', 1.80, 1);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_09_07_090635_create_admin_settings_table', 1);
INSERT INTO `migrations` VALUES (7, '2020_09_22_015815_create_admin_extensions_table', 1);
INSERT INTO `migrations` VALUES (8, '2020_11_01_083237_update_admin_menu_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for tg_users
-- ----------------------------
DROP TABLE IF EXISTS `tg_users`;
CREATE TABLE `tg_users`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `first_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `tg_id` bigint(16) NULL DEFAULT NULL COMMENT 'tgId',
  `balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态:1=正常;0=离开',
  `invite_user` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邀请人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tg_id_idx`(`tg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tg_users
-- ----------------------------
INSERT INTO `tg_users` VALUES (1, 'lee520', '2023-05-05 14:09:32', '2023-07-17 16:02:08', 'Lee', 169759671, 95.59, 1, '1838650949');
INSERT INTO `tg_users` VALUES (2, 'jemechen', '2023-05-05 14:10:42', '2023-05-08 17:45:45', 'MadHrose', 861921942, 71.41, 1, '1838650949');
INSERT INTO `tg_users` VALUES (3, 'cody0512', '2023-05-05 14:10:42', '2023-05-09 17:47:11', 'Cody', 1838650949, 748.18, 1, NULL);
INSERT INTO `tg_users` VALUES (4, 'titigi168', '2023-05-06 11:14:30', '2023-05-06 17:38:31', '米蔻', 2057075744, 996.79, 1, '1838650949');
INSERT INTO `tg_users` VALUES (5, 'SV_a3322', '2023-05-06 16:36:51', '2023-05-09 16:48:42', '游荡', 2084547410, 91.19, 1, '1838650949');
INSERT INTO `tg_users` VALUES (6, 'zhubao588', '2023-05-06 16:37:17', '2023-05-08 17:45:35', '珠宝', 2112707429, 102.62, 1, '1838650949');
INSERT INTO `tg_users` VALUES (7, 'yaoyueaa', '2023-05-06 16:42:31', '2023-05-09 16:48:50', '妖', 5050084802, 89.22, 1, '1838650949');
INSERT INTO `tg_users` VALUES (8, 'yeahyou1995', '2023-05-07 08:18:14', '2023-05-08 11:48:17', 'You', 1765517747, 0.00, 0, '1765517747');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
