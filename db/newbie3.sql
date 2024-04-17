/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : newbie3

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 16/04/2024 23:51:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门名称',
  `dept_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门编码',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父级id',
  `ancestors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '祖级列表',
  `sort` int NULL DEFAULT 1 COMMENT '显示顺序',
  `leader` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `tier` int NULL DEFAULT NULL COMMENT '层级',
  `home_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首页路由地址',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 296 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (270, '公司总部', NULL, 0, '270', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 1, NULL, '描述信息', 'admin', '2023-11-28 19:42:59', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (271, '山东分公司', NULL, 270, '270,271', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:43:42', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (272, '河南分公司', NULL, 270, '270,272', 2, '李四', '13566666666', 'lisi@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:46:35', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (273, '云南分公司', NULL, 270, '270,273', 3, '王五', '13566666666', 'wangwu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:00', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (274, '河北分公司', NULL, 270, '270,274', 4, '赵六', '13599999999', 'zhaoliu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:55', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (275, '东营分部', NULL, 271, '270,271,275', 2, '悟空', '13234435454', 'wukong@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:53:38', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (276, '济南分部', NULL, 271, '270,271,276', 1, '八戒', '15543547357', 'bajie@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:55:25', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (277, '昆明分部', NULL, 273, '270,273,277', 1, '三藏', '16546273436', 'sanzang@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:56:21', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (278, '济宁分部', NULL, 271, '270,271,278', 4, '阿虎', '16323242332', 'ahu@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:57:47', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (279, '菏泽分部', NULL, 271, '270,271,279', 5, '石头', '16767466463', 'shitou@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:58:35', 'admin', '2023-11-28 20:57:50');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `label` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '值',
  `type_id` bigint NULL DEFAULT NULL COMMENT '字典类型ID',
  `ele_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '元素类型',
  `ele_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '元素样式类名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（1正常 0禁用）',
  `def` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '默认，Y/N',
  `sort` int NULL DEFAULT 0 COMMENT '排序字段',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (16, '女', '0', 33, 'danger', NULL, '1', 'N', 1, '', NULL, '2024-02-21 17:10:58', NULL, '2024-03-09 22:38:57');
INSERT INTO `sys_dict_data` VALUES (19, '男', '1', 33, 'primary', NULL, '1', 'N', 2, '', NULL, '2024-03-09 13:28:37', NULL, '2024-03-09 23:16:49');
INSERT INTO `sys_dict_data` VALUES (20, '正常', '1', 35, 'primary', NULL, '1', 'Y', 1, '', NULL, '2024-03-09 21:02:49', NULL, '2024-03-09 23:16:45');
INSERT INTO `sys_dict_data` VALUES (21, '锁定', '0', 35, 'info', NULL, '1', 'N', 2, '', NULL, '2024-03-09 21:02:59', NULL, '2024-03-09 22:36:03');
INSERT INTO `sys_dict_data` VALUES (22, '正常', '1', 37, 'primary', 'status-enable status-box', '1', 'Y', 1, '', NULL, '2024-03-09 21:34:07', NULL, '2024-03-21 18:14:12');
INSERT INTO `sys_dict_data` VALUES (23, '禁用', '0', 37, 'info', 'status-disabled status-box', '1', 'N', 2, '', NULL, '2024-03-09 21:34:15', NULL, '2024-03-21 18:14:12');
INSERT INTO `sys_dict_data` VALUES (25, '未知', '2', 33, 'warning', NULL, '1', 'Y', 3, '', NULL, '2024-03-09 22:24:30', NULL, '2024-03-09 22:37:53');
INSERT INTO `sys_dict_data` VALUES (26, 'primary', 'primary', 38, 'primary', '', '1', 'Y', 1, '', NULL, '2024-03-09 22:53:21', NULL, '2024-03-09 23:17:24');
INSERT INTO `sys_dict_data` VALUES (27, 'success', 'success', 38, 'success', '', '1', 'N', 2, '', NULL, '2024-03-09 22:53:30', NULL, '2024-03-09 23:17:28');
INSERT INTO `sys_dict_data` VALUES (28, 'info', 'info', 38, 'info', '', '1', 'N', 3, '', NULL, '2024-03-09 22:53:39', NULL, '2024-03-09 23:17:33');
INSERT INTO `sys_dict_data` VALUES (29, 'warning', 'warning', 38, 'warning', '', '1', 'N', 4, '', NULL, '2024-03-09 22:53:46', NULL, '2024-03-09 23:17:36');
INSERT INTO `sys_dict_data` VALUES (30, 'danger', 'danger', 38, 'danger', '', '1', 'N', 5, '', NULL, '2024-03-09 22:53:54', NULL, '2024-03-09 23:17:40');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型名称',
  `type_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型编码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（1正常 0禁用）',
  `sort` int NULL DEFAULT 0 COMMENT '排序字段',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_code`(`type_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (33, '用户性别', 'userGender', '1', 2, '', 'admin', '2024-02-21 17:10:39', 'admin', '2024-03-09 22:03:41');
