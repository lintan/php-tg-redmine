/*
 Navicat MySQL Data Transfer

 Source Server         : hk103.19.190.65
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40-log)
 Source Host           : 103.19.190.65:3306
 Source Schema         : demo_tgbot_cyou

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40-log)
 File Encoding         : 65001

 Date: 24/10/2023 11:42:08
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `admin_menu` VALUES (8, 0, 8, '红包雷管理', 'fa-codepen', NULL, '', 1, '2023-10-24 11:26:05', '2023-10-24 11:26:05');
INSERT INTO `admin_menu` VALUES (9, 8, 9, '红包配置', 'fa-wrench', 'configs', '', 1, '2023-10-24 11:27:33', '2023-10-24 11:27:33');
INSERT INTO `admin_menu` VALUES (10, 8, 10, '群组管理', 'fa-group', 'groups', '', 1, '2023-10-24 11:27:59', '2023-10-24 11:27:59');
INSERT INTO `admin_menu` VALUES (11, 8, 11, '用户管理', 'fa-user-o', 'tgusers', '', 1, '2023-10-24 11:28:29', '2023-10-24 11:28:29');
INSERT INTO `admin_menu` VALUES (12, 8, 12, '红包管理', 'fa-shopping-cart', 'luckmoney', '', 1, '2023-10-24 11:28:54', '2023-10-24 11:28:54');
INSERT INTO `admin_menu` VALUES (13, 0, 13, 'Operation Log', '', 'auth/operation-logs', 'dcat-admin.operation-log', 1, '2023-10-25 10:25:48', '2023-10-25 10:25:48');


-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1583 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------
INSERT INTO `admin_permission_menu` VALUES (7, 8, '2023-10-24 11:33:05', '2023-10-24 11:33:05');
INSERT INTO `admin_permission_menu` VALUES (8, 9, '2023-10-24 11:33:59', '2023-10-24 11:33:59');
INSERT INTO `admin_permission_menu` VALUES (9, 10, '2023-10-24 11:34:37', '2023-10-24 11:34:37');
INSERT INTO `admin_permission_menu` VALUES (10, 11, '2023-10-24 11:36:07', '2023-10-24 11:36:07');
INSERT INTO `admin_permission_menu` VALUES (11, 12, '2023-10-24 11:36:35', '2023-10-24 11:36:35');

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
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'Auth management', 'auth-management', '', '', 1, 0, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Users', 'users', '', '/auth/users*', 2, 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Roles', 'roles', '', '/auth/roles*', 3, 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (4, 'Permissions', 'permissions', '', '/auth/permissions*', 4, 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Menu', 'menu', '', '/auth/menu*', 5, 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (6, 'Extension', 'extension', '', '/auth/extensions*', 6, 1, '2023-04-27 01:59:46', NULL);
INSERT INTO `admin_permissions` VALUES (7, '红包雷管理', 'redmanage', '', '', 7, 0, '2023-10-24 11:33:05', '2023-10-24 11:33:05');
INSERT INTO `admin_permissions` VALUES (8, '红包配置', 'conifg', '', '/configs*', 8, 7, '2023-10-24 11:33:59', '2023-10-24 11:33:59');
INSERT INTO `admin_permissions` VALUES (9, '群组管理', 'groups', '', '/groups*', 9, 7, '2023-10-24 11:34:37', '2023-10-24 11:34:37');
INSERT INTO `admin_permissions` VALUES (10, '用户管理', 'tgusers', '', '/tgusers*', 10, 7, '2023-10-24 11:36:07', '2023-10-24 11:36:14');
INSERT INTO `admin_permissions` VALUES (11, '红包管理', 'luckmoney', '', '/luckmoney*', 11, 7, '2023-10-24 11:36:35', '2023-10-24 11:36:45');
INSERT INTO `admin_permissions` VALUES (12, '群组编辑', 'group_edit', 'GET', '/groups/*/edit', 12, 9, '2023-10-25 10:19:02', '2023-10-25 10:19:02');
INSERT INTO `admin_permissions` VALUES (13, '群组更新', 'group_update', 'POST,PUT,PATCH', '/groups/*', 13, 9, '2023-10-25 10:19:53', '2023-10-25 10:19:53');
INSERT INTO `admin_permissions` VALUES (14, '新增群组', 'group_add', 'GET', '/groups/create', 14, 9, '2023-10-25 10:20:24', '2023-10-25 10:20:24');
INSERT INTO `admin_permissions` VALUES (15, '群组保存', 'group_save', 'POST', '/groups', 15, 9, '2023-10-25 10:21:01', '2023-10-25 10:21:01');
INSERT INTO `admin_permissions` VALUES (16, '群组列表', 'group_list', 'GET', '/groups', 16, 9, '2023-10-25 10:21:50', '2023-10-25 10:22:01');
INSERT INTO `admin_permissions` VALUES (17, '删除群组', 'group_del', 'DELETE', '/groups/*', 17, 9, '2023-10-25 10:23:48', '2023-10-25 10:23:48');

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (2, 8, '2023-10-24 11:37:02', '2023-10-24 11:37:02');
INSERT INTO `admin_role_menu` VALUES (2, 9, '2023-10-24 11:37:02', '2023-10-24 11:37:02');
INSERT INTO `admin_role_menu` VALUES (2, 10, '2023-10-24 11:37:02', '2023-10-24 11:37:02');
INSERT INTO `admin_role_menu` VALUES (2, 11, '2023-10-24 11:37:02', '2023-10-24 11:37:02');
INSERT INTO `admin_role_menu` VALUES (2, 12, '2023-10-24 11:37:02', '2023-10-24 11:37:02');
INSERT INTO `admin_role_menu` VALUES (1, 1, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 2, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 3, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 4, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 5, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 6, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 7, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 8, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 9, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 10, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 11, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_menu` VALUES (1, 12, '2023-10-24 11:37:16', '2023-10-24 11:37:16');

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (2, 8, '2023-10-24 11:37:02', '2023-10-24 11:37:02');
INSERT INTO `admin_role_permissions` VALUES (2, 9, '2023-10-24 11:37:02', '2023-10-24 11:37:02');
INSERT INTO `admin_role_permissions` VALUES (2, 10, '2023-10-24 11:37:02', '2023-10-24 11:37:02');
INSERT INTO `admin_role_permissions` VALUES (2, 11, '2023-10-24 11:37:02', '2023-10-24 11:37:02');
INSERT INTO `admin_role_permissions` VALUES (1, 2, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_permissions` VALUES (1, 3, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_permissions` VALUES (1, 4, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_permissions` VALUES (1, 5, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_permissions` VALUES (1, 6, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_permissions` VALUES (1, 8, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_permissions` VALUES (1, 9, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_permissions` VALUES (1, 10, '2023-10-24 11:37:16', '2023-10-24 11:37:16');
INSERT INTO `admin_role_permissions` VALUES (1, 11, '2023-10-24 11:37:16', '2023-10-24 11:37:16');

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, '2023-04-27 01:59:46', '2023-04-27 01:59:46');
INSERT INTO `admin_role_users` VALUES (2, 2, '2023-10-24 11:21:25', '2023-10-24 11:21:25');

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
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2023-04-27 01:59:46', '2023-04-27 01:59:46');
INSERT INTO `admin_roles` VALUES (2, 'test', 'test', '2023-10-24 11:21:03', '2023-10-24 11:21:03');

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$4MWS4Hh4mUJqrB8sCh8tWeUiSNVWY7bK/TXBCJTC11o7Sw.isodTm', 'Administrator', NULL, NULL, '2023-04-27 01:59:46', '2023-10-24 11:38:53');
INSERT INTO `admin_users` VALUES (2, 'test', '$2y$10$oPX26Q7pAkXuV0eoV9ZXZuaD9/OF5h52AZWFX9/rFPop0eKCDCn0K', 'test', NULL, NULL, '2023-10-24 11:20:48', '2023-10-24 11:20:48');

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
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lucky_history
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lucky_money
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `tg_users` VALUES (8, 'yeahyou1995', '2023-05-07 08:18:14', '2023-10-24 11:37:59', 'You', 1765517747, 10.00, 1, '1765517747');

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
