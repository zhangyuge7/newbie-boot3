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

 Date: 27/05/2024 18:39:49
*/


-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "id" int8 NOT NULL,
  "dept_name" varchar(30) COLLATE "pg_catalog"."default",
  "parent_id" int8,
  "ancestors" varchar(255) COLLATE "pg_catalog"."default",
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
INSERT INTO "public"."sys_dept" VALUES (270, '公司总部', 0, '270', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 1, NULL, '描述信息', 'admin', '2023-11-28 19:42:59', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES (271, '山东分公司', 270, '270,271', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:43:42', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES (272, '河南分公司', 270, '270,272', 2, '李四', '13566666666', 'lisi@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:46:35', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES (273, '云南分公司', 270, '270,273', 3, '王五', '13566666666', 'wangwu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:00', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES (274, '河北分公司', 270, '270,274', 4, '赵六', '13599999999', 'zhaoliu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:55', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES (275, '东营分部', 271, '270,271,275', 2, '悟空', '13234435454', 'wukong@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:53:38', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES (276, '济南分部', 271, '270,271,276', 1, '八戒', '15543547357', 'bajie@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:55:25', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES (277, '昆明分部', 273, '270,273,277', 1, '三藏', '16546273436', 'sanzang@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:56:21', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES (278, '济宁分部', 271, '270,271,278', 4, '阿虎', '16323242332', 'ahu@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:57:47', 'admin', '2023-11-28 20:57:50');
INSERT INTO "public"."sys_dept" VALUES (279, '菏泽分部', 271, '270,271,279', 5, '石头', '16767466463', 'shitou@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:58:35', 'admin', '2023-11-28 20:57:50');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_data";
CREATE TABLE "public"."sys_dict_data" (
  "id" int8 NOT NULL,
  "label" varchar(30) COLLATE "pg_catalog"."default",
  "value" varchar(10) COLLATE "pg_catalog"."default",
  "type_id" int8,
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
INSERT INTO "public"."sys_dict_data" VALUES (16, '女', '0', 33, 'danger', NULL, '1', 'N', 1, '', NULL, '2024-02-21 17:10:58', NULL, '2024-03-09 22:38:57');
INSERT INTO "public"."sys_dict_data" VALUES (19, '男', '1', 33, 'primary', NULL, '1', 'N', 2, '', NULL, '2024-03-09 13:28:37', NULL, '2024-03-09 23:16:49');
INSERT INTO "public"."sys_dict_data" VALUES (20, '正常', '1', 35, 'primary', NULL, '1', 'Y', 1, '', NULL, '2024-03-09 21:02:49', NULL, '2024-03-09 23:16:45');
INSERT INTO "public"."sys_dict_data" VALUES (21, '锁定', '0', 35, 'info', NULL, '1', 'N', 2, '', NULL, '2024-03-09 21:02:59', NULL, '2024-03-09 22:36:03');
INSERT INTO "public"."sys_dict_data" VALUES (22, '正常', '1', 37, 'primary', 'status-enable status-box', '1', 'Y', 1, '', NULL, '2024-03-09 21:34:07', 'admin', '2024-04-18 14:55:10');
INSERT INTO "public"."sys_dict_data" VALUES (23, '禁用', '0', 37, 'info', 'status-disabled status-box', '1', 'N', 2, '', NULL, '2024-03-09 21:34:15', NULL, '2024-03-21 18:14:12');
INSERT INTO "public"."sys_dict_data" VALUES (25, '未知', '2', 33, 'warning', NULL, '1', 'Y', 3, '', NULL, '2024-03-09 22:24:30', NULL, '2024-03-09 22:37:53');
INSERT INTO "public"."sys_dict_data" VALUES (26, 'primary', 'primary', 38, 'primary', '', '1', 'Y', 1, '', NULL, '2024-03-09 22:53:21', 'admin', '2024-04-18 14:48:24');
INSERT INTO "public"."sys_dict_data" VALUES (27, 'success', 'success', 38, 'success', '', '1', 'N', 2, '', NULL, '2024-03-09 22:53:30', NULL, '2024-03-09 23:17:28');
INSERT INTO "public"."sys_dict_data" VALUES (28, 'info', 'info', 38, 'info', '', '1', 'N', 3, '', NULL, '2024-03-09 22:53:39', NULL, '2024-03-09 23:17:33');
INSERT INTO "public"."sys_dict_data" VALUES (29, 'warning', 'warning', 38, 'warning', '', '1', 'N', 4, '', NULL, '2024-03-09 22:53:46', NULL, '2024-03-09 23:17:36');
INSERT INTO "public"."sys_dict_data" VALUES (30, 'danger', 'danger', 38, 'danger', '', '1', 'N', 5, '', NULL, '2024-03-09 22:53:54', NULL, '2024-03-09 23:17:40');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_type";
CREATE TABLE "public"."sys_dict_type" (
  "id" int8 NOT NULL,
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
INSERT INTO "public"."sys_dict_type" VALUES (33, '用户性别', 'userGender', '1', 2, '', 'admin', '2024-02-21 17:10:39', 'admin', '2024-03-09 22:03:41');
INSERT INTO "public"."sys_dict_type" VALUES (35, '用户状态', 'userStatus', '1', 3, '', 'admin', '2024-03-09 21:02:27', 'admin', '2024-03-09 22:50:28');
INSERT INTO "public"."sys_dict_type" VALUES (37, '通用状态', 'commonStatus', '1', 1, '通用状态', 'admin', '2024-03-09 21:32:14', 'admin', '2024-04-30 21:48:51');
INSERT INTO "public"."sys_dict_type" VALUES (38, '元素类型', 'eleType', '1', 4, '元素类型', 'admin', '2024-03-09 22:52:58', 'admin', '2024-03-10 13:41:31');

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log_login";
CREATE TABLE "public"."sys_log_login" (
  "id" int8 NOT NULL,
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
INSERT INTO "public"."sys_log_login" VALUES (30, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 673, '2024-05-20 18:36:45', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (31, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 10, '2024-05-20 18:36:59', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (32, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 78, '2024-05-20 18:37:08', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (33, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 5, '2024-05-20 18:37:13', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (34, '0', '192.168.2.102', 'username', '验证码已失效', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 300, '2024-05-20 18:38:16', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (35, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 1276, '2024-05-20 18:39:01', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (36, '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 24, '2024-05-20 18:42:48', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (37, '1', '192.168.124.27', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 2000, '2024-05-21 09:38:51', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (38, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 1827, '2024-05-23 14:08:28', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (39, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 46, '2024-05-24 09:10:32', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (40, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 135, '2024-05-24 09:10:35', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (41, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 5, '2024-05-24 09:11:51', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (42, '0', '192.168.50.45', 'username', '验证码不正确', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 3, '2024-05-24 09:11:55', '1', 'admin2');
INSERT INTO "public"."sys_log_login" VALUES (43, '0', '192.168.50.45', 'username', '用户不存在', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 4, '2024-05-24 09:12:21', '1', 'admin2');
INSERT INTO "public"."sys_log_login" VALUES (44, '0', '192.168.50.45', 'username', '验证码已失效', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 2, '2024-05-24 09:12:37', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (45, '0', '192.168.50.45', 'username', '密码错误', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 92, '2024-05-24 09:12:41', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (46, '0', '192.168.50.45', 'username', '验证码已失效', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 2, '2024-05-24 09:13:30', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (47, '0', '192.168.50.45', 'username', '密码错误', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 111, '2024-05-24 09:13:34', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (54, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 78, '2024-05-24 14:25:14', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (55, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 124, '2024-05-24 14:25:18', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (56, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 82, '2024-05-24 14:50:24', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (57, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 77, '2024-05-24 14:50:36', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (58, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 76, '2024-05-24 14:51:08', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (59, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 0, '2024-05-24 14:51:49', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (60, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 81, '2024-05-24 14:51:53', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (61, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 0, '2024-05-24 14:52:15', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (62, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 79, '2024-05-24 14:52:18', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (63, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 5, '2024-05-24 14:52:24', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (64, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 74, '2024-05-24 14:52:26', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (65, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 9, '2024-05-24 15:05:36', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (66, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 79, '2024-05-24 15:05:39', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (67, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 9, '2024-05-24 15:05:47', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (68, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 70, '2024-05-24 15:05:49', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (69, '0', '192.168.50.45', 'username', '密码错误', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 1026, '2024-05-24 15:23:27', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (70, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 489, '2024-05-24 15:23:35', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (71, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 8, '2024-05-24 15:24:04', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (72, '0', '192.168.50.45', 'username', '验证码不正确', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 1, '2024-05-24 15:24:06', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (73, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 101, '2024-05-24 15:24:10', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (74, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 10, '2024-05-24 15:24:37', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (75, '0', '192.168.50.45', 'username', '密码错误', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 101, '2024-05-24 15:24:50', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (76, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 109, '2024-05-24 15:24:54', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (77, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 6, '2024-05-24 15:25:28', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (78, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 159, '2024-05-24 15:25:30', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (79, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 16, '2024-05-24 15:25:40', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (80, '0', '192.168.50.45', 'username', '验证码不正确', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 1, '2024-05-24 15:25:42', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (81, '0', '192.168.50.45', 'username', '验证码不正确', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 2, '2024-05-24 15:25:44', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (82, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 110, '2024-05-24 15:25:47', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (83, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 5, '2024-05-24 15:26:13', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (84, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 103, '2024-05-24 15:26:19', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (85, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 42, '2024-05-24 15:55:52', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (86, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 122, '2024-05-24 15:55:54', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (87, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 5, '2024-05-24 15:56:29', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (88, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 80, '2024-05-24 15:56:32', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (89, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 18, '2024-05-24 17:24:55', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (90, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 179, '2024-05-24 17:24:58', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (91, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 4, '2024-05-24 17:35:58', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (92, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 107, '2024-05-24 17:36:00', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (93, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 6, '2024-05-24 17:36:29', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (94, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 150, '2024-05-24 17:36:33', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (95, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 21, '2024-05-24 17:46:53', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (96, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 150, '2024-05-24 17:46:56', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (97, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 5, '2024-05-24 17:47:17', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (98, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 132, '2024-05-24 17:47:19', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (99, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 7, '2024-05-24 17:47:43', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (100, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 110, '2024-05-24 17:47:46', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (101, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 1236, '2024-05-25 09:35:05', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (102, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 329, '2024-05-25 09:57:03', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (103, '0', '192.168.50.45', 'username', '验证码已失效', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 403, '2024-05-25 10:05:32', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (104, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 683, '2024-05-25 10:05:36', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (105, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 9, '2024-05-25 10:06:42', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (106, '0', '192.168.50.45', 'username', '验证码已失效', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 515, '2024-05-25 10:09:27', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (107, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 543, '2024-05-25 10:09:31', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (108, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 9, '2024-05-25 10:09:46', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (109, '0', '192.168.50.45', 'username', '验证码已失效', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 293, '2024-05-25 10:20:12', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (110, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 457, '2024-05-25 10:20:17', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (111, '0', '192.168.50.45', 'username', '验证码已失效', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 25, '2024-05-25 11:12:11', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (112, '1', '192.168.50.45', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 384, '2024-05-25 11:13:04', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (113, '1', '192.168.31.157', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 212, '2024-05-27 18:33:01', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES (114, '1', '192.168.31.157', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(125.0.0.0)', 628, '2024-05-27 18:33:07', '1', 'admin');

-- ----------------------------
-- Table structure for sys_log_operate
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log_operate";
CREATE TABLE "public"."sys_log_operate" (
  "id" int8 NOT NULL,
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
INSERT INTO "public"."sys_log_operate" VALUES (616, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 15, '2024-05-19 21:11:43');
INSERT INTO "public"."sys_log_operate" VALUES (617, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/deleteBatch', 'com.newbie.controller.system.SysLogOperateController.deleteBatch', 'POST', 14, '2024-05-19 21:11:46');
INSERT INTO "public"."sys_log_operate" VALUES (618, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-19 21:11:46');
INSERT INTO "public"."sys_log_operate" VALUES (619, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 6, '2024-05-19 21:11:51');
INSERT INTO "public"."sys_log_operate" VALUES (620, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-19 21:11:54');
INSERT INTO "public"."sys_log_operate" VALUES (621, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 0, '2024-05-19 21:12:11');
INSERT INTO "public"."sys_log_operate" VALUES (622, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-19 21:12:12');
INSERT INTO "public"."sys_log_operate" VALUES (623, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 19, '2024-05-19 21:12:37');
INSERT INTO "public"."sys_log_operate" VALUES (624, 'admin', '1', NULL, '192.168.2.104', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 12, '2024-05-19 21:12:51');
INSERT INTO "public"."sys_log_operate" VALUES (625, 'admin', '1', NULL, '192.168.2.104', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 25, '2024-05-19 21:12:51');
INSERT INTO "public"."sys_log_operate" VALUES (626, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-19 21:12:52');
INSERT INTO "public"."sys_log_operate" VALUES (627, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 7, '2024-05-19 21:13:05');
INSERT INTO "public"."sys_log_operate" VALUES (628, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-19 21:13:07');
INSERT INTO "public"."sys_log_operate" VALUES (629, 'admin', '1', NULL, '192.168.2.104', '/security/userInfo', 'com.newbie.controller.security.SecurityController.userInfo', 'GET', 347, '2024-05-19 21:19:44');
INSERT INTO "public"."sys_log_operate" VALUES (630, 'admin', '1', NULL, '192.168.2.104', '/security/menus', 'com.newbie.controller.security.SecurityController.menus', 'GET', 154, '2024-05-19 21:19:45');
INSERT INTO "public"."sys_log_operate" VALUES (631, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 122, '2024-05-19 21:20:01');
INSERT INTO "public"."sys_log_operate" VALUES (632, 'admin', '1', NULL, '192.168.2.104', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 21, '2024-05-19 21:20:29');
INSERT INTO "public"."sys_log_operate" VALUES (633, 'admin', '1', NULL, '192.168.2.104', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 14, '2024-05-19 21:20:33');
INSERT INTO "public"."sys_log_operate" VALUES (634, 'admin', '1', NULL, '192.168.2.104', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 10, '2024-05-19 21:20:37');
INSERT INTO "public"."sys_log_operate" VALUES (635, 'admin', '1', NULL, '192.168.2.104', '/system/menu/add', 'com.newbie.controller.system.SysMenuController.add', 'POST', 23, '2024-05-19 21:21:05');
INSERT INTO "public"."sys_log_operate" VALUES (636, 'admin', '1', NULL, '192.168.2.104', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 14, '2024-05-19 21:21:05');
INSERT INTO "public"."sys_log_operate" VALUES (637, 'admin', '1', NULL, '192.168.2.104', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 28, '2024-05-19 21:26:45');
INSERT INTO "public"."sys_log_operate" VALUES (638, 'admin', '1', NULL, '192.168.2.104', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 17, '2024-05-19 21:26:46');
INSERT INTO "public"."sys_log_operate" VALUES (639, 'admin', '1', NULL, '192.168.2.104', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 23, '2024-05-19 21:26:46');
INSERT INTO "public"."sys_log_operate" VALUES (640, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 21, '2024-05-19 21:26:46');
INSERT INTO "public"."sys_log_operate" VALUES (641, 'admin', '1', NULL, '192.168.2.104', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 31, '2024-05-19 21:26:47');
INSERT INTO "public"."sys_log_operate" VALUES (842, '#', '0', '用户不存在', '192.168.50.45', '/security/login', 'com.newbie.controller.security.SecurityController.login', 'POST', 9, '2024-05-20 16:01:52');
INSERT INTO "public"."sys_log_operate" VALUES (843, '#', '0', '验证码已失效', '192.168.50.45', '/security/login', 'com.newbie.controller.security.SecurityController.login', 'POST', 1, '2024-05-20 16:01:54');
INSERT INTO "public"."sys_log_operate" VALUES (844, '#', '0', '密码错误', '192.168.50.45', '/security/login', 'com.newbie.controller.security.SecurityController.login', 'POST', 108, '2024-05-20 16:01:59');
INSERT INTO "public"."sys_log_operate" VALUES (845, '#', '0', '密码错误', '192.168.50.45', '/security/login', 'com.newbie.controller.security.SecurityController.login', 'POST', 86, '2024-05-20 16:02:05');
INSERT INTO "public"."sys_log_operate" VALUES (846, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 179, '2024-05-21 09:42:41');
INSERT INTO "public"."sys_log_operate" VALUES (847, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 23, '2024-05-21 09:42:52');
INSERT INTO "public"."sys_log_operate" VALUES (848, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 21, '2024-05-21 09:42:52');
INSERT INTO "public"."sys_log_operate" VALUES (849, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 16, '2024-05-21 09:43:22');
INSERT INTO "public"."sys_log_operate" VALUES (850, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/deleteBeforeData', 'com.newbie.controller.system.SysLogOperateController.deleteBeforeData', 'GET', 19, '2024-05-21 09:43:38');
INSERT INTO "public"."sys_log_operate" VALUES (851, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 13, '2024-05-21 09:43:38');
INSERT INTO "public"."sys_log_operate" VALUES (852, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 16, '2024-05-21 09:43:51');
INSERT INTO "public"."sys_log_operate" VALUES (853, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-21 09:43:54');
INSERT INTO "public"."sys_log_operate" VALUES (854, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 13, '2024-05-21 09:47:44');
INSERT INTO "public"."sys_log_operate" VALUES (855, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 158, '2024-05-23 14:18:56');
INSERT INTO "public"."sys_log_operate" VALUES (856, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 8, '2024-05-23 14:19:02');
INSERT INTO "public"."sys_log_operate" VALUES (857, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-23 14:19:08');
INSERT INTO "public"."sys_log_operate" VALUES (858, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 307, '2024-05-23 14:19:41');
INSERT INTO "public"."sys_log_operate" VALUES (859, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 16, '2024-05-23 14:19:47');
INSERT INTO "public"."sys_log_operate" VALUES (860, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 9, '2024-05-23 14:19:50');
INSERT INTO "public"."sys_log_operate" VALUES (861, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-23 14:19:50');
INSERT INTO "public"."sys_log_operate" VALUES (862, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 17, '2024-05-23 14:19:51');
INSERT INTO "public"."sys_log_operate" VALUES (863, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 274, '2024-05-23 14:20:34');
INSERT INTO "public"."sys_log_operate" VALUES (864, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 174, '2024-05-23 14:33:45');
INSERT INTO "public"."sys_log_operate" VALUES (865, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-23 14:33:46');
INSERT INTO "public"."sys_log_operate" VALUES (866, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 4, '2024-05-23 14:33:48');
INSERT INTO "public"."sys_log_operate" VALUES (867, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 18, '2024-05-23 14:33:49');
INSERT INTO "public"."sys_log_operate" VALUES (868, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-23 14:33:49');
INSERT INTO "public"."sys_log_operate" VALUES (869, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 13, '2024-05-23 14:33:50');
INSERT INTO "public"."sys_log_operate" VALUES (870, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 8, '2024-05-23 14:33:51');
INSERT INTO "public"."sys_log_operate" VALUES (871, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 9, '2024-05-23 14:33:51');
INSERT INTO "public"."sys_log_operate" VALUES (872, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-23 14:33:52');
INSERT INTO "public"."sys_log_operate" VALUES (873, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 8, '2024-05-23 14:33:52');
INSERT INTO "public"."sys_log_operate" VALUES (874, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-23 14:33:53');
INSERT INTO "public"."sys_log_operate" VALUES (875, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-23 14:33:54');
INSERT INTO "public"."sys_log_operate" VALUES (876, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 14, '2024-05-23 14:33:54');
INSERT INTO "public"."sys_log_operate" VALUES (877, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 8, '2024-05-23 14:33:55');
INSERT INTO "public"."sys_log_operate" VALUES (878, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-23 14:33:55');
INSERT INTO "public"."sys_log_operate" VALUES (879, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 174, '2024-05-24 09:10:21');
INSERT INTO "public"."sys_log_operate" VALUES (880, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 14, '2024-05-24 09:10:35');
INSERT INTO "public"."sys_log_operate" VALUES (881, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 09:13:45');
INSERT INTO "public"."sys_log_operate" VALUES (882, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 14, '2024-05-24 09:13:48');
INSERT INTO "public"."sys_log_operate" VALUES (883, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 41, '2024-05-24 09:13:48');
INSERT INTO "public"."sys_log_operate" VALUES (884, '#', '1', NULL, '192.168.50.45', '/security/initAdmin', 'com.newbie.controller.security.SecurityController.initAdmin', 'POST', 150, '2024-05-24 09:15:38');
INSERT INTO "public"."sys_log_operate" VALUES (885, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 6, '2024-05-24 09:15:46');
INSERT INTO "public"."sys_log_operate" VALUES (886, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 24, '2024-05-24 09:15:46');
INSERT INTO "public"."sys_log_operate" VALUES (887, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 5, '2024-05-24 09:16:10');
INSERT INTO "public"."sys_log_operate" VALUES (888, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 17, '2024-05-24 09:16:17');
INSERT INTO "public"."sys_log_operate" VALUES (889, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 31, '2024-05-24 09:16:17');
INSERT INTO "public"."sys_log_operate" VALUES (890, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 5, '2024-05-24 09:16:18');
INSERT INTO "public"."sys_log_operate" VALUES (891, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 15, '2024-05-24 09:16:26');
INSERT INTO "public"."sys_log_operate" VALUES (892, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 14, '2024-05-24 09:16:26');
INSERT INTO "public"."sys_log_operate" VALUES (893, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 18, '2024-05-24 09:16:28');
INSERT INTO "public"."sys_log_operate" VALUES (894, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 41, '2024-05-24 09:16:30');
INSERT INTO "public"."sys_log_operate" VALUES (895, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 20, '2024-05-24 09:16:33');
INSERT INTO "public"."sys_log_operate" VALUES (896, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 09:16:34');
INSERT INTO "public"."sys_log_operate" VALUES (897, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 180, '2024-05-24 09:17:25');
INSERT INTO "public"."sys_log_operate" VALUES (898, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 15, '2024-05-24 09:17:45');
INSERT INTO "public"."sys_log_operate" VALUES (899, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/deleteBeforeData', 'com.newbie.controller.system.SysLogOperateController.deleteBeforeData', 'GET', 9, '2024-05-24 09:17:57');
INSERT INTO "public"."sys_log_operate" VALUES (900, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 19, '2024-05-24 09:17:57');
INSERT INTO "public"."sys_log_operate" VALUES (901, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 09:18:04');
INSERT INTO "public"."sys_log_operate" VALUES (902, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 15, '2024-05-24 09:18:06');
INSERT INTO "public"."sys_log_operate" VALUES (903, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 32, '2024-05-24 09:19:05');
INSERT INTO "public"."sys_log_operate" VALUES (904, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 22, '2024-05-24 09:19:05');
INSERT INTO "public"."sys_log_operate" VALUES (905, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 17, '2024-05-24 09:19:05');
INSERT INTO "public"."sys_log_operate" VALUES (906, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 9, '2024-05-24 09:19:13');
INSERT INTO "public"."sys_log_operate" VALUES (907, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 15, '2024-05-24 09:19:19');
INSERT INTO "public"."sys_log_operate" VALUES (908, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 6, '2024-05-24 09:19:25');
INSERT INTO "public"."sys_log_operate" VALUES (909, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 23, '2024-05-24 09:19:25');
INSERT INTO "public"."sys_log_operate" VALUES (910, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 9, '2024-05-24 09:53:37');
INSERT INTO "public"."sys_log_operate" VALUES (911, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 22, '2024-05-24 09:53:37');
INSERT INTO "public"."sys_log_operate" VALUES (912, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 7, '2024-05-24 09:54:15');
INSERT INTO "public"."sys_log_operate" VALUES (913, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 6, '2024-05-24 09:54:21');
INSERT INTO "public"."sys_log_operate" VALUES (914, 'admin', '1', NULL, '192.168.50.45', '/system/menu/update', 'com.newbie.controller.system.SysMenuController.update', 'POST', 29, '2024-05-24 09:54:32');
INSERT INTO "public"."sys_log_operate" VALUES (915, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 6, '2024-05-24 09:54:32');
INSERT INTO "public"."sys_log_operate" VALUES (916, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 9, '2024-05-24 09:56:58');
INSERT INTO "public"."sys_log_operate" VALUES (917, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 7, '2024-05-24 09:57:04');
INSERT INTO "public"."sys_log_operate" VALUES (918, 'admin', '1', NULL, '192.168.50.45', '/system/menu/update', 'com.newbie.controller.system.SysMenuController.update', 'POST', 19, '2024-05-24 09:57:13');
INSERT INTO "public"."sys_log_operate" VALUES (919, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 0, '2024-05-24 09:57:13');
INSERT INTO "public"."sys_log_operate" VALUES (920, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 10, '2024-05-24 10:11:41');
INSERT INTO "public"."sys_log_operate" VALUES (921, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 19, '2024-05-24 10:11:42');
INSERT INTO "public"."sys_log_operate" VALUES (922, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 5, '2024-05-24 10:11:43');
INSERT INTO "public"."sys_log_operate" VALUES (923, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 15, '2024-05-24 10:11:43');
INSERT INTO "public"."sys_log_operate" VALUES (924, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 13, '2024-05-24 10:11:47');
INSERT INTO "public"."sys_log_operate" VALUES (925, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 11, '2024-05-24 10:11:52');
INSERT INTO "public"."sys_log_operate" VALUES (926, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 15, '2024-05-24 10:11:52');
INSERT INTO "public"."sys_log_operate" VALUES (927, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 4, '2024-05-24 10:13:12');
INSERT INTO "public"."sys_log_operate" VALUES (928, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 16, '2024-05-24 10:13:12');
INSERT INTO "public"."sys_log_operate" VALUES (929, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 12, '2024-05-24 10:13:20');
INSERT INTO "public"."sys_log_operate" VALUES (930, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 5, '2024-05-24 10:13:22');
INSERT INTO "public"."sys_log_operate" VALUES (931, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 15, '2024-05-24 10:13:22');
INSERT INTO "public"."sys_log_operate" VALUES (932, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 13, '2024-05-24 10:14:16');
INSERT INTO "public"."sys_log_operate" VALUES (933, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 10, '2024-05-24 10:14:16');
INSERT INTO "public"."sys_log_operate" VALUES (934, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-24 10:14:17');
INSERT INTO "public"."sys_log_operate" VALUES (935, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-24 10:14:19');
INSERT INTO "public"."sys_log_operate" VALUES (936, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-24 10:14:29');
INSERT INTO "public"."sys_log_operate" VALUES (937, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 12, '2024-05-24 10:14:30');
INSERT INTO "public"."sys_log_operate" VALUES (938, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 23, '2024-05-24 10:18:19');
INSERT INTO "public"."sys_log_operate" VALUES (939, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 8, '2024-05-24 10:18:20');
INSERT INTO "public"."sys_log_operate" VALUES (940, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 24, '2024-05-24 10:19:23');
INSERT INTO "public"."sys_log_operate" VALUES (941, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 14, '2024-05-24 10:19:40');
INSERT INTO "public"."sys_log_operate" VALUES (942, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 12, '2024-05-24 10:19:54');
INSERT INTO "public"."sys_log_operate" VALUES (943, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 16, '2024-05-24 10:19:57');
INSERT INTO "public"."sys_log_operate" VALUES (944, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 4, '2024-05-24 10:20:07');
INSERT INTO "public"."sys_log_operate" VALUES (945, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 17, '2024-05-24 10:20:19');
INSERT INTO "public"."sys_log_operate" VALUES (946, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 12, '2024-05-24 10:28:52');
INSERT INTO "public"."sys_log_operate" VALUES (947, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 14, '2024-05-24 10:30:00');
INSERT INTO "public"."sys_log_operate" VALUES (948, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 11, '2024-05-24 10:30:09');
INSERT INTO "public"."sys_log_operate" VALUES (949, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 17, '2024-05-24 10:30:30');
INSERT INTO "public"."sys_log_operate" VALUES (950, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 15, '2024-05-24 10:30:46');
INSERT INTO "public"."sys_log_operate" VALUES (951, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 20, '2024-05-24 10:30:52');
INSERT INTO "public"."sys_log_operate" VALUES (952, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 7, '2024-05-24 10:30:53');
INSERT INTO "public"."sys_log_operate" VALUES (953, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 7, '2024-05-24 10:30:53');
INSERT INTO "public"."sys_log_operate" VALUES (954, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 4, '2024-05-24 10:30:53');
INSERT INTO "public"."sys_log_operate" VALUES (955, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 14, '2024-05-24 10:30:57');
INSERT INTO "public"."sys_log_operate" VALUES (956, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 27, '2024-05-24 10:30:57');
INSERT INTO "public"."sys_log_operate" VALUES (957, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 9, '2024-05-24 10:30:59');
INSERT INTO "public"."sys_log_operate" VALUES (958, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 8, '2024-05-24 10:31:00');
INSERT INTO "public"."sys_log_operate" VALUES (959, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 10, '2024-05-24 10:31:08');
INSERT INTO "public"."sys_log_operate" VALUES (960, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 15, '2024-05-24 10:32:41');
INSERT INTO "public"."sys_log_operate" VALUES (961, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 14, '2024-05-24 10:32:49');
INSERT INTO "public"."sys_log_operate" VALUES (962, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 13, '2024-05-24 10:32:53');
INSERT INTO "public"."sys_log_operate" VALUES (963, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 8, '2024-05-24 10:32:54');
INSERT INTO "public"."sys_log_operate" VALUES (964, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 15, '2024-05-24 10:33:23');
INSERT INTO "public"."sys_log_operate" VALUES (965, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 9, '2024-05-24 10:34:28');
INSERT INTO "public"."sys_log_operate" VALUES (966, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 12, '2024-05-24 10:34:43');
INSERT INTO "public"."sys_log_operate" VALUES (967, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 16, '2024-05-24 10:37:12');
INSERT INTO "public"."sys_log_operate" VALUES (968, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 6, '2024-05-24 10:37:16');
INSERT INTO "public"."sys_log_operate" VALUES (969, 'admin', '1', NULL, '192.168.50.45', '/system/menu/update', 'com.newbie.controller.system.SysMenuController.update', 'POST', 19, '2024-05-24 10:37:20');
INSERT INTO "public"."sys_log_operate" VALUES (970, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 11, '2024-05-24 10:37:20');
INSERT INTO "public"."sys_log_operate" VALUES (971, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 7, '2024-05-24 10:37:26');
INSERT INTO "public"."sys_log_operate" VALUES (972, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 10, '2024-05-24 10:37:32');
INSERT INTO "public"."sys_log_operate" VALUES (973, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 463, '2024-05-24 10:41:54');
INSERT INTO "public"."sys_log_operate" VALUES (974, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 21, '2024-05-24 10:42:41');
INSERT INTO "public"."sys_log_operate" VALUES (975, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 10:42:59');
INSERT INTO "public"."sys_log_operate" VALUES (976, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 46, '2024-05-24 10:45:50');
INSERT INTO "public"."sys_log_operate" VALUES (977, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 8, '2024-05-24 10:45:55');
INSERT INTO "public"."sys_log_operate" VALUES (978, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 29, '2024-05-24 10:46:00');
INSERT INTO "public"."sys_log_operate" VALUES (979, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 8, '2024-05-24 10:46:06');
INSERT INTO "public"."sys_log_operate" VALUES (980, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 13, '2024-05-24 10:48:36');
INSERT INTO "public"."sys_log_operate" VALUES (981, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/deleteBatch', 'com.newbie.controller.system.SysLogLoginController.deleteBatch', 'POST', 19, '2024-05-24 10:49:20');
INSERT INTO "public"."sys_log_operate" VALUES (982, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 7, '2024-05-24 10:49:20');
INSERT INTO "public"."sys_log_operate" VALUES (983, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/deleteBatch', 'com.newbie.controller.system.SysLogLoginController.deleteBatch', 'POST', 11, '2024-05-24 10:49:31');
INSERT INTO "public"."sys_log_operate" VALUES (984, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 14, '2024-05-24 10:49:31');
INSERT INTO "public"."sys_log_operate" VALUES (985, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 6, '2024-05-24 10:49:37');
INSERT INTO "public"."sys_log_operate" VALUES (986, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 7, '2024-05-24 10:49:37');
INSERT INTO "public"."sys_log_operate" VALUES (987, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 5, '2024-05-24 10:49:38');
INSERT INTO "public"."sys_log_operate" VALUES (988, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 17, '2024-05-24 10:49:42');
INSERT INTO "public"."sys_log_operate" VALUES (989, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 8, '2024-05-24 10:49:43');
INSERT INTO "public"."sys_log_operate" VALUES (990, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 10:49:47');
INSERT INTO "public"."sys_log_operate" VALUES (991, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 10:49:48');
INSERT INTO "public"."sys_log_operate" VALUES (992, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 37, '2024-05-24 10:49:49');
INSERT INTO "public"."sys_log_operate" VALUES (993, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 17, '2024-05-24 10:49:52');
INSERT INTO "public"."sys_log_operate" VALUES (994, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 10:49:54');
INSERT INTO "public"."sys_log_operate" VALUES (995, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 10:49:55');
INSERT INTO "public"."sys_log_operate" VALUES (996, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 10:50:00');
INSERT INTO "public"."sys_log_operate" VALUES (997, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-24 10:50:02');
INSERT INTO "public"."sys_log_operate" VALUES (998, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 13, '2024-05-24 10:50:03');
INSERT INTO "public"."sys_log_operate" VALUES (999, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-24 10:50:04');
INSERT INTO "public"."sys_log_operate" VALUES (1000, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 10:50:06');
INSERT INTO "public"."sys_log_operate" VALUES (1001, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 7, '2024-05-24 10:50:22');
INSERT INTO "public"."sys_log_operate" VALUES (1002, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 8, '2024-05-24 10:50:23');
INSERT INTO "public"."sys_log_operate" VALUES (1003, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 10:50:24');
INSERT INTO "public"."sys_log_operate" VALUES (1004, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 14, '2024-05-24 10:50:24');
INSERT INTO "public"."sys_log_operate" VALUES (1005, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 2, '2024-05-24 10:50:25');
INSERT INTO "public"."sys_log_operate" VALUES (1006, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 21, '2024-05-24 10:50:27');
INSERT INTO "public"."sys_log_operate" VALUES (1007, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 10:50:28');
INSERT INTO "public"."sys_log_operate" VALUES (1008, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 3, '2024-05-24 10:50:29');
INSERT INTO "public"."sys_log_operate" VALUES (1009, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 21, '2024-05-24 10:50:29');
INSERT INTO "public"."sys_log_operate" VALUES (1010, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 10:50:30');
INSERT INTO "public"."sys_log_operate" VALUES (1011, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 10:50:34');
INSERT INTO "public"."sys_log_operate" VALUES (1012, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 17, '2024-05-24 10:50:34');
INSERT INTO "public"."sys_log_operate" VALUES (1013, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 5665, '2024-05-24 10:50:53');
INSERT INTO "public"."sys_log_operate" VALUES (1014, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 2270, '2024-05-24 10:50:57');
INSERT INTO "public"."sys_log_operate" VALUES (1015, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 16, '2024-05-24 10:51:22');
INSERT INTO "public"."sys_log_operate" VALUES (1016, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 18, '2024-05-24 10:51:23');
INSERT INTO "public"."sys_log_operate" VALUES (1017, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 3, '2024-05-24 10:51:24');
INSERT INTO "public"."sys_log_operate" VALUES (1018, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 3, '2024-05-24 10:51:25');
INSERT INTO "public"."sys_log_operate" VALUES (1019, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 10:51:25');
INSERT INTO "public"."sys_log_operate" VALUES (1020, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 20, '2024-05-24 10:51:30');
INSERT INTO "public"."sys_log_operate" VALUES (1021, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 4, '2024-05-24 10:51:31');
INSERT INTO "public"."sys_log_operate" VALUES (1022, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 16, '2024-05-24 10:51:43');
INSERT INTO "public"."sys_log_operate" VALUES (1023, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 15, '2024-05-24 10:51:51');
INSERT INTO "public"."sys_log_operate" VALUES (1024, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 8, '2024-05-24 10:51:52');
INSERT INTO "public"."sys_log_operate" VALUES (1025, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 10:51:53');
INSERT INTO "public"."sys_log_operate" VALUES (1026, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 10:51:53');
INSERT INTO "public"."sys_log_operate" VALUES (1027, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 10:52:30');
INSERT INTO "public"."sys_log_operate" VALUES (1028, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 24, '2024-05-24 10:55:36');
INSERT INTO "public"."sys_log_operate" VALUES (1029, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 16, '2024-05-24 10:55:41');
INSERT INTO "public"."sys_log_operate" VALUES (1030, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 10:55:42');
INSERT INTO "public"."sys_log_operate" VALUES (1031, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 10:55:43');
INSERT INTO "public"."sys_log_operate" VALUES (1032, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 15, '2024-05-24 10:55:44');
INSERT INTO "public"."sys_log_operate" VALUES (1033, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 6, '2024-05-24 10:55:44');
INSERT INTO "public"."sys_log_operate" VALUES (1034, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 6, '2024-05-24 10:55:45');
INSERT INTO "public"."sys_log_operate" VALUES (1035, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 28, '2024-05-24 10:55:45');
INSERT INTO "public"."sys_log_operate" VALUES (1036, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 6, '2024-05-24 10:55:46');
INSERT INTO "public"."sys_log_operate" VALUES (1037, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 15873, '2024-05-24 10:56:21');
INSERT INTO "public"."sys_log_operate" VALUES (1038, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-24 10:56:59');
INSERT INTO "public"."sys_log_operate" VALUES (1039, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 355, '2024-05-24 10:57:38');
INSERT INTO "public"."sys_log_operate" VALUES (1040, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 15175, '2024-05-24 10:58:02');
INSERT INTO "public"."sys_log_operate" VALUES (1041, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 40, '2024-05-24 10:58:06');
INSERT INTO "public"."sys_log_operate" VALUES (1042, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 17, '2024-05-24 10:58:07');
INSERT INTO "public"."sys_log_operate" VALUES (1043, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 10:58:08');
INSERT INTO "public"."sys_log_operate" VALUES (1044, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 15, '2024-05-24 10:58:09');
INSERT INTO "public"."sys_log_operate" VALUES (1045, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 16, '2024-05-24 10:58:10');
INSERT INTO "public"."sys_log_operate" VALUES (1046, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 20, '2024-05-24 10:58:10');
INSERT INTO "public"."sys_log_operate" VALUES (1047, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-24 10:58:11');
INSERT INTO "public"."sys_log_operate" VALUES (1048, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-24 10:58:12');
INSERT INTO "public"."sys_log_operate" VALUES (1049, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 14, '2024-05-24 10:58:12');
INSERT INTO "public"."sys_log_operate" VALUES (1050, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-24 10:58:13');
INSERT INTO "public"."sys_log_operate" VALUES (1051, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 10:58:15');
INSERT INTO "public"."sys_log_operate" VALUES (1052, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 9, '2024-05-24 10:58:15');
INSERT INTO "public"."sys_log_operate" VALUES (1053, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 10:58:17');
INSERT INTO "public"."sys_log_operate" VALUES (1054, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 5, '2024-05-24 10:58:17');
INSERT INTO "public"."sys_log_operate" VALUES (1055, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 13, '2024-05-24 10:58:18');
INSERT INTO "public"."sys_log_operate" VALUES (1056, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-24 10:58:19');
INSERT INTO "public"."sys_log_operate" VALUES (1057, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 13, '2024-05-24 10:58:28');
INSERT INTO "public"."sys_log_operate" VALUES (1058, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 14, '2024-05-24 10:59:10');
INSERT INTO "public"."sys_log_operate" VALUES (1059, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-24 10:59:11');
INSERT INTO "public"."sys_log_operate" VALUES (1060, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 21, '2024-05-24 10:59:12');
INSERT INTO "public"."sys_log_operate" VALUES (1061, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 9, '2024-05-24 10:59:12');
INSERT INTO "public"."sys_log_operate" VALUES (1062, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-24 10:59:13');
INSERT INTO "public"."sys_log_operate" VALUES (1063, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 4121, '2024-05-24 10:59:19');
INSERT INTO "public"."sys_log_operate" VALUES (1064, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 25, '2024-05-24 10:59:20');
INSERT INTO "public"."sys_log_operate" VALUES (1065, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 8, '2024-05-24 10:59:21');
INSERT INTO "public"."sys_log_operate" VALUES (1066, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 6, '2024-05-24 10:59:21');
INSERT INTO "public"."sys_log_operate" VALUES (1067, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 10:59:22');
INSERT INTO "public"."sys_log_operate" VALUES (1068, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 14, '2024-05-24 10:59:24');
INSERT INTO "public"."sys_log_operate" VALUES (1069, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 20, '2024-05-24 11:00:29');
INSERT INTO "public"."sys_log_operate" VALUES (1070, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 13, '2024-05-24 11:00:33');
INSERT INTO "public"."sys_log_operate" VALUES (1071, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 19, '2024-05-24 11:00:33');
INSERT INTO "public"."sys_log_operate" VALUES (1072, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 2, '2024-05-24 11:00:35');
INSERT INTO "public"."sys_log_operate" VALUES (1073, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 8, '2024-05-24 11:00:37');
INSERT INTO "public"."sys_log_operate" VALUES (1074, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 11, '2024-05-24 11:00:37');
INSERT INTO "public"."sys_log_operate" VALUES (1075, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 8, '2024-05-24 11:00:40');
INSERT INTO "public"."sys_log_operate" VALUES (1076, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 46, '2024-05-24 11:00:40');
INSERT INTO "public"."sys_log_operate" VALUES (1077, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 12, '2024-05-24 11:00:43');
INSERT INTO "public"."sys_log_operate" VALUES (1078, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 8, '2024-05-24 11:00:43');
INSERT INTO "public"."sys_log_operate" VALUES (1079, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 8, '2024-05-24 11:00:46');
INSERT INTO "public"."sys_log_operate" VALUES (1080, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 11, '2024-05-24 11:00:46');
INSERT INTO "public"."sys_log_operate" VALUES (1081, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 4, '2024-05-24 11:00:49');
INSERT INTO "public"."sys_log_operate" VALUES (1082, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 9, '2024-05-24 11:00:49');
INSERT INTO "public"."sys_log_operate" VALUES (1083, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 8, '2024-05-24 11:00:52');
INSERT INTO "public"."sys_log_operate" VALUES (1084, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 11, '2024-05-24 11:00:52');
INSERT INTO "public"."sys_log_operate" VALUES (1085, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 18, '2024-05-24 11:00:54');
INSERT INTO "public"."sys_log_operate" VALUES (1086, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 12, '2024-05-24 11:00:54');
INSERT INTO "public"."sys_log_operate" VALUES (1087, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 8, '2024-05-24 11:00:57');
INSERT INTO "public"."sys_log_operate" VALUES (1088, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 9, '2024-05-24 11:00:57');
INSERT INTO "public"."sys_log_operate" VALUES (1089, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 12, '2024-05-24 11:00:59');
INSERT INTO "public"."sys_log_operate" VALUES (1090, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 10, '2024-05-24 11:00:59');
INSERT INTO "public"."sys_log_operate" VALUES (1091, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 2, '2024-05-24 11:01:02');
INSERT INTO "public"."sys_log_operate" VALUES (1092, 'admin', '1', NULL, '192.168.50.45', '/system/role/add', 'com.newbie.controller.system.SysRoleController.add', 'POST', 10, '2024-05-24 11:01:04');
INSERT INTO "public"."sys_log_operate" VALUES (1093, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 10, '2024-05-24 11:01:04');
INSERT INTO "public"."sys_log_operate" VALUES (1094, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 12, '2024-05-24 11:01:06');
INSERT INTO "public"."sys_log_operate" VALUES (1095, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 12, '2024-05-24 11:01:09');
INSERT INTO "public"."sys_log_operate" VALUES (1096, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 9, '2024-05-24 11:01:12');
INSERT INTO "public"."sys_log_operate" VALUES (1097, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 15, '2024-05-24 11:01:15');
INSERT INTO "public"."sys_log_operate" VALUES (1098, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 10, '2024-05-24 11:01:16');
INSERT INTO "public"."sys_log_operate" VALUES (1099, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 14, '2024-05-24 11:01:21');
INSERT INTO "public"."sys_log_operate" VALUES (1100, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 13, '2024-05-24 11:01:25');
INSERT INTO "public"."sys_log_operate" VALUES (1101, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 13, '2024-05-24 11:01:26');
INSERT INTO "public"."sys_log_operate" VALUES (1102, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 10, '2024-05-24 11:01:28');
INSERT INTO "public"."sys_log_operate" VALUES (1103, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 13, '2024-05-24 11:01:30');
INSERT INTO "public"."sys_log_operate" VALUES (1104, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 23, '2024-05-24 11:01:30');
INSERT INTO "public"."sys_log_operate" VALUES (1105, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 12, '2024-05-24 11:01:32');
INSERT INTO "public"."sys_log_operate" VALUES (1106, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 5, '2024-05-24 11:01:33');
INSERT INTO "public"."sys_log_operate" VALUES (1107, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 12, '2024-05-24 11:01:33');
INSERT INTO "public"."sys_log_operate" VALUES (1108, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 15, '2024-05-24 11:01:53');
INSERT INTO "public"."sys_log_operate" VALUES (1109, 'admin', '1', NULL, '192.168.50.45', '/system/role/deleteBatch', 'com.newbie.controller.system.SysRoleController.deleteBatch', 'POST', 45, '2024-05-24 11:01:58');
INSERT INTO "public"."sys_log_operate" VALUES (1110, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 16, '2024-05-24 11:01:58');
INSERT INTO "public"."sys_log_operate" VALUES (1111, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 9, '2024-05-24 11:02:00');
INSERT INTO "public"."sys_log_operate" VALUES (1112, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 9, '2024-05-24 11:02:01');
INSERT INTO "public"."sys_log_operate" VALUES (1113, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 11, '2024-05-24 11:02:01');
INSERT INTO "public"."sys_log_operate" VALUES (1114, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 5, '2024-05-24 11:02:01');
INSERT INTO "public"."sys_log_operate" VALUES (1115, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 8, '2024-05-24 11:02:01');
INSERT INTO "public"."sys_log_operate" VALUES (1116, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 6, '2024-05-24 11:02:02');
INSERT INTO "public"."sys_log_operate" VALUES (1117, 'admin', '1', NULL, '192.168.50.45', '/system/role_menu/listByRoleId', 'com.newbie.controller.system.SysRoleMenuController.menuIdsByRoleId', 'GET', 5, '2024-05-24 11:02:05');
INSERT INTO "public"."sys_log_operate" VALUES (1118, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 13, '2024-05-24 11:02:05');
INSERT INTO "public"."sys_log_operate" VALUES (1119, 'admin', '1', NULL, '192.168.50.45', '/system/user_role/queryUnUserByRoleId/173', 'com.newbie.controller.system.SysUserRoleController.queryUnUserByRoleId', 'GET', 40, '2024-05-24 11:02:07');
INSERT INTO "public"."sys_log_operate" VALUES (1120, 'admin', '1', NULL, '192.168.50.45', '/system/user_role/queryUserByRoleId/173', 'com.newbie.controller.system.SysUserRoleController.queryUserByRoleId', 'GET', 40, '2024-05-24 11:02:07');
INSERT INTO "public"."sys_log_operate" VALUES (1121, 'admin', '1', NULL, '192.168.50.45', '/system/role_menu/listByRoleId', 'com.newbie.controller.system.SysRoleMenuController.menuIdsByRoleId', 'GET', 3, '2024-05-24 11:02:09');
INSERT INTO "public"."sys_log_operate" VALUES (1122, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 10, '2024-05-24 11:02:09');
INSERT INTO "public"."sys_log_operate" VALUES (1123, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 15, '2024-05-24 11:02:13');
INSERT INTO "public"."sys_log_operate" VALUES (1124, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 23, '2024-05-24 11:02:13');
INSERT INTO "public"."sys_log_operate" VALUES (1125, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 13, '2024-05-24 11:02:13');
INSERT INTO "public"."sys_log_operate" VALUES (1126, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:02:15');
INSERT INTO "public"."sys_log_operate" VALUES (1127, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 8, '2024-05-24 11:02:15');
INSERT INTO "public"."sys_log_operate" VALUES (1128, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:02:16');
INSERT INTO "public"."sys_log_operate" VALUES (1129, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 14, '2024-05-24 11:02:16');
INSERT INTO "public"."sys_log_operate" VALUES (1130, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:02:17');
INSERT INTO "public"."sys_log_operate" VALUES (1131, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 14, '2024-05-24 11:02:17');
INSERT INTO "public"."sys_log_operate" VALUES (1132, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:02:18');
INSERT INTO "public"."sys_log_operate" VALUES (1133, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 7, '2024-05-24 11:02:18');
INSERT INTO "public"."sys_log_operate" VALUES (1134, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:02:19');
INSERT INTO "public"."sys_log_operate" VALUES (1135, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 11:02:20');
INSERT INTO "public"."sys_log_operate" VALUES (1136, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 11:03:06');
INSERT INTO "public"."sys_log_operate" VALUES (1137, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 13, '2024-05-24 11:03:08');
INSERT INTO "public"."sys_log_operate" VALUES (1138, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-24 11:03:09');
INSERT INTO "public"."sys_log_operate" VALUES (1139, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:03:10');
INSERT INTO "public"."sys_log_operate" VALUES (1140, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 10, '2024-05-24 11:03:12');
INSERT INTO "public"."sys_log_operate" VALUES (1141, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:03:13');
INSERT INTO "public"."sys_log_operate" VALUES (1142, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 9, '2024-05-24 11:03:13');
INSERT INTO "public"."sys_log_operate" VALUES (1143, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 11:03:14');
INSERT INTO "public"."sys_log_operate" VALUES (1144, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 11:03:14');
INSERT INTO "public"."sys_log_operate" VALUES (1145, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:03:15');
INSERT INTO "public"."sys_log_operate" VALUES (1146, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/deleteBatch', 'com.newbie.controller.system.SysLogLoginController.deleteBatch', 'POST', 14, '2024-05-24 11:05:56');
INSERT INTO "public"."sys_log_operate" VALUES (1147, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 11:05:56');
INSERT INTO "public"."sys_log_operate" VALUES (1148, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 6, '2024-05-24 11:05:58');
INSERT INTO "public"."sys_log_operate" VALUES (1149, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 3, '2024-05-24 11:06:01');
INSERT INTO "public"."sys_log_operate" VALUES (1150, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:08:12');
INSERT INTO "public"."sys_log_operate" VALUES (1151, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/deleteBeforeData', 'com.newbie.controller.system.SysLogLoginController.deleteBeforeData', 'GET', 4, '2024-05-24 11:08:18');
INSERT INTO "public"."sys_log_operate" VALUES (1152, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 2, '2024-05-24 11:08:18');
INSERT INTO "public"."sys_log_operate" VALUES (1153, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 3, '2024-05-24 11:08:21');
INSERT INTO "public"."sys_log_operate" VALUES (1154, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 4, '2024-05-24 11:08:21');
INSERT INTO "public"."sys_log_operate" VALUES (1155, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 11:08:22');
INSERT INTO "public"."sys_log_operate" VALUES (1156, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:08:22');
INSERT INTO "public"."sys_log_operate" VALUES (1157, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 14, '2024-05-24 11:08:23');
INSERT INTO "public"."sys_log_operate" VALUES (1158, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 11:08:24');
INSERT INTO "public"."sys_log_operate" VALUES (1159, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 11:08:24');
INSERT INTO "public"."sys_log_operate" VALUES (1160, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/deleteBatch', 'com.newbie.controller.system.SysLogLoginController.deleteBatch', 'POST', 6, '2024-05-24 11:08:29');
INSERT INTO "public"."sys_log_operate" VALUES (1161, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 11:08:29');
INSERT INTO "public"."sys_log_operate" VALUES (1162, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:08:29');
INSERT INTO "public"."sys_log_operate" VALUES (1163, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/deleteBatch', 'com.newbie.controller.system.SysLogLoginController.deleteBatch', 'POST', 9, '2024-05-24 11:08:34');
INSERT INTO "public"."sys_log_operate" VALUES (1164, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 14, '2024-05-24 11:08:34');
INSERT INTO "public"."sys_log_operate" VALUES (1165, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 17, '2024-05-24 11:08:39');
INSERT INTO "public"."sys_log_operate" VALUES (1166, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 11:08:40');
INSERT INTO "public"."sys_log_operate" VALUES (1167, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 21, '2024-05-24 11:08:41');
INSERT INTO "public"."sys_log_operate" VALUES (1168, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:08:42');
INSERT INTO "public"."sys_log_operate" VALUES (1169, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 2, '2024-05-24 11:08:42');
INSERT INTO "public"."sys_log_operate" VALUES (1170, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 11:08:43');
INSERT INTO "public"."sys_log_operate" VALUES (1171, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 18, '2024-05-24 11:08:43');
INSERT INTO "public"."sys_log_operate" VALUES (1172, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 2, '2024-05-24 11:08:51');
INSERT INTO "public"."sys_log_operate" VALUES (1173, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:08:51');
INSERT INTO "public"."sys_log_operate" VALUES (1174, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 11, '2024-05-24 11:11:59');
INSERT INTO "public"."sys_log_operate" VALUES (1175, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 10, '2024-05-24 11:12:06');
INSERT INTO "public"."sys_log_operate" VALUES (1176, 'admin', '1', NULL, '192.168.50.45', '/system/menu/add', 'com.newbie.controller.system.SysMenuController.add', 'POST', 19, '2024-05-24 11:12:15');
INSERT INTO "public"."sys_log_operate" VALUES (1177, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 8, '2024-05-24 11:12:15');
INSERT INTO "public"."sys_log_operate" VALUES (1178, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 5, '2024-05-24 11:12:38');
INSERT INTO "public"."sys_log_operate" VALUES (1179, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 6, '2024-05-24 11:12:38');
INSERT INTO "public"."sys_log_operate" VALUES (1180, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 8, '2024-05-24 11:12:38');
INSERT INTO "public"."sys_log_operate" VALUES (1181, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 8, '2024-05-24 11:12:39');
INSERT INTO "public"."sys_log_operate" VALUES (1182, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 12, '2024-05-24 11:12:48');
INSERT INTO "public"."sys_log_operate" VALUES (1183, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 7, '2024-05-24 11:13:08');
INSERT INTO "public"."sys_log_operate" VALUES (1184, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 13, '2024-05-24 11:13:24');
INSERT INTO "public"."sys_log_operate" VALUES (1185, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 18, '2024-05-24 11:13:24');
INSERT INTO "public"."sys_log_operate" VALUES (1186, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:13:25');
INSERT INTO "public"."sys_log_operate" VALUES (1187, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 11:13:54');
INSERT INTO "public"."sys_log_operate" VALUES (1188, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 18, '2024-05-24 11:15:23');
INSERT INTO "public"."sys_log_operate" VALUES (1189, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 14, '2024-05-24 11:15:30');
INSERT INTO "public"."sys_log_operate" VALUES (1190, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:15:32');
INSERT INTO "public"."sys_log_operate" VALUES (1191, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:15:34');
INSERT INTO "public"."sys_log_operate" VALUES (1192, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:15:36');
INSERT INTO "public"."sys_log_operate" VALUES (1193, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 14, '2024-05-24 11:15:39');
INSERT INTO "public"."sys_log_operate" VALUES (1194, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:15:41');
INSERT INTO "public"."sys_log_operate" VALUES (1195, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 5, '2024-05-24 11:15:57');
INSERT INTO "public"."sys_log_operate" VALUES (1196, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 15, '2024-05-24 11:15:57');
INSERT INTO "public"."sys_log_operate" VALUES (1197, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 15, '2024-05-24 11:15:58');
INSERT INTO "public"."sys_log_operate" VALUES (1198, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 5, '2024-05-24 11:15:58');
INSERT INTO "public"."sys_log_operate" VALUES (1199, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 12, '2024-05-24 11:15:59');
INSERT INTO "public"."sys_log_operate" VALUES (1200, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 14, '2024-05-24 11:15:59');
INSERT INTO "public"."sys_log_operate" VALUES (1201, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 13, '2024-05-24 11:16:01');
INSERT INTO "public"."sys_log_operate" VALUES (1202, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:16:02');
INSERT INTO "public"."sys_log_operate" VALUES (1203, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 16, '2024-05-24 11:16:38');
INSERT INTO "public"."sys_log_operate" VALUES (1204, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 10, '2024-05-24 11:16:38');
INSERT INTO "public"."sys_log_operate" VALUES (1205, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 6, '2024-05-24 11:16:39');
INSERT INTO "public"."sys_log_operate" VALUES (1206, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 11, '2024-05-24 11:17:03');
INSERT INTO "public"."sys_log_operate" VALUES (1207, 'admin', '1', NULL, '192.168.50.45', '/system/menu/update', 'com.newbie.controller.system.SysMenuController.update', 'POST', 17, '2024-05-24 11:17:16');
INSERT INTO "public"."sys_log_operate" VALUES (1208, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 8, '2024-05-24 11:17:16');
INSERT INTO "public"."sys_log_operate" VALUES (1209, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 8, '2024-05-24 11:17:19');
INSERT INTO "public"."sys_log_operate" VALUES (1210, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 5, '2024-05-24 11:17:24');
INSERT INTO "public"."sys_log_operate" VALUES (1211, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 16, '2024-05-24 11:17:24');
INSERT INTO "public"."sys_log_operate" VALUES (1212, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 15, '2024-05-24 11:17:25');
INSERT INTO "public"."sys_log_operate" VALUES (1213, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 9, '2024-05-24 11:20:13');
INSERT INTO "public"."sys_log_operate" VALUES (1214, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 11:20:20');
INSERT INTO "public"."sys_log_operate" VALUES (1215, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:20:22');
INSERT INTO "public"."sys_log_operate" VALUES (1216, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 13, '2024-05-24 11:20:26');
INSERT INTO "public"."sys_log_operate" VALUES (1217, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 15, '2024-05-24 11:20:46');
INSERT INTO "public"."sys_log_operate" VALUES (1218, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 17, '2024-05-24 11:21:04');
INSERT INTO "public"."sys_log_operate" VALUES (1219, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 11:21:18');
INSERT INTO "public"."sys_log_operate" VALUES (1220, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 5, '2024-05-24 11:21:27');
INSERT INTO "public"."sys_log_operate" VALUES (1221, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 18, '2024-05-24 11:21:27');
INSERT INTO "public"."sys_log_operate" VALUES (1222, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 11:22:01');
INSERT INTO "public"."sys_log_operate" VALUES (1223, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 20, '2024-05-24 11:22:03');
INSERT INTO "public"."sys_log_operate" VALUES (1224, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:22:07');
INSERT INTO "public"."sys_log_operate" VALUES (1225, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 7, '2024-05-24 11:22:09');
INSERT INTO "public"."sys_log_operate" VALUES (1226, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 4, '2024-05-24 11:22:19');
INSERT INTO "public"."sys_log_operate" VALUES (1227, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 35, '2024-05-24 11:23:01');
INSERT INTO "public"."sys_log_operate" VALUES (1228, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 11:23:02');
INSERT INTO "public"."sys_log_operate" VALUES (1229, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 18, '2024-05-24 11:23:23');
INSERT INTO "public"."sys_log_operate" VALUES (1230, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 33, '2024-05-24 11:23:25');
INSERT INTO "public"."sys_log_operate" VALUES (1231, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 13, '2024-05-24 11:23:27');
INSERT INTO "public"."sys_log_operate" VALUES (1232, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 17, '2024-05-24 11:23:28');
INSERT INTO "public"."sys_log_operate" VALUES (1233, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 14, '2024-05-24 11:25:04');
INSERT INTO "public"."sys_log_operate" VALUES (1234, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 9, '2024-05-24 11:25:06');
INSERT INTO "public"."sys_log_operate" VALUES (1235, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 13, '2024-05-24 11:25:07');
INSERT INTO "public"."sys_log_operate" VALUES (1236, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 12, '2024-05-24 11:25:08');
INSERT INTO "public"."sys_log_operate" VALUES (1237, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 11, '2024-05-24 11:26:00');
INSERT INTO "public"."sys_log_operate" VALUES (1238, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 17, '2024-05-24 11:27:08');
INSERT INTO "public"."sys_log_operate" VALUES (1239, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 10, '2024-05-24 11:27:09');
INSERT INTO "public"."sys_log_operate" VALUES (1240, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 10, '2024-05-24 11:27:09');
INSERT INTO "public"."sys_log_operate" VALUES (1241, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 5, '2024-05-24 11:27:09');
INSERT INTO "public"."sys_log_operate" VALUES (1242, 'admin', '1', NULL, '192.168.50.45', '/system/menu/tree', 'com.newbie.controller.system.SysMenuController.tree', 'GET', 6, '2024-05-24 11:27:11');
INSERT INTO "public"."sys_log_operate" VALUES (1243, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 21, '2024-05-24 11:28:46');
INSERT INTO "public"."sys_log_operate" VALUES (1244, 'admin', '1', NULL, '192.168.50.45', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-05-24 11:29:20');
INSERT INTO "public"."sys_log_operate" VALUES (1245, 'admin', '1', NULL, '192.168.50.45', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 10, '2024-05-24 11:29:30');
INSERT INTO "public"."sys_log_operate" VALUES (1246, 'admin', '1', NULL, '192.168.50.45', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-05-24 11:29:36');
INSERT INTO "public"."sys_log_operate" VALUES (1247, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 3, '2024-05-24 11:29:40');
INSERT INTO "public"."sys_log_operate" VALUES (1248, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 17, '2024-05-24 11:29:40');
INSERT INTO "public"."sys_log_operate" VALUES (1249, 'admin', '1', NULL, '192.168.50.45', '/system/role/paging', 'com.newbie.controller.system.SysRoleController.paging', 'GET', 11, '2024-05-24 11:29:41');
INSERT INTO "public"."sys_log_operate" VALUES (1250, 'admin', '1', NULL, '192.168.50.45', '/system/dept/tree', 'com.newbie.controller.system.SysDeptController.getDeptTree', 'GET', 3, '2024-05-24 11:29:42');
INSERT INTO "public"."sys_log_operate" VALUES (1251, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 13, '2024-05-24 11:29:42');
INSERT INTO "public"."sys_log_operate" VALUES (1252, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 20, '2024-05-24 11:29:43');
INSERT INTO "public"."sys_log_operate" VALUES (1253, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 14, '2024-05-24 11:29:46');
INSERT INTO "public"."sys_log_operate" VALUES (1254, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 15, '2024-05-24 11:29:46');
INSERT INTO "public"."sys_log_operate" VALUES (1255, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 13, '2024-05-24 11:29:47');
INSERT INTO "public"."sys_log_operate" VALUES (1256, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 16, '2024-05-24 11:29:47');
INSERT INTO "public"."sys_log_operate" VALUES (1257, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 19, '2024-05-24 11:29:47');
INSERT INTO "public"."sys_log_operate" VALUES (1258, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 12, '2024-05-24 11:29:48');
INSERT INTO "public"."sys_log_operate" VALUES (1259, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 21, '2024-05-24 11:29:49');
INSERT INTO "public"."sys_log_operate" VALUES (1260, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 10, '2024-05-24 11:29:49');
INSERT INTO "public"."sys_log_operate" VALUES (1261, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 15, '2024-05-24 11:29:50');
INSERT INTO "public"."sys_log_operate" VALUES (1262, 'admin', '1', NULL, '192.168.50.45', '/system/user/paging', 'com.newbie.controller.system.SysUserController.paging', 'GET', 12, '2024-05-24 11:29:50');
INSERT INTO "public"."sys_log_operate" VALUES (1263, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 10, '2024-05-24 11:29:54');
INSERT INTO "public"."sys_log_operate" VALUES (1264, 'admin', '1', NULL, '192.168.50.45', '/system/log/operate/paging', 'com.newbie.controller.system.SysLogOperateController.paging', 'GET', 11, '2024-05-24 11:29:55');
INSERT INTO "public"."sys_log_operate" VALUES (1265, 'admin', '1', NULL, '192.168.50.45', '/system/dict/type/paging', 'com.newbie.controller.system.SysDictTypeController.paging', 'GET', 10, '2024-05-24 11:29:56');
INSERT INTO "public"."sys_log_operate" VALUES (1266, 'admin', '1', NULL, '192.168.50.45', '/system/dict/data/paging', 'com.newbie.controller.system.SysDictDataController.paging', 'GET', 11, '2024-05-24 11:29:56');
INSERT INTO "public"."sys_log_operate" VALUES (1267, 'admin', '1', NULL, '192.168.50.45', '/system/log/login/paging', 'com.newbie.controller.system.SysLogLoginController.paging', 'GET', 12, '2024-05-24 11:29:58');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "id" int8 NOT NULL,
  "title" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int8,
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
  "fixed_tab" char(1) COLLATE "pg_catalog"."default"
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
COMMENT ON TABLE "public"."sys_menu" IS '系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (2008, '系统管理', 0, 2, '1', '/system', 'System', '', NULL, 'admin', '2023-02-26 01:31:55', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys', 'TdesignSystemSetting', '0', '', '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (2009, '用户管理', 2008, 1, '1', '/system/user', 'SysUser', 'system/user/index', NULL, 'admin', '2023-02-26 01:49:34', 'admin', '2024-04-23 19:04:05', '0', '1', '0', 'sys.user', 'MaterialSymbolsManageAccountsOutlineRounded', '0', '', '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (2010, '角色管理', 2008, 2, '1', '/system/role', 'SysRole', 'system/role/index', NULL, 'admin', '2023-02-26 02:31:10', 'admin', '2024-05-02 14:45:13', '0', '1', '0', 'sys.role', 'CarbonUserRole', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (2013, '菜单管理', 2008, 3, '1', '/system/menu', 'SysMenu', 'system/menu/index', NULL, 'admin', '2023-02-26 23:11:00', 'admin', '2024-04-23 19:00:35', '0', '1', '0', 'sys.menu', 'FluentTextBulletListTree16Regular', '0', '', '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (2042, '首页', 0, 0, '1', '/home', '', 'home/index', '', 'admin', '2023-07-31 05:37:08', 'admin', '2024-04-18 19:56:32', '0', '1', '0', '', 'ep:home-filled', '0', '', '0', NULL, '1');
INSERT INTO "public"."sys_menu" VALUES (2050, '新增', 2013, 1, '1', NULL, NULL, NULL, '菜单新增按钮', 'admin', '2023-08-27 15:54:22', 'admin', '2024-04-18 16:04:23', '0', '0', '0', 'sys.menu.add', NULL, NULL, '', '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (2051, '修改', 2013, 2, '1', NULL, NULL, NULL, '菜单编辑按钮', 'admin', '2023-08-27 15:54:58', 'admin', '2024-04-18 18:04:41', '0', '0', '0', 'sys.menu.update', NULL, NULL, '', '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (2052, '删除', 2013, 3, '1', NULL, NULL, NULL, '菜单删除按钮', 'admin', '2023-08-27 15:55:21', 'admin', '2024-04-18 16:04:54', '0', '0', '0', 'sys.menu.del', NULL, NULL, '', '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (2069, '前端文档', 2072, 98, '1', 'https://zhangyuge7.github.io/preview/five-admin-v2-docs/', '', '', '', 'admin', '2023-11-10 15:03:57', 'admin', '2024-05-18 17:13:56', '0', '1', '0', '', 'ep:document', '0', '', '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (2071, '部门管理', 2008, 6, '1', '/system/dept', 'SysDept', 'system/dept/index', '', 'admin', '2023-11-18 22:46:58', 'admin', '2024-04-23 19:00:55', '0', '1', '0', 'sys.dept', 'MingcuteDepartmentLine', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (2072, '文档', 0, 22, '1', '/docs', '', '', '', 'admin', '2023-11-19 00:04:13', 'admin', '2023-11-28 20:58:16', '0', '1', '0', '', 'EpSetting', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (3009, '字典分类', 2008, 10, '1', '/system/dict/type', 'SysDeptType', 'system/dictType/index', '', 'admin', '2023-11-19 22:33:46', 'admin', '2024-04-23 19:01:22', '0', '1', '1', 'sys.dict.type', 'MingcuteBook5Line', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (3010, '字典管理', 2008, 11, '1', '/system/dict/data', 'SysDictData', 'system/dictData/index', '', 'admin', '2024-02-20 11:29:06', 'admin', '2024-04-23 19:01:48', '0', '1', '0', 'sys.dict.data', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (3015, '个人中心', 0, 99, '1', '/personal-center', 'PersonalCenter', 'personalCenter/index', '', 'admin', '2024-03-22 12:38:00', 'admin', '2024-05-24 11:17:16', '0', '1', '0', '', 'CarbonUserRole', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (3038, '新增', 2009, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:10', NULL, NULL, '0', '0', '0', 'sys.user.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3039, '修改', 2009, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:22', 'admin', '2024-04-18 16:07:44', '0', '0', '0', 'sys.user.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3040, '删除', 2009, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:34', NULL, NULL, '0', '0', '0', 'sys.user.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3041, '修改密码', 2009, 4, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:07:24', NULL, NULL, '0', '0', '0', 'sys.user.update.password', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3042, '新增', 2010, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:31', NULL, NULL, '0', '0', '0', 'sys.role.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3043, '修改', 2010, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:46', NULL, NULL, '0', '0', '0', 'sys.role.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3044, '删除', 2010, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:02:04', NULL, NULL, '0', '0', '0', 'sys.role.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3045, '权限', 2010, 4, '1', NULL, NULL, NULL, '分配权限按钮', 'admin', '2024-04-18 18:03:10', NULL, NULL, '0', '0', '0', 'sys.role.perm', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3046, '用户', 2010, 5, '1', NULL, NULL, NULL, '分配用户按钮', 'admin', '2024-04-18 18:03:35', NULL, NULL, '0', '0', '0', 'sys.role.user', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3047, '新增', 2071, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:07', NULL, NULL, '0', '0', '0', 'sys.dept.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3048, '修改', 2071, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:25', NULL, NULL, '0', '0', '0', 'sys.dept.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3049, '删除', 2071, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:57', NULL, NULL, '0', '0', '0', 'sys.dept.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3050, '新增', 3009, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:05:37', 'admin', '2024-04-18 18:05:53', '0', '0', '0', 'sys.dict.type.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3051, '修改', 3009, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:25', NULL, NULL, '0', '0', '0', 'sys.dict.type.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3052, '删除', 3009, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:40', NULL, NULL, '0', '0', '0', 'sys.dict.type.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3053, '新增', 3010, 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:10', NULL, NULL, '0', '0', '0', 'sys.dict.data.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3054, '修改', 3010, 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:25', NULL, NULL, '0', '0', '0', 'sys.dict.data.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3055, '删除', 3010, 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:48', NULL, NULL, '0', '0', '0', 'sys.dict.data.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3056, '默认', 3010, 4, '1', NULL, NULL, NULL, '字典数据设置默认的按钮', 'admin', '2024-04-18 18:08:52', NULL, NULL, '0', '0', '0', 'sys.dict.data.def', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3059, '演示', 0, 98, '1', '/demo', '', '', '', 'admin', '2024-04-30 15:06:58', 'admin', '2024-05-18 17:11:44', '0', '1', '0', '', 'MingcuteDepartmentLine', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (3060, '上传下载', 3059, 1, '1', '/uploadtest', 'UploadTest', 'demo/UploadTest', '', 'admin', '2024-04-30 15:08:16', NULL, NULL, '0', '1', '0', '', '', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (3064, '操作日志', 2008, 20, '1', '/system/operatelog', 'SysLogOperate', 'system/logOperate/index', '', 'admin', '2024-05-18 21:03:59', 'admin', '2024-05-19 21:29:07', '0', '1', '0', 'sys.log.operate', 'MaterialSymbolsDataInfoAlertRounded', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (3065, '登录日志', 2008, 30, '1', '/system/loginlog', 'SysLogLogin', 'system/logLogin/index', '', 'admin', '2024-05-18 21:18:26', 'admin', '2024-05-24 10:37:20', '0', '1', '0', 'sys.log.login', 'CarbonCloudMonitoring', '0', '', '0', '', '0');
INSERT INTO "public"."sys_menu" VALUES (3066, '删除', 3064, 10, '1', NULL, NULL, NULL, '', 'admin', '2024-05-19 21:21:05', NULL, NULL, '0', '0', '0', 'sys.log.operate.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3067, '删除', 3065, 10, '1', NULL, NULL, NULL, '', 'admin', '2024-05-24 11:12:15', NULL, NULL, '0', '0', '0', 'sys.log.login.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO "public"."sys_menu" VALUES (3068, 'API文档', 2072, 1, '1', 'http://localhost:8080/swagger-ui/index.html,_blank', '', '', '', 'admin', '2024-05-25 14:33:52', 'admin', '2024-05-25 14:35:04', '0', '1', '0', '', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" int8 NOT NULL,
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
INSERT INTO "public"."sys_role" VALUES (173, '测试', 'test', 1, '1', '', '测试角色', 'admin', '2024-04-18 15:53:42', 'admin', '2024-05-02 15:48:58');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL,
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
INSERT INTO "public"."sys_role_menu" VALUES (1112, 173, 2042, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1113, 173, 3059, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1114, 173, 3060, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1115, 173, 3038, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1116, 173, 3039, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1117, 173, 2010, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1118, 173, 2013, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1119, 173, 2071, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1120, 173, 3009, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1121, 173, 3010, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1122, 173, 2072, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1123, 173, 2069, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1124, 173, 3015, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1125, 173, 2008, 'admin', '2024-04-30 17:05:39', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES (1126, 173, 2009, 'admin', '2024-04-30 17:05:39', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" int8 NOT NULL,
  "dept_id" int8,
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
INSERT INTO "public"."sys_user" VALUES (52, 272, 'test1', '$2a$10$3sFeXxGHsTI4jwIjzxjfI.kzTl52cywiKfkoUxJ7j0I0UDP4jurZC', '测试用户1', NULL, '', '32132132131', '3213213213211', '1', '1', '', 3, 'admin', '2024-04-18 15:51:03', 'test1', '2024-05-02 15:48:27');
INSERT INTO "public"."sys_user" VALUES (57, NULL, 'admin', '$2a$10$Jc9ytizwSRL/nVR6.NGDfOpTgAl0Kwh8BhPhM7/1BmbKLtnsjgOFa', '系统管理员', 'public/2024/05/24/hbg0276.jpg', NULL, '18800000000', '32132@qq.com', '1', '1', NULL, 0, NULL, '2024-05-24 09:15:38', 'admin', '2024-05-24 17:47:42');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
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
INSERT INTO "public"."sys_user_role" VALUES (236, 52, 173, 'admin', '2024-05-10 17:06:28', NULL, NULL);

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