INSERT INTO `sys_dict_type` VALUES (35, '用户状态', 'userStatus', '1', 3, '', 'admin', '2024-03-09 21:02:27', 'admin', '2024-03-09 22:50:28');
INSERT INTO `sys_dict_type` VALUES (37, '通用状态', 'commonStatus', '1', 1, '通用状态', 'admin', '2024-03-09 21:32:14', 'admin', '2024-03-09 22:50:23');
INSERT INTO `sys_dict_type` VALUES (38, '元素类型', 'eleType', '1', 4, '元素类型', 'admin', '2024-03-09 22:52:58', 'admin', '2024-03-10 13:41:31');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作者',
  `res_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '响应状态，1 正常，0异常',
  `err_msg` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '异常消息',
  `from_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `target_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求地址',
  `target_fun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行的类方法',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '消耗时长，毫秒',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单标题',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `sort` int NULL DEFAULT 1 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '菜单状态（1正常 0停用）',
  `route_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `route_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由name',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `keep` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否缓存组件（1缓存 0不缓存）',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '菜单类型（1菜单 0按钮）',
  `hide` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否隐藏菜单（1是 0否 ）',
  `perm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `hide_children` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否隐藏子级菜单（1是 0否）',
  `iframe_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内嵌外链接地址',
  `outer` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否在layout外显示（1是 0否）',
  `transition` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '切换动画',
  `fixed_tab` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否固定在tabs（1是 0否）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3022 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2008, '系统管理', 0, 2, '1', '/system', 'System', '', NULL, 'admin', '2023-02-26 01:31:55', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys', 'TdesignSystemSetting', '0', '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2009, '用户管理', 2008, 1, '1', '/system/user', 'User', 'system/user/index', NULL, 'admin', '2023-02-26 01:49:34', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys:user', 'MaterialSymbolsManageAccountsOutlineRounded', '0', '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2010, '角色管理', 2008, 2, '1', '/syste/role', 'Role', 'system/role/index', NULL, 'admin', '2023-02-26 02:31:10', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys:role', 'CarbonUserRole', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (2013, '菜单管理', 2008, 3, '1', '/system/menu', 'Menu', 'system/menu/index', NULL, 'admin', '2023-02-26 23:11:00', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys:menu', 'FluentTextBulletListTree16Regular', '0', '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2042, '首页', 0, 0, '1', '/home', '', 'home/index', '', 'admin', '2023-07-31 05:37:08', 'admin', '2023-11-28 20:58:16', '0', '1', '0', '', 'ep:home-filled', '0', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (2047, '接口文档', 2072, 99, '1', 'http://127.0.0.1:8099/swagger-ui/index.html', 'BackendDoc', '', '', 'admin', '2023-08-01 03:52:39', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'app:api:docs', 'ep:document', '0', '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2050, '新增', 2013, 0, '1', NULL, NULL, NULL, '菜单新增按钮', 'admin', '2023-08-27 15:54:22', 'admin', '2023-11-28 20:58:16', '0', '0', '0', 'sys:menu:add', NULL, NULL, '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2051, '编辑', 2013, 1, '1', NULL, NULL, NULL, '菜单编辑按钮', 'admin', '2023-08-27 15:54:58', 'admin', '2023-11-28 20:58:16', '0', '0', '0', 'sys:menu:edit', NULL, NULL, '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2052, '删除', 2013, 2, '1', NULL, NULL, NULL, '菜单删除按钮', 'admin', '2023-08-27 15:55:21', 'admin', '2023-11-28 20:58:16', '0', '0', '0', 'sys:menu:del', NULL, NULL, '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2069, '前端文档', 2072, 98, '1', 'https://zhang-yuge668.gitee.io/preview/five-admin-v2-docs/', '', '', '', 'admin', '2023-11-10 15:03:57', 'admin', '2023-11-28 20:58:16', '0', '1', '0', '', 'ep:document', '0', '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2071, '部门管理', 2008, 6, '1', '/system/dept', 'Dept', 'system/dept/index', '', 'admin', '2023-11-18 22:46:58', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys:dept', 'MingcuteDepartmentLine', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (2072, '文档', 0, 22, '1', '/docs', '', '', '', 'admin', '2023-11-19 00:04:13', 'admin', '2023-11-28 20:58:16', '0', '1', '0', '', 'EpSetting', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3009, '字典分类', 2008, 10, '1', '/system/dict/type', 'DeptType', 'system/dictType/index', '', 'admin', '2023-11-19 22:33:46', 'admin', '2023-11-28 20:58:16', '0', '1', '1', 'sys:dict:type', 'MingcuteBook5Line', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3010, '字典数据', 2008, 11, '1', '/system/dict/data', 'DictData', 'system/dictData/index', '', 'admin', '2024-02-20 11:29:06', 'admin', '2024-02-20 11:29:06', '0', '1', '0', 'sys:dict:data', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3015, '个人中心', 0, 99, '1', '/personal-center', 'PersonalCenter', 'system/personalCenter/index', '', 'admin', '2024-03-22 12:38:00', 'admin', '2024-03-22 12:38:00', '0', '1', '0', 'sys:personal:center', 'CarbonUserRole', '0', '', '0', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `sort` int NULL DEFAULT NULL COMMENT '排序顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '角色状态（1正常 0停用）',
  `home_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首页路由地址',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 874 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `home_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首页路由地址',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话（手机号）',
  `email` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '2' COMMENT '性别（1男 0女）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '账号状态（1正常 0锁定）',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (43, NULL, 'admin', '$2a$10$btsaUelMPMxDJUynFCTSfepBra2wSkwxX0YzU8Zl7XxRYb.CRoR5W', '系统管理员', NULL, NULL, NULL, NULL, '2', '1', NULL, 0, NULL, '2024-04-16 20:08:22', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
