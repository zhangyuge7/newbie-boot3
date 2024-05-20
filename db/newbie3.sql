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

 Date: 20/05/2024 18:44:14
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
) ENGINE = InnoDB AUTO_INCREMENT = 320 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (270, '公司总部', 0, '270', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 1, NULL, '描述信息', 'admin', '2023-11-28 19:42:59', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (271, '山东分公司', 270, '270,271', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:43:42', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (272, '河南分公司', 270, '270,272', 2, '李四', '13566666666', 'lisi@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:46:35', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (273, '云南分公司', 270, '270,273', 3, '王五', '13566666666', 'wangwu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:00', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (274, '河北分公司', 270, '270,274', 4, '赵六', '13599999999', 'zhaoliu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:55', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (275, '东营分部', 271, '270,271,275', 2, '悟空', '13234435454', 'wukong@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:53:38', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (276, '济南分部', 271, '270,271,276', 1, '八戒', '15543547357', 'bajie@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:55:25', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (277, '昆明分部', 273, '270,273,277', 1, '三藏', '16546273436', 'sanzang@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:56:21', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (278, '济宁分部', 271, '270,271,278', 4, '阿虎', '16323242332', 'ahu@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:57:47', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES (279, '菏泽分部', 271, '270,271,279', 5, '石头', '16767466463', 'shitou@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:58:35', 'admin', '2023-11-28 20:57:50');

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
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (16, '女', '0', 33, 'danger', NULL, '1', 'N', 1, '', NULL, '2024-02-21 17:10:58', NULL, '2024-03-09 22:38:57');
INSERT INTO `sys_dict_data` VALUES (19, '男', '1', 33, 'primary', NULL, '1', 'N', 2, '', NULL, '2024-03-09 13:28:37', NULL, '2024-03-09 23:16:49');
INSERT INTO `sys_dict_data` VALUES (20, '正常', '1', 35, 'primary', NULL, '1', 'Y', 1, '', NULL, '2024-03-09 21:02:49', NULL, '2024-03-09 23:16:45');
INSERT INTO `sys_dict_data` VALUES (21, '锁定', '0', 35, 'info', NULL, '1', 'N', 2, '', NULL, '2024-03-09 21:02:59', NULL, '2024-03-09 22:36:03');
INSERT INTO `sys_dict_data` VALUES (22, '正常', '1', 37, 'primary', 'status-enable status-box', '1', 'Y', 1, '', NULL, '2024-03-09 21:34:07', 'admin', '2024-04-18 14:55:10');
INSERT INTO `sys_dict_data` VALUES (23, '禁用', '0', 37, 'info', 'status-disabled status-box', '1', 'N', 2, '', NULL, '2024-03-09 21:34:15', NULL, '2024-03-21 18:14:12');
INSERT INTO `sys_dict_data` VALUES (25, '未知', '2', 33, 'warning', NULL, '1', 'Y', 3, '', NULL, '2024-03-09 22:24:30', NULL, '2024-03-09 22:37:53');
INSERT INTO `sys_dict_data` VALUES (26, 'primary', 'primary', 38, 'primary', '', '1', 'Y', 1, '', NULL, '2024-03-09 22:53:21', 'admin', '2024-04-18 14:48:24');
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
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (33, '用户性别', 'userGender', '1', 2, '', 'admin', '2024-02-21 17:10:39', 'admin', '2024-03-09 22:03:41');
INSERT INTO `sys_dict_type` VALUES (35, '用户状态', 'userStatus', '1', 3, '', 'admin', '2024-03-09 21:02:27', 'admin', '2024-03-09 22:50:28');
INSERT INTO `sys_dict_type` VALUES (37, '通用状态', 'commonStatus', '1', 1, '通用状态', 'admin', '2024-03-09 21:32:14', 'admin', '2024-04-30 21:48:51');
INSERT INTO `sys_dict_type` VALUES (38, '元素类型', 'eleType', '1', 4, '元素类型', 'admin', '2024-03-09 22:52:58', 'admin', '2024-03-10 13:41:31');

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态 1 成功，0 失败',
  `login_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录IP',
  `login_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录方式',
  `fail_reason` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败原因',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器信息',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '消耗时长，毫秒',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `login_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1 登入，0 登出',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login` VALUES (23, '1', '192.168.50.45', NULL, NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 536, '2024-05-20 17:14:09', '1', NULL);
INSERT INTO `sys_log_login` VALUES (24, '1', '192.168.50.45', NULL, NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 5, '2024-05-20 17:14:12', '0', NULL);
INSERT INTO `sys_log_login` VALUES (25, '1', '192.168.2.102', NULL, NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 83, '2024-05-20 17:58:50', '1', NULL);
INSERT INTO `sys_log_login` VALUES (26, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 188, '2024-05-20 18:09:34', '1', NULL);
INSERT INTO `sys_log_login` VALUES (27, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 101, '2024-05-20 18:18:13', '1', NULL);
INSERT INTO `sys_log_login` VALUES (28, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 566, '2024-05-20 18:20:17', '1', NULL);
INSERT INTO `sys_log_login` VALUES (29, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 8, '2024-05-20 18:20:19', '0', NULL);
INSERT INTO `sys_log_login` VALUES (30, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 673, '2024-05-20 18:36:45', '1', 'admin');
INSERT INTO `sys_log_login` VALUES (31, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 10, '2024-05-20 18:36:59', '0', 'admin');
INSERT INTO `sys_log_login` VALUES (32, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 78, '2024-05-20 18:37:08', '1', 'admin');
INSERT INTO `sys_log_login` VALUES (33, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 5, '2024-05-20 18:37:13', '0', 'admin');
INSERT INTO `sys_log_login` VALUES (34, '0', '192.168.2.102', 'username', '验证码已失效', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 300, '2024-05-20 18:38:16', '1', 'admin');
INSERT INTO `sys_log_login` VALUES (35, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 1276, '2024-05-20 18:39:01', '1', 'admin');
INSERT INTO `sys_log_login` VALUES (36, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 24, '2024-05-20 18:42:48', '0', 'admin');

-- ----------------------------
-- Table structure for sys_log_operate
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operate`;
CREATE TABLE `sys_log_operate`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态，1 成功，0 失败',
  `fail_reason` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败原因',
  `client_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `target_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求路径',
  `target_fun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行的类方法',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '消耗时长，毫秒',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 846 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_operate
-- ----------------------------
INSERT INTO `sys_log_operate` VALUES (616, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 15, '2024-05-19 21:11:43');
INSERT INTO `sys_log_operate` VALUES (617, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/deleteBatch', 'com.newbie.controller.system.SysLogOperateController.deleteBatch', 'POST', 14, '2024-05-19 21:11:46');
INSERT INTO `sys_log_operate` VALUES (618, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-19 21:11:46');
INSERT INTO `sys_log_operate` VALUES (619, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 6, '2024-05-19 21:11:51');
INSERT INTO `sys_log_operate` VALUES (620, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-19 21:11:54');
INSERT INTO `sys_log_operate` VALUES (621, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 0, '2024-05-19 21:12:11');
INSERT INTO `sys_log_operate` VALUES (622, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-19 21:12:12');
INSERT INTO `sys_log_operate` VALUES (623, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 19, '2024-05-19 21:12:37');
INSERT INTO `sys_log_operate` VALUES (624, 'admin', '1', NULL, '192.168.2.104', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 12, '2024-05-19 21:12:51');
INSERT INTO `sys_log_operate` VALUES (625, 'admin', '1', NULL, '192.168.2.104', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 25, '2024-05-19 21:12:51');
INSERT INTO `sys_log_operate` VALUES (626, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-19 21:12:52');
INSERT INTO `sys_log_operate` VALUES (627, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 7, '2024-05-19 21:13:05');
INSERT INTO `sys_log_operate` VALUES (628, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-19 21:13:07');
INSERT INTO `sys_log_operate` VALUES (629, 'admin', '1', NULL, '192.168.2.104', '/security/userInfo', 'com.newbie.controller.security.SecurityController.userInfo', 'GET', 347, '2024-05-19 21:19:44');
INSERT INTO `sys_log_operate` VALUES (630, 'admin', '1', NULL, '192.168.2.104', '/security/menus', 'com.newbie.controller.security.SecurityController.menus', 'GET', 154, '2024-05-19 21:19:45');
INSERT INTO `sys_log_operate` VALUES (631, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 122, '2024-05-19 21:20:01');
INSERT INTO `sys_log_operate` VALUES (632, 'admin', '1', NULL, '192.168.2.104', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 21, '2024-05-19 21:20:29');
INSERT INTO `sys_log_operate` VALUES (633, 'admin', '1', NULL, '192.168.2.104', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 14, '2024-05-19 21:20:33');
INSERT INTO `sys_log_operate` VALUES (634, 'admin', '1', NULL, '192.168.2.104', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 10, '2024-05-19 21:20:37');
INSERT INTO `sys_log_operate` VALUES (635, 'admin', '1', NULL, '192.168.2.104', '/system/menu/add', 'com.newbie.controller.system.SysMenuController.add', 'POST', 23, '2024-05-19 21:21:05');
INSERT INTO `sys_log_operate` VALUES (636, 'admin', '1', NULL, '192.168.2.104', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 14, '2024-05-19 21:21:05');
INSERT INTO `sys_log_operate` VALUES (637, 'admin', '1', NULL, '192.168.2.104', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 28, '2024-05-19 21:26:45');
INSERT INTO `sys_log_operate` VALUES (638, 'admin', '1', NULL, '192.168.2.104', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 17, '2024-05-19 21:26:46');
INSERT INTO `sys_log_operate` VALUES (639, 'admin', '1', NULL, '192.168.2.104', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 23, '2024-05-19 21:26:46');
INSERT INTO `sys_log_operate` VALUES (640, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 21, '2024-05-19 21:26:46');
INSERT INTO `sys_log_operate` VALUES (641, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 31, '2024-05-19 21:26:47');
INSERT INTO `sys_log_operate` VALUES (842, '#', '0', '用户不存在', '192.168.50.45', '/security/login', 'com.newbie.controller.security.SecurityController.login', 'POST', 9, '2024-05-20 16:01:52');
INSERT INTO `sys_log_operate` VALUES (843, '#', '0', '验证码已失效', '192.168.50.45', '/security/login', 'com.newbie.controller.security.SecurityController.login', 'POST', 1, '2024-05-20 16:01:54');
INSERT INTO `sys_log_operate` VALUES (844, '#', '0', '密码错误', '192.168.50.45', '/security/login', 'com.newbie.controller.security.SecurityController.login', 'POST', 108, '2024-05-20 16:01:59');
INSERT INTO `sys_log_operate` VALUES (845, '#', '0', '密码错误', '192.168.50.45', '/security/login', 'com.newbie.controller.security.SecurityController.login', 'POST', 86, '2024-05-20 16:02:05');

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
  `is_keep` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否缓存组件（1缓存 0不缓存）',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '菜单类型（1菜单 0按钮）',
  `is_hide` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否隐藏菜单（1是 0否 ）',
  `perm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `hide_children` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否隐藏子级菜单（1是 0否）',
  `iframe_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内嵌外链接地址',
  `is_outer` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否在layout外显示（1是 0否）',
  `transition` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '切换动画',
  `fixed_tab` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否固定在tabs（1是 0否）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3067 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2008, '系统管理', 0, 2, '1', '/system', 'System', '', NULL, 'admin', '2023-02-26 01:31:55', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys', 'TdesignSystemSetting', '0', '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2009, '用户管理', 2008, 1, '1', '/system/user', 'SysUser', 'system/user/index', NULL, 'admin', '2023-02-26 01:49:34', 'admin', '2024-04-23 19:04:05', '0', '1', '0', 'sys.user', 'MaterialSymbolsManageAccountsOutlineRounded', '0', '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2010, '角色管理', 2008, 2, '1', '/system/role', 'SysRole', 'system/role/index', NULL, 'admin', '2023-02-26 02:31:10', 'admin', '2024-05-02 14:45:13', '0', '1', '0', 'sys.role', 'CarbonUserRole', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (2013, '菜单管理', 2008, 3, '1', '/system/menu', 'SysMenu', 'system/menu/index', NULL, 'admin', '2023-02-26 23:11:00', 'admin', '2024-04-23 19:00:35', '0', '1', '0', 'sys.menu', 'FluentTextBulletListTree16Regular', '0', '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2042, '首页', 0, 0, '1', '/home', '', 'home/index', '', 'admin', '2023-07-31 05:37:08', 'admin', '2024-04-18 19:56:32', '0', '1', '0', '', 'ep:home-filled', '0', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (2050, '新增', 2013, 1, '1', NULL, NULL, NULL, '菜单新增按钮', 'admin', '2023-08-27 15:54:22', 'admin', '2024-04-18 16:04:23', '0', '0', '0', 'sys.menu.add', NULL, NULL, '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2051, '修改', 2013, 2, '1', NULL, NULL, NULL, '菜单编辑按钮', 'admin', '2023-08-27 15:54:58', 'admin', '2024-04-18 18:04:41', '0', '0', '0', 'sys.menu.update', NULL, NULL, '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2052, '删除', 2013, 3, '1', NULL, NULL, NULL, '菜单删除按钮', 'admin', '2023-08-27 15:55:21', 'admin', '2024-04-18 16:04:54', '0', '0', '0', 'sys.menu.del', NULL, NULL, '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2069, '前端文档', 2072, 98, '1', 'https://zhangyuge7.github.io/preview/five-admin-v2-docs/', '', '', '', 'admin', '2023-11-10 15:03:57', 'admin', '2024-05-18 17:13:56', '0', '1', '0', '', 'ep:document', '0', '', '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (2071, '部门管理', 2008, 6, '1', '/system/dept', 'SysDept', 'system/dept/index', '', 'admin', '2023-11-18 22:46:58', 'admin', '2024-04-23 19:00:55', '0', '1', '0', 'sys.dept', 'MingcuteDepartmentLine', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (2072, '文档', 0, 22, '1', '/docs', '', '', '', 'admin', '2023-11-19 00:04:13', 'admin', '2023-11-28 20:58:16', '0', '1', '0', '', 'EpSetting', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3009, '字典分类', 2008, 10, '1', '/system/dict/type', 'SysDeptType', 'system/dictType/index', '', 'admin', '2023-11-19 22:33:46', 'admin', '2024-04-23 19:01:22', '0', '1', '1', 'sys.dict.type', 'MingcuteBook5Line', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3010, '字典管理', 2008, 11, '1', '/system/dict/data', 'SysDictData', 'system/dictData/index', '', 'admin', '2024-02-20 11:29:06', 'admin', '2024-04-23 19:01:48', '0', '1', '0', 'sys.dict.data', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3015, '个人中心', 0, 99, '1', '/personal-center', 'PersonalCenter', 'system/personalCenter/index', '', 'admin', '2024-03-22 12:38:00', 'admin', '2024-04-18 16:05:27', '0', '1', '0', '', 'CarbonUserRole', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3038, '新增', 2009, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:10', NULL, NULL, '0', '0', '0', 'sys.user.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3039, '修改', 2009, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:22', 'admin', '2024-04-18 16:07:44', '0', '0', '0', 'sys.user.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3040, '删除', 2009, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:34', NULL, NULL, '0', '0', '0', 'sys.user.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3041, '修改密码', 2009, 4, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:07:24', NULL, NULL, '0', '0', '0', 'sys.user.update.password', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3042, '新增', 2010, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:31', NULL, NULL, '0', '0', '0', 'sys.role.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3043, '修改', 2010, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:46', NULL, NULL, '0', '0', '0', 'sys.role.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3044, '删除', 2010, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:02:04', NULL, NULL, '0', '0', '0', 'sys.role.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3045, '权限', 2010, 4, '1', NULL, NULL, NULL, '分配权限按钮', 'admin', '2024-04-18 18:03:10', NULL, NULL, '0', '0', '0', 'sys.role.perm', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3046, '用户', 2010, 5, '1', NULL, NULL, NULL, '分配用户按钮', 'admin', '2024-04-18 18:03:35', NULL, NULL, '0', '0', '0', 'sys.role.user', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3047, '新增', 2071, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:07', NULL, NULL, '0', '0', '0', 'sys.dept.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3048, '修改', 2071, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:25', NULL, NULL, '0', '0', '0', 'sys.dept.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3049, '删除', 2071, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:57', NULL, NULL, '0', '0', '0', 'sys.dept.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3050, '新增', 3009, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:05:37', 'admin', '2024-04-18 18:05:53', '0', '0', '0', 'sys.dict.type.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3051, '修改', 3009, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:25', NULL, NULL, '0', '0', '0', 'sys.dict.type.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3052, '删除', 3009, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:40', NULL, NULL, '0', '0', '0', 'sys.dict.type.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3053, '新增', 3010, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:10', NULL, NULL, '0', '0', '0', 'sys.dict.data.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3054, '修改', 3010, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:25', NULL, NULL, '0', '0', '0', 'sys.dict.data.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3055, '删除', 3010, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:48', NULL, NULL, '0', '0', '0', 'sys.dict.data.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3056, '默认', 3010, 4, '1', NULL, NULL, NULL, '字典数据设置默认的按钮', 'admin', '2024-04-18 18:08:52', NULL, NULL, '0', '0', '0', 'sys.dict.data.def', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO `sys_menu` VALUES (3059, '演示', 0, 98, '1', '/demo', '', '', '', 'admin', '2024-04-30 15:06:58', 'admin', '2024-05-18 17:11:44', '0', '1', '0', '', 'MingcuteDepartmentLine', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3060, '上传下载', 3059, 1, '1', '/uploadtest', 'UploadTest', 'demo/UploadTest', '', 'admin', '2024-04-30 15:08:16', NULL, NULL, '0', '1', '0', '', '', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3064, '操作日志', 2008, 20, '1', '/system/operatelog', 'SysLogOperate', 'system/logOperate/index', '', 'admin', '2024-05-18 21:03:59', 'admin', '2024-05-19 21:29:07', '0', '1', '0', 'sys.log.operate', 'MaterialSymbolsDataInfoAlertRounded', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3065, '登录日志', 2008, 30, '1', '/system/loginlog', '', '', '', 'admin', '2024-05-18 21:18:26', NULL, NULL, '0', '1', '0', '', 'CarbonCloudMonitoring', '0', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES (3066, '删除', 3064, 10, '1', NULL, NULL, NULL, '', 'admin', '2024-05-19 21:21:05', NULL, NULL, '0', '0', '0', 'sys.log.operate.del', NULL, '0', NULL, '0', NULL, '0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 175 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (173, '测试', 'test', 1, '1', '', '测试角色', 'admin', '2024-04-18 15:53:42', 'admin', '2024-05-02 15:48:58');

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
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1112, 173, 2042, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1113, 173, 3059, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1114, 173, 3060, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1115, 173, 3038, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1116, 173, 3039, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1117, 173, 2010, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1118, 173, 2013, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1119, 173, 2071, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1120, 173, 3009, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1121, 173, 3010, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1122, 173, 2072, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1123, 173, 2069, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1124, 173, 3015, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1125, 173, 2008, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (1126, 173, 2009, 'admin', '2024-04-30 17:05:39', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (52, 272, 'test1', '$2a$10$3sFeXxGHsTI4jwIjzxjfI.kzTl52cywiKfkoUxJ7j0I0UDP4jurZC', '测试用户1', NULL, '', '32132132131', '3213213213211', '1', '1', '', 3, 'admin', '2024-04-18 15:51:03', 'test1', '2024-05-02 15:48:27');
INSERT INTO `sys_user` VALUES (56, NULL, 'admin', '$2a$10$Tmyn6gY/bfA5wp6FVMPETOlPByeMEajJ2pAeAzNZh4kOIaxv76Tde', '系统管理员', NULL, NULL, NULL, NULL, '2', '1', NULL, 0, NULL, '2024-04-23 15:54:10', NULL, NULL);

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
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 237 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (236, 52, 173, 'admin', '2024-05-10 17:06:28', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
