/*
 Navicat Premium Data Transfer

 Source Server         : alipgsql
 Source Server Type    : PostgreSQL
 Source Server Version : 160003 (160003)
 Source Host           : 47.94.76.140:5432
 Source Catalog        : user_JNcKh5
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160003 (160003)
 File Encoding         : 65001

 Date: 12/06/2024 15:57:01
*/


-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "dept_name" varchar(30) COLLATE "pg_catalog"."default",
  "parent_id" varchar(64) COLLATE "pg_catalog"."default",
  "ancestors" varchar(1000) COLLATE "pg_catalog"."default",
  "sort" int4,
  "leader" varchar(30) COLLATE "pg_catalog"."default",
  "phone" char(11) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default",
  "tier" int4,
  "home_path" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(120) COLLATE "pg_catalog"."default",
  "create_by" varchar(30) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(30) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_dept"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_dept"."dept_name" IS '部门名称';
COMMENT ON COLUMN "public"."sys_dept"."parent_id" IS '父级id';
COMMENT ON COLUMN "public"."sys_dept"."ancestors" IS '祖级列表';
COMMENT ON COLUMN "public"."sys_dept"."sort" IS '显示顺序';
COMMENT ON COLUMN "public"."sys_dept"."leader" IS '负责人';
COMMENT ON COLUMN "public"."sys_dept"."phone" IS '联系电话';
COMMENT ON COLUMN "public"."sys_dept"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_dept"."status" IS '状态（1正常 0停用）';
COMMENT ON COLUMN "public"."sys_dept"."tier" IS '层级';
COMMENT ON COLUMN "public"."sys_dept"."home_path" IS '首页路由地址';
COMMENT ON COLUMN "public"."sys_dept"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dept"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_dept"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dept"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_dept"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_dept" IS '部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "public"."sys_dept" VALUES ('270', '公司总部', '0', '270', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 1, NULL, '描述信息', 'admin', '2023-11-28 19:42:59', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES ('271', '山东分公司', '270', '270,271', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:43:42', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES ('272', '河南分公司', '270', '270,272', 2, '李四', '13566666666', 'lisi@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:46:35', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES ('273', '云南分公司', '270', '270,273', 3, '王五', '13566666666', 'wangwu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:00', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES ('274', '河北分公司', '270', '270,274', 4, '赵六', '13599999999', 'zhaoliu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:55', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES ('275', '东营分部', '271', '270,271,275', 2, '悟空', '13234435454', 'wukong@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:53:38', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES ('276', '济南分部', '271', '270,271,276', 1, '八戒', '15543547357', 'bajie@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:55:25', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES ('277', '昆明分部', '273', '270,273,277', 1, '三藏', '16546273436', 'sanzang@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:56:21', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES ('278', '济宁分部', '271', '270,271,278', 4, '阿虎', '16323242332', 'ahu@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:57:47', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES ('279', '菏泽分部', '271', '270,271,279', 5, '石头', '16767466463', 'shitou@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:58:35', 'admin', '2023-11-28 20:57:50');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_data";
CREATE TABLE "public"."sys_dict_data" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "label" varchar(30) COLLATE "pg_catalog"."default",
  "value" varchar(10) COLLATE "pg_catalog"."default",
  "type_id" varchar(64) COLLATE "pg_catalog"."default",
  "ele_type" varchar(10) COLLATE "pg_catalog"."default",
  "ele_class" varchar(255) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default",
  "def" char(1) COLLATE "pg_catalog"."default",
  "sort" int4,
  "remark" varchar(120) COLLATE "pg_catalog"."default",
  "create_by" varchar(30) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(30) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_dict_data"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_dict_data"."label" IS '标签';
COMMENT ON COLUMN "public"."sys_dict_data"."value" IS '值';
COMMENT ON COLUMN "public"."sys_dict_data"."type_id" IS '字典类型ID';
COMMENT ON COLUMN "public"."sys_dict_data"."ele_type" IS '元素类型';
COMMENT ON COLUMN "public"."sys_dict_data"."ele_class" IS '元素样式类名';
COMMENT ON COLUMN "public"."sys_dict_data"."status" IS '状态（1正常 0禁用）';
COMMENT ON COLUMN "public"."sys_dict_data"."def" IS '默认，Y/N';
COMMENT ON COLUMN "public"."sys_dict_data"."sort" IS '排序字段';
COMMENT ON COLUMN "public"."sys_dict_data"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dict_data"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_dict_data"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_data"."update_by" IS '修改者';
COMMENT ON COLUMN "public"."sys_dict_data"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_dict_data" IS '系统字典数据';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO "public"."sys_dict_data" VALUES ('16', '女', '0', '33', 'danger', NULL, '1', 'N', 1, '', NULL, '2024-02-21 17:10:58', NULL, '2024-03-09 22:38:57');
INSERT INTO "public"."sys_dict_data" VALUES ('19', '男', '1', '33', 'primary', NULL, '1', 'N', 2, '', NULL, '2024-03-09 13:28:37', NULL, '2024-03-09 23:16:49');
INSERT INTO "public"."sys_dict_data" VALUES ('20', '正常', '1', '35', 'primary', NULL, '1', 'Y', 1, '', NULL, '2024-03-09 21:02:49', NULL, '2024-03-09 23:16:45');
INSERT INTO "public"."sys_dict_data" VALUES ('21', '锁定', '0', '35', 'info', NULL, '1', 'N', 2, '', NULL, '2024-03-09 21:02:59', NULL, '2024-03-09 22:36:03');
INSERT INTO "public"."sys_dict_data" VALUES ('22', '正常', '1', '37', 'primary', 'status-enable status-box', '1', 'Y', 1, '', NULL, '2024-03-09 21:34:07', 'admin', '2024-04-18 14:55:10');
INSERT INTO "public"."sys_dict_data" VALUES ('23', '禁用', '0', '37', 'info', 'status-disabled status-box', '1', 'N', 2, '', NULL, '2024-03-09 21:34:15', NULL, '2024-03-21 18:14:12');
INSERT INTO "public"."sys_dict_data" VALUES ('25', '未知', '2', '33', 'warning', NULL, '1', 'Y', 3, '', NULL, '2024-03-09 22:24:30', NULL, '2024-03-09 22:37:53');
INSERT INTO "public"."sys_dict_data" VALUES ('26', 'primary', 'primary', '38', 'primary', '', '1', 'Y', 1, '', NULL, '2024-03-09 22:53:21', 'admin', '2024-04-18 14:48:24');
INSERT INTO "public"."sys_dict_data" VALUES ('27', 'success', 'success', '38', 'success', '', '1', 'N', 2, '', NULL, '2024-03-09 22:53:30', NULL, '2024-03-09 23:17:28');
INSERT INTO "public"."sys_dict_data" VALUES ('28', 'info', 'info', '38', 'info', '', '1', 'N', 3, '', NULL, '2024-03-09 22:53:39', NULL, '2024-03-09 23:17:33');
INSERT INTO "public"."sys_dict_data" VALUES ('29', 'warning', 'warning', '38', 'warning', '', '1', 'N', 4, '', NULL, '2024-03-09 22:53:46', NULL, '2024-03-09 23:17:36');
INSERT INTO "public"."sys_dict_data" VALUES ('30', 'danger', 'danger', '38', 'danger', '', '1', 'N', 5, '', NULL, '2024-03-09 22:53:54', NULL, '2024-03-09 23:17:40');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_type";
CREATE TABLE "public"."sys_dict_type" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "type_name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "type_code" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "status" char(1) COLLATE "pg_catalog"."default",
  "sort" int4,
  "remark" varchar(120) COLLATE "pg_catalog"."default",
  "create_by" varchar(30) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(30) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_dict_type"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_dict_type"."type_name" IS '字典类型名称';
COMMENT ON COLUMN "public"."sys_dict_type"."type_code" IS '类型编码';
COMMENT ON COLUMN "public"."sys_dict_type"."status" IS '状态（1正常 0禁用）';
COMMENT ON COLUMN "public"."sys_dict_type"."sort" IS '排序字段';
COMMENT ON COLUMN "public"."sys_dict_type"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dict_type"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_dict_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_type"."update_by" IS '修改者';
COMMENT ON COLUMN "public"."sys_dict_type"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_dict_type" IS '系统字典类型';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO "public"."sys_dict_type" VALUES ('33', '用户性别', 'userGender', '1', 2, '', 'admin', '2024-02-21 17:10:39', 'admin', '2024-03-09 22:03:41');
INSERT INTO "public"."sys_dict_type" VALUES ('35', '用户状态', 'userStatus', '1', 3, '', 'admin', '2024-03-09 21:02:27', 'admin', '2024-03-09 22:50:28');
INSERT INTO "public"."sys_dict_type" VALUES ('38', '元素类型', 'eleType', '1', 4, '元素类型', 'admin', '2024-03-09 22:52:58', 'admin', '2024-03-10 13:41:31');
INSERT INTO "public"."sys_dict_type" VALUES ('37', '通用状态', 'commonStatus', '1', 1, '通用状态', 'admin', '2024-03-09 21:32:14', 'admin', '2024-05-28 17:03:19.624');

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log_login";
CREATE TABLE "public"."sys_log_login" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" char(1) COLLATE "pg_catalog"."default",
  "login_ip" varchar(45) COLLATE "pg_catalog"."default",
  "login_method" varchar(50) COLLATE "pg_catalog"."default",
  "fail_reason" varchar(1000) COLLATE "pg_catalog"."default",
  "os" varchar(255) COLLATE "pg_catalog"."default",
  "browser" varchar(255) COLLATE "pg_catalog"."default",
  "cost_time" int8,
  "create_time" timestamp(6),
  "login_type" char(1) COLLATE "pg_catalog"."default",
  "username" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_log_login"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_log_login"."status" IS '状态 1 成功，0 失败';
COMMENT ON COLUMN "public"."sys_log_login"."login_ip" IS '登录IP';
COMMENT ON COLUMN "public"."sys_log_login"."login_method" IS '登录方式';
COMMENT ON COLUMN "public"."sys_log_login"."fail_reason" IS '失败原因';
COMMENT ON COLUMN "public"."sys_log_login"."os" IS '操作系统';
COMMENT ON COLUMN "public"."sys_log_login"."browser" IS '浏览器信息';
COMMENT ON COLUMN "public"."sys_log_login"."cost_time" IS '消耗时长，毫秒';
COMMENT ON COLUMN "public"."sys_log_login"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_log_login"."login_type" IS '1 登入，0 登出';
COMMENT ON COLUMN "public"."sys_log_login"."username" IS '用户名';
COMMENT ON TABLE "public"."sys_log_login" IS '系统登录日志';

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO "public"."sys_log_login" VALUES ('1798313708390580226', '1', '192.168.31.158', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 1202, '2024-06-05 19:19:33.79', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES ('1800794954752507906', '1', '192.168.31.158', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 1039, '2024-06-12 15:39:09.023', '1', 'admin');

-- ----------------------------
-- Table structure for sys_log_operate
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log_operate";
CREATE TABLE "public"."sys_log_operate" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(30) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default",
  "fail_reason" varchar(1000) COLLATE "pg_catalog"."default",
  "client_ip" varchar(100) COLLATE "pg_catalog"."default",
  "target_uri" varchar(255) COLLATE "pg_catalog"."default",
  "target_fun" varchar(255) COLLATE "pg_catalog"."default",
  "method" varchar(10) COLLATE "pg_catalog"."default",
  "cost_time" int8,
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_log_operate"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_log_operate"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_log_operate"."status" IS '状态，1 成功，0 失败';
COMMENT ON COLUMN "public"."sys_log_operate"."fail_reason" IS '失败原因';
COMMENT ON COLUMN "public"."sys_log_operate"."client_ip" IS '客户端IP';
COMMENT ON COLUMN "public"."sys_log_operate"."target_uri" IS '请求路径';
COMMENT ON COLUMN "public"."sys_log_operate"."target_fun" IS '执行的类方法';
COMMENT ON COLUMN "public"."sys_log_operate"."method" IS '请求方式';
COMMENT ON COLUMN "public"."sys_log_operate"."cost_time" IS '消耗时长，毫秒';
COMMENT ON COLUMN "public"."sys_log_operate"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."sys_log_operate" IS '系统操作日志';

-- ----------------------------
-- Records of sys_log_operate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" varchar(64) COLLATE "pg_catalog"."default",
  "sort" int4,
  "status" char(1) COLLATE "pg_catalog"."default",
  "route_path" varchar(255) COLLATE "pg_catalog"."default",
  "route_name" varchar(30) COLLATE "pg_catalog"."default",
  "component" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(120) COLLATE "pg_catalog"."default",
  "create_by" varchar(30) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(30) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "is_keep" char(1) COLLATE "pg_catalog"."default",
  "type" char(1) COLLATE "pg_catalog"."default",
  "is_hide" char(1) COLLATE "pg_catalog"."default",
  "perm" varchar(100) COLLATE "pg_catalog"."default",
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "hide_children" char(1) COLLATE "pg_catalog"."default",
  "iframe_link" varchar(255) COLLATE "pg_catalog"."default",
  "is_outer" char(1) COLLATE "pg_catalog"."default",
  "transition" varchar(30) COLLATE "pg_catalog"."default",
  "fixed_tab" char(1) COLLATE "pg_catalog"."default",
  "ancestors" varchar(1000) COLLATE "pg_catalog"."default",
  "tier" int4,
  "route_redirect" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_menu"."id" IS '菜单ID';
COMMENT ON COLUMN "public"."sys_menu"."title" IS '菜单标题';
COMMENT ON COLUMN "public"."sys_menu"."parent_id" IS '父菜单ID';
COMMENT ON COLUMN "public"."sys_menu"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_menu"."status" IS '菜单状态（1正常 0停用）';
COMMENT ON COLUMN "public"."sys_menu"."route_path" IS '路由地址';
COMMENT ON COLUMN "public"."sys_menu"."route_name" IS '路由name';
COMMENT ON COLUMN "public"."sys_menu"."component" IS '组件路径';
COMMENT ON COLUMN "public"."sys_menu"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_menu"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_menu"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_menu"."is_keep" IS '是否缓存组件（1缓存 0不缓存）';
COMMENT ON COLUMN "public"."sys_menu"."type" IS '菜单类型（1菜单 0按钮）';
COMMENT ON COLUMN "public"."sys_menu"."is_hide" IS '是否隐藏菜单（1是 0否 ）';
COMMENT ON COLUMN "public"."sys_menu"."perm" IS '权限标识';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "public"."sys_menu"."hide_children" IS '是否隐藏子级菜单（1是 0否）';
COMMENT ON COLUMN "public"."sys_menu"."iframe_link" IS '内嵌外链接地址';
COMMENT ON COLUMN "public"."sys_menu"."is_outer" IS '是否在layout外显示（1是 0否）';
COMMENT ON COLUMN "public"."sys_menu"."transition" IS '切换动画';
COMMENT ON COLUMN "public"."sys_menu"."fixed_tab" IS '是否固定在tabs（1是 0否）';
COMMENT ON COLUMN "public"."sys_menu"."ancestors" IS '祖级列表';
COMMENT ON COLUMN "public"."sys_menu"."tier" IS '层级';
COMMENT ON COLUMN "public"."sys_menu"."route_redirect" IS '路由地址重定向';
COMMENT ON TABLE "public"."sys_menu" IS '系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES ('2008', '系统管理', '0', 2, '1', '/system', NULL, '', NULL, 'admin', '2023-02-26 01:31:55', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys', 'TdesignSystemSetting', '0', '', '0', NULL, '0', '2008', 1,'/system/user');
INSERT INTO "public"."sys_menu" VALUES ('2009', '用户管理', '2008', 1, '1', '/system/user', 'SysUser', 'system/user/index', NULL, 'admin', '2023-02-26 01:49:34', 'admin', '2024-04-23 19:04:05', '0', '1', '0', 'sys.user', 'MaterialSymbolsManageAccountsOutlineRounded', '0', '', '0', NULL, '0', '2008,2009', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('2010', '角色管理', '2008', 2, '1', '/system/role', 'SysRole', 'system/role/index', NULL, 'admin', '2023-02-26 02:31:10', 'admin', '2024-05-02 14:45:13', '0', '1', '0', 'sys.role', 'CarbonUserRole', '0', '', '0', '', '0', '2008,2010', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('2013', '菜单管理', '2008', 3, '1', '/system/menu', 'SysMenu', 'system/menu/index', NULL, 'admin', '2023-02-26 23:11:00', 'admin', '2024-04-23 19:00:35', '0', '1', '0', 'sys.menu', 'FluentTextBulletListTree16Regular', '0', '', '0', NULL, '0', '2008,2013', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('2042', '首页', '0', 0, '1', '/home', '', 'home/index', '', 'admin', '2023-07-31 05:37:08', 'admin', '2024-05-28 14:34:03', '0', '1', '0', '', 'ep:home-filled', '0', '', '0', NULL, '1', '2042', 1,NULL);
INSERT INTO "public"."sys_menu" VALUES ('2050', '新增', '2013', 1, '1', NULL, NULL, NULL, '菜单新增按钮', 'admin', '2023-08-27 15:54:22', 'admin', '2024-04-18 16:04:23', '0', '0', '0', 'sys.menu.add', NULL, NULL, '', '0', NULL, '0', '2008,2013,2050', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('2051', '修改', '2013', 2, '1', NULL, NULL, NULL, '菜单编辑按钮', 'admin', '2023-08-27 15:54:58', 'admin', '2024-04-18 18:04:41', '0', '0', '0', 'sys.menu.update', NULL, NULL, '', '0', NULL, '0', '2008,2013,2051', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('2052', '删除', '2013', 3, '1', NULL, NULL, NULL, '菜单删除按钮', 'admin', '2023-08-27 15:55:21', 'admin', '2024-04-18 16:04:54', '0', '0', '0', 'sys.menu.del', NULL, NULL, '', '0', NULL, '0', '2008,2013,2052', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('2069', '前端文档', '2072', 98, '1', 'https://zhangyuge7.github.io/preview/five-admin-v2-docs/', '', '', '', 'admin', '2023-11-10 15:03:57', 'admin', '2024-05-18 17:13:56', '0', '1', '0', '', 'ep:document', '0', '', '0', NULL, '0', '2072,2069', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('2071', '部门管理', '2008', 6, '1', '/system/dept', 'SysDept', 'system/dept/index', '', 'admin', '2023-11-18 22:46:58', 'admin', '2024-04-23 19:00:55', '0', '1', '0', 'sys.dept', 'MingcuteDepartmentLine', '0', '', '0', '', '0', '2008,2071', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('2072', '文档', '0', 22, '1', '/docs', '', '', '', 'admin', '2023-11-19 00:04:13', 'admin', '2023-11-28 20:58:16', '0', '1', '0', '', 'EpSetting', '0', '', '0', '', '0', '2072', 1,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3009', '字典分类', '2008', 10, '1', '/system/dict/type', 'SysDeptType', 'system/dictType/index', '', 'admin', '2023-11-19 22:33:46', 'admin', '2024-04-23 19:01:22', '0', '1', '1', 'sys.dict.type', 'MingcuteBook5Line', '0', '', '0', '', '0', '2008,3009', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3010', '字典管理', '2008', 11, '1', '/system/dict/data', 'SysDictData', 'system/dictData/index', '', 'admin', '2024-02-20 11:29:06', 'admin', '2024-04-23 19:01:48', '0', '1', '0', 'sys.dict.data', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0', '2008,3010', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3015', '个人中心', '0', 99, '1', '/personal-center', 'PersonalCenter', 'personalCenter/index', '', 'admin', '2024-03-22 12:38:00', 'admin', '2024-05-24 11:17:16', '0', '1', '0', '', 'CarbonUserRole', '0', '', '0', '', '0', '3015', 1,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3038', '新增', '2009', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:10', NULL, NULL, '0', '0', '0', 'sys.user.add', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3038', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3039', '修改', '2009', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:22', 'admin', '2024-04-18 16:07:44', '0', '0', '0', 'sys.user.update', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3039', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3040', '删除', '2009', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:34', NULL, NULL, '0', '0', '0', 'sys.user.del', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3040', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3041', '修改密码', '2009', 4, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:07:24', NULL, NULL, '0', '0', '0', 'sys.user.update.password', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3041', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3042', '新增', '2010', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:31', NULL, NULL, '0', '0', '0', 'sys.role.add', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3042', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3043', '修改', '2010', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:46', NULL, NULL, '0', '0', '0', 'sys.role.update', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3043', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3044', '删除', '2010', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:02:04', NULL, NULL, '0', '0', '0', 'sys.role.del', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3044', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3045', '权限', '2010', 4, '1', NULL, NULL, NULL, '分配权限按钮', 'admin', '2024-04-18 18:03:10', NULL, NULL, '0', '0', '0', 'sys.role.perm', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3045', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3046', '用户', '2010', 5, '1', NULL, NULL, NULL, '分配用户按钮', 'admin', '2024-04-18 18:03:35', NULL, NULL, '0', '0', '0', 'sys.role.user', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3046', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3047', '新增', '2071', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:07', NULL, NULL, '0', '0', '0', 'sys.dept.add', NULL, '0', NULL, '0', NULL, '0', '2008,2071,3047', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3048', '修改', '2071', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:25', NULL, NULL, '0', '0', '0', 'sys.dept.update', NULL, '0', NULL, '0', NULL, '0', '2008,2071,3048', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3049', '删除', '2071', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:57', NULL, NULL, '0', '0', '0', 'sys.dept.del', NULL, '0', NULL, '0', NULL, '0', '2008,2071,3049', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3050', '新增', '3009', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:05:37', 'admin', '2024-04-18 18:05:53', '0', '0', '0', 'sys.dict.type.add', NULL, '0', NULL, '0', NULL, '0', '2008,3009,3050', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3051', '修改', '3009', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:25', NULL, NULL, '0', '0', '0', 'sys.dict.type.update', NULL, '0', NULL, '0', NULL, '0', '2008,3009,3051', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3052', '删除', '3009', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:40', NULL, NULL, '0', '0', '0', 'sys.dict.type.del', NULL, '0', NULL, '0', NULL, '0', '2008,3009,3052', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3053', '新增', '3010', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:10', NULL, NULL, '0', '0', '0', 'sys.dict.data.add', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3053', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3054', '修改', '3010', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:25', NULL, NULL, '0', '0', '0', 'sys.dict.data.update', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3054', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3055', '删除', '3010', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:48', NULL, NULL, '0', '0', '0', 'sys.dict.data.del', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3055', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3056', '默认', '3010', 4, '1', NULL, NULL, NULL, '字典数据设置默认的按钮', 'admin', '2024-04-18 18:08:52', NULL, NULL, '0', '0', '0', 'sys.dict.data.def', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3056', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3059', '演示', '0', 98, '1', '/demo', '', '', '', 'admin', '2024-04-30 15:06:58', 'admin', '2024-05-18 17:11:44', '0', '1', '0', '', 'MingcuteDepartmentLine', '0', '', '0', '', '0', '3059', 1,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3060', '上传下载', '3059', 1, '1', '/uploadtest', 'UploadTest', 'demo/UploadTest', '', 'admin', '2024-04-30 15:08:16', NULL, NULL, '0', '1', '0', '', '', '0', '', '0', '', '0', '3059,3060', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('3068', 'API文档', '2072', 1, '1', 'http://localhost:8080/swagger-ui/index.html,_blank', '', '', '', 'admin', '2024-05-25 14:33:52', 'admin', '2024-05-25 14:35:04', '0', '1', '0', '', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0', '2072,3068', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('1795419039163936769', '系统监控', '0', 3, '1', '/monitor', NULL, NULL, NULL, 'admin', '2024-05-28 19:37:10', 'admin', '2024-05-28 19:42:41', '0', '1', '0', NULL, 'CarbonCloudMonitoring', '0', NULL, '0', NULL, '0', '1795419039163936769', 1,'/monitor/server');
INSERT INTO "public"."sys_menu" VALUES ('1795424113898455041', '操作日志', '1795419039163936769', 20, '1', '/monitor/operatelog', 'SysLogOperate', 'monitor/logOperate/index', NULL, 'admin', '2024-05-28 19:57:20', 'admin', '2024-05-28 20:06:45', '0', '1', '0', 'sys.log.operate', 'MaterialSymbolsDataInfoAlertRounded', '0', NULL, '0', NULL, '0', '1795419039163936769,1795424113898455041', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('1795426597572345858', '删除', '1795424113898455041', 10, '1', NULL, NULL, NULL, NULL, 'admin', '2024-05-28 20:07:12', 'admin', '2024-05-28 20:07:12', NULL, '0', NULL, 'sys.log.operate.del', NULL, NULL, NULL, NULL, NULL, NULL, '1795419039163936769,1795424113898455041,1795426597572345858', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('1795426808940101633', '登录日志', '1795419039163936769', 30, '1', '/monitor/loginlog', 'SysLogLogin', 'monitor/logLogin/index', NULL, 'admin', '2024-05-28 20:08:03', 'admin', '2024-05-28 20:08:43', '0', '1', '0', 'sys.log.login', 'MaterialSymbolsDataInfoAlertRounded', '0', NULL, '0', NULL, '0', '1795419039163936769,1795426808940101633', 2,NULL);
INSERT INTO "public"."sys_menu" VALUES ('1795427077400723458', '删除', '1795426808940101633', 10, '1', NULL, NULL, NULL, NULL, 'admin', '2024-05-28 20:09:07', 'admin', '2024-05-28 20:09:07', NULL, '0', NULL, 'sys.log.login.del', NULL, NULL, NULL, NULL, NULL, NULL, '1795419039163936769,1795426808940101633,1795427077400723458', 3,NULL);
INSERT INTO "public"."sys_menu" VALUES ('1796439829787398145', '服务监控', '1795419039163936769', 50, '1', '/monitor/server', 'SysServerMonitor', 'monitor/serverMonitor/index', '', 'admin', '2024-05-31 15:13:26', 'admin', '2024-06-04 16:01:58.989', '0', '1', '0', 'sys.monitor.server', 'CarbonCloudMonitoring', '0', '', '0', '', '0', '1795419039163936769,1796439829787398145', 2,NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "role_name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "role_code" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "home_path" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(120) COLLATE "pg_catalog"."default",
  "create_by" varchar(30) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(30) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."role_code" IS '角色编码';
COMMENT ON COLUMN "public"."sys_role"."sort" IS '排序顺序';
COMMENT ON COLUMN "public"."sys_role"."status" IS '角色状态（1正常 0停用）';
COMMENT ON COLUMN "public"."sys_role"."home_path" IS '首页路由地址';
COMMENT ON COLUMN "public"."sys_role"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_role"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_role"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_role" IS '角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES ('173', '测试', 'test', 1, '1', '', '测试角色', 'admin', '2024-04-18 15:53:42', 'admin', '2024-05-02 15:48:58');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "role_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "menu_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "create_by" varchar(30) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(30) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role_menu"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_role_menu"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_menu"."menu_id" IS '菜单ID';
COMMENT ON COLUMN "public"."sys_role_menu"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_role_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role_menu"."update_by" IS '修改者';
COMMENT ON COLUMN "public"."sys_role_menu"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_role_menu" IS '角色菜单关系表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO "public"."sys_role_menu" VALUES ('1800798998938226690', '173', '2042', 'admin', '2024-06-12 15:55:13.231', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1800798998938226691', '173', '2072', 'admin', '2024-06-12 15:55:13.231', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1800798998938226692', '173', '3068', 'admin', '2024-06-12 15:55:13.231', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1800798998938226693', '173', '2069', 'admin', '2024-06-12 15:55:13.231', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1800798998975975425', '173', '3059', 'admin', '2024-06-12 15:55:13.241', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1800798998975975426', '173', '3060', 'admin', '2024-06-12 15:55:13.242', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1800798998988558338', '173', '3015', 'admin', '2024-06-12 15:55:13.243', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "dept_id" varchar(64) COLLATE "pg_catalog"."default",
  "username" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "nick_name" varchar(30) COLLATE "pg_catalog"."default",
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "home_path" varchar(255) COLLATE "pg_catalog"."default",
  "phone" char(11) COLLATE "pg_catalog"."default",
  "email" varchar(35) COLLATE "pg_catalog"."default",
  "gender" char(1) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default",
  "remark" varchar(120) COLLATE "pg_catalog"."default",
  "sort" int4,
  "create_by" varchar(30) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(30) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_user"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_user"."dept_id" IS '部门ID';
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."nick_name" IS '昵称';
COMMENT ON COLUMN "public"."sys_user"."avatar" IS '头像地址';
COMMENT ON COLUMN "public"."sys_user"."home_path" IS '首页路由地址';
COMMENT ON COLUMN "public"."sys_user"."phone" IS '电话（手机号）';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."gender" IS '性别（1男 0女）';
COMMENT ON COLUMN "public"."sys_user"."status" IS '账号状态（1正常 0锁定）';
COMMENT ON COLUMN "public"."sys_user"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_user"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_user"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."update_by" IS '修改者';
COMMENT ON COLUMN "public"."sys_user"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_user" IS '系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES ('57', NULL, 'admin', '$2a$10$Jc9ytizwSRL/nVR6.NGDfOpTgAl0Kwh8BhPhM7/1BmbKLtnsjgOFa', '系统管理员', 'public/2024/05/24/hbg0276.jpg', NULL, '18800000000', '32132@qq.com', '1', '1', NULL, 0, NULL, '2024-05-24 09:15:38', 'admin', '2024-05-24 17:47:42');
INSERT INTO "public"."sys_user" VALUES ('1800799163996672001', '271', 'test', '$2a$10$.y5fzz0PCqygP3kx/MEiguH0.H6a4zXxSnVAoZBLZfG7GJMfv0G6C', '测试用户', NULL, '', '18566666666', '', '1', '1', '密码：123456', 1, 'admin', '2024-06-12 15:55:52.584', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "role_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "create_by" varchar(30) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(30) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_user_role"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_user_role"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user_role"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_user_role"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_user_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user_role"."update_by" IS '修改者';
COMMENT ON COLUMN "public"."sys_user_role"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_user_role" IS '用户和角色关系表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO "public"."sys_user_role" VALUES ('1800799181268815874', '1800799163996672001', '173', 'admin', '2024-06-12 15:55:56.708', NULL, NULL);

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dict_data
-- ----------------------------
ALTER TABLE "public"."sys_dict_data" ADD CONSTRAINT "sys_dict_data_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_dict_type
-- ----------------------------
CREATE UNIQUE INDEX "type_code" ON "public"."sys_dict_type" USING btree (
  "type_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_dict_type
-- ----------------------------
ALTER TABLE "public"."sys_dict_type" ADD CONSTRAINT "sys_dict_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_log_login
-- ----------------------------
ALTER TABLE "public"."sys_log_login" ADD CONSTRAINT "sys_log_login_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_log_operate
-- ----------------------------
ALTER TABLE "public"."sys_log_operate" ADD CONSTRAINT "sys_log_operate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_pkey" PRIMARY KEY ("id");
