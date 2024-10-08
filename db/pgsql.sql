/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : PostgreSQL
 Source Server Version : 160004 (160004)
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160004 (160004)
 File Encoding         : 65001

 Date: 08/10/2024 10:27:55
*/


-- ----------------------------
-- Table structure for gen_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."gen_config";
CREATE TABLE "public"."gen_config" (
  "id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar COLLATE "pg_catalog"."default",
  "email" varchar COLLATE "pg_catalog"."default",
  "date_format" varchar COLLATE "pg_catalog"."default",
  "package_parent" varchar COLLATE "pg_catalog"."default",
  "module_name" varchar COLLATE "pg_catalog"."default",
  "table_prefix" varchar COLLATE "pg_catalog"."default",
  "enable_api_auth" varchar COLLATE "pg_catalog"."default",
  "enable_spring_doc" varchar COLLATE "pg_catalog"."default",
  "enable_drawer" varchar COLLATE "pg_catalog"."default",
  "config_name" varchar COLLATE "pg_catalog"."default",
  "remark" varchar(120) COLLATE "pg_catalog"."default",
  "create_by" varchar(30) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(30) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."gen_config"."id" IS '主键ID';
COMMENT ON COLUMN "public"."gen_config"."author" IS '作者';
COMMENT ON COLUMN "public"."gen_config"."email" IS '邮箱';
COMMENT ON COLUMN "public"."gen_config"."date_format" IS '日期格式 yyyy-MM-dd HH:mm:ss';
COMMENT ON COLUMN "public"."gen_config"."package_parent" IS '父级包名 com.newbie';
COMMENT ON COLUMN "public"."gen_config"."module_name" IS '模块名 system';
COMMENT ON COLUMN "public"."gen_config"."table_prefix" IS '表名前缀 多个以逗号分割';
COMMENT ON COLUMN "public"."gen_config"."enable_api_auth" IS '接口权限控制，1开启 0关闭';
COMMENT ON COLUMN "public"."gen_config"."enable_spring_doc" IS '接口文档，1开启 0关闭';
COMMENT ON COLUMN "public"."gen_config"."enable_drawer" IS 'ui抽屉组件，1开启 0关闭';
COMMENT ON COLUMN "public"."gen_config"."config_name" IS '配置名称';
COMMENT ON COLUMN "public"."gen_config"."remark" IS '备注';
COMMENT ON COLUMN "public"."gen_config"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."gen_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."gen_config"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."gen_config"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."gen_config" IS '代码生成器配置';

-- ----------------------------
-- Records of gen_config
-- ----------------------------
INSERT INTO "public"."gen_config" VALUES ('3213213212132', 'ZhangYuGe', '398698424@qq.com', 'yyyy-MM-dd', 'com.newbie', 'generator', 't_', '1', '1', '1', '配置1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."gen_config" VALUES ('1843473317625868290', 'ZhangYuGe', '398698424@qq.com', 'yyyy-MM-dd', 'com.newbie', 'system', NULL, '1', '1', '0', '系统模块', NULL, 'admin', '2024-10-08 10:07:43', 'admin', '2024-10-08 10:08:27.043');

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
INSERT INTO "public"."sys_log_login" VALUES ('1834108002451582977', '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 242, '2024-09-12 13:53:18.52', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES ('1834108018591264769', '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 745, '2024-09-12 13:53:22.381', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES ('1839486268267188225', '1', '10.69.174.129', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 2174, '2024-09-27 10:04:37.014', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES ('1842016230354022401', '1', '192.168.118.1', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 70, '2024-10-04 09:37:46.983', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES ('1842016246221074433', '1', '192.168.118.1', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 247, '2024-10-04 09:37:50.767', '1', 'admin');
INSERT INTO "public"."sys_log_login" VALUES ('1842098420764905473', '1', '192.168.118.1', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 16, '2024-10-04 15:04:22.705', '0', 'admin');
INSERT INTO "public"."sys_log_login" VALUES ('1842098474078703617', '0', '192.168.118.1', 'username', '密码错误', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 63, '2024-10-04 15:04:35.413', '1', 'test');
INSERT INTO "public"."sys_log_login" VALUES ('1842098484602212353', '0', '192.168.118.1', 'username', '验证码已失效', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 1, '2024-10-04 15:04:37.921', '1', '123');
INSERT INTO "public"."sys_log_login" VALUES ('1842098499273887745', '0', '192.168.118.1', 'username', '密码错误', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 54, '2024-10-04 15:04:41.42', '1', '321321');
INSERT INTO "public"."sys_log_login" VALUES ('1842098538259943426', '1', '192.168.118.1', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 73, '2024-10-04 15:04:50.718', '1', 'test');
INSERT INTO "public"."sys_log_login" VALUES ('1842099353469063169', '1', '192.168.118.1', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 6, '2024-10-04 15:08:05.088', '0', 'test');
INSERT INTO "public"."sys_log_login" VALUES ('1842099368920879105', '1', '192.168.118.1', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 63, '2024-10-04 15:08:08.77', '1', 'test');
INSERT INTO "public"."sys_log_login" VALUES ('1843456605321342977', '1', '10.69.174.129', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(129.0.0.0)', 2369, '2024-10-08 09:01:19.137', '1', 'admin');

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
INSERT INTO "public"."sys_log_operate" VALUES ('1834108019316879361', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-12 13:53:22.541');
INSERT INTO "public"."sys_log_operate" VALUES ('1839486270234316801', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '10.69.174.129', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 9, '2024-09-27 10:04:37.483');
INSERT INTO "public"."sys_log_operate" VALUES ('1840343460440236033', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-29 18:50:47.555');
INSERT INTO "public"."sys_log_operate" VALUES ('1840343678120419329', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-29 18:51:39.454');
INSERT INTO "public"."sys_log_operate" VALUES ('1840343803899207681', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-29 18:52:09.443');
INSERT INTO "public"."sys_log_operate" VALUES ('1840343833104146433', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-29 18:52:16.414');
INSERT INTO "public"."sys_log_operate" VALUES ('1840346943910371329', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-29 19:04:38.079');
INSERT INTO "public"."sys_log_operate" VALUES ('1840348153392455681', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-29 19:09:26.454');
INSERT INTO "public"."sys_log_operate" VALUES ('1840348202885242881', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-29 19:09:38.241');
INSERT INTO "public"."sys_log_operate" VALUES ('1840348374528745474', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-29 19:10:19.173');
INSERT INTO "public"."sys_log_operate" VALUES ('1840348563842850818', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-29 19:11:04.301');
INSERT INTO "public"."sys_log_operate" VALUES ('1840348971332067329', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-29 19:12:41.457');
INSERT INTO "public"."sys_log_operate" VALUES ('1840349004043444226', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-29 19:12:49.253');
INSERT INTO "public"."sys_log_operate" VALUES ('1840349546287259650', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-29 19:14:58.533');
INSERT INTO "public"."sys_log_operate" VALUES ('1840349861145272322', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-29 19:16:13.601');
INSERT INTO "public"."sys_log_operate" VALUES ('1840350405503016961', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-29 19:18:23.386');
INSERT INTO "public"."sys_log_operate" VALUES ('1840353776754491394', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/list', 'com.newbie.genteratortest.controller.TestController.list', 'GET', 22, '2024-09-29 19:31:47.155');
INSERT INTO "public"."sys_log_operate" VALUES ('1840353801299558402', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/list', 'com.newbie.genteratortest.controller.TestController.list', 'GET', 2, '2024-09-29 19:31:53.018');
INSERT INTO "public"."sys_log_operate" VALUES ('1840354120242823170', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/list', 'com.newbie.genteratortest.controller.TestController.list', 'GET', 30765, '2024-09-29 19:33:09.049');
INSERT INTO "public"."sys_log_operate" VALUES ('1840354278762360833', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/list', 'com.newbie.genteratortest.controller.TestController.list', 'GET', 6819, '2024-09-29 19:33:46.843');
INSERT INTO "public"."sys_log_operate" VALUES ('1840354616093462529', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/list', 'com.newbie.genteratortest.controller.TestController.list', 'GET', 7851, '2024-09-29 19:35:07.27');
INSERT INTO "public"."sys_log_operate" VALUES ('1840357675154550786', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-29 19:47:16.61');
INSERT INTO "public"."sys_log_operate" VALUES ('1840357863491383297', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-29 19:48:01.516');
INSERT INTO "public"."sys_log_operate" VALUES ('1840554215609589762', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 12, '2024-09-30 08:48:15.512');
INSERT INTO "public"."sys_log_operate" VALUES ('1840560250235772929', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:12:14.272');
INSERT INTO "public"."sys_log_operate" VALUES ('1840560393978765313', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:12:48.543');
INSERT INTO "public"."sys_log_operate" VALUES ('1840560432687996929', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:12:57.77');
INSERT INTO "public"."sys_log_operate" VALUES ('1840560470264766465', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:13:06.734');
INSERT INTO "public"."sys_log_operate" VALUES ('1840560496600801281', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:13:13.019');
INSERT INTO "public"."sys_log_operate" VALUES ('1840560527605096450', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 22, '2024-09-30 09:13:20.403');
INSERT INTO "public"."sys_log_operate" VALUES ('1840560551059644418', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:13:25.994');
INSERT INTO "public"."sys_log_operate" VALUES ('1840561122697142273', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:15:42.285');
INSERT INTO "public"."sys_log_operate" VALUES ('1840561139717627905', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:15:46.34');
INSERT INTO "public"."sys_log_operate" VALUES ('1840561210634919938', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:16:03.249');
INSERT INTO "public"."sys_log_operate" VALUES ('1840561776123568129', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 09:18:18.074');
INSERT INTO "public"."sys_log_operate" VALUES ('1840561922332811266', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:18:52.933');
INSERT INTO "public"."sys_log_operate" VALUES ('1840562540527054850', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 9, '2024-09-30 09:21:20.317');
INSERT INTO "public"."sys_log_operate" VALUES ('1840562615839977474', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:21:38.273');
INSERT INTO "public"."sys_log_operate" VALUES ('1840565018047827969', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/page', 'com.newbie.genteratortest.controller.TestController.page', 'GET', 71, '2024-09-30 09:31:11.008');
INSERT INTO "public"."sys_log_operate" VALUES ('1840565041133277185', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/page', 'com.newbie.genteratortest.controller.TestController.page', 'GET', 8, '2024-09-30 09:31:16.508');
INSERT INTO "public"."sys_log_operate" VALUES ('1840565574380371969', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/page', 'com.newbie.genteratortest.controller.TestController.page', 'GET', 84, '2024-09-30 09:33:23.644');
INSERT INTO "public"."sys_log_operate" VALUES ('1840565907403915266', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/page', 'com.newbie.genteratortest.controller.TestController.page', 'GET', 12, '2024-09-30 09:34:43.043');
INSERT INTO "public"."sys_log_operate" VALUES ('1840566060026249217', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/page', 'com.newbie.genteratortest.controller.TestController.page', 'GET', 16, '2024-09-30 09:35:19.431');
INSERT INTO "public"."sys_log_operate" VALUES ('1840566070210019330', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/page', 'com.newbie.genteratortest.controller.TestController.page', 'GET', 30, '2024-09-30 09:35:21.865');
INSERT INTO "public"."sys_log_operate" VALUES ('1840566146848337921', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/page', 'com.newbie.genteratortest.controller.TestController.page', 'GET', 37, '2024-09-30 09:35:40.131');
INSERT INTO "public"."sys_log_operate" VALUES ('1840566146848337922', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 09:35:40.135');
INSERT INTO "public"."sys_log_operate" VALUES ('1840566648482902017', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 09:37:39.73');
INSERT INTO "public"."sys_log_operate" VALUES ('1840566648508067842', 'admin', '0', NULL, '192.168.118.1', '/genteratortest/test/page', 'com.newbie.genteratortest.controller.TestController.page', 'GET', 35048, '2024-09-30 09:37:39.736');
INSERT INTO "public"."sys_log_operate" VALUES ('1840567720425414657', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 09:41:55.302');
INSERT INTO "public"."sys_log_operate" VALUES ('1840568059086102530', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:43:16.049');
INSERT INTO "public"."sys_log_operate" VALUES ('1840568078358929409', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:43:20.644');
INSERT INTO "public"."sys_log_operate" VALUES ('1840568192007790594', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 09:43:47.748');
INSERT INTO "public"."sys_log_operate" VALUES ('1840568692878991362', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 09:45:47.154');
INSERT INTO "public"."sys_log_operate" VALUES ('1840571631425130497', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 16, '2024-09-30 09:57:27.756');
INSERT INTO "public"."sys_log_operate" VALUES ('1840573049502535682', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 10:03:05.854');
INSERT INTO "public"."sys_log_operate" VALUES ('1840578995473633281', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 10:26:43.483');
INSERT INTO "public"."sys_log_operate" VALUES ('1840579842123255810', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 10:30:05.34');
INSERT INTO "public"."sys_log_operate" VALUES ('1840579871433052161', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 10:30:12.327');
INSERT INTO "public"."sys_log_operate" VALUES ('1840580015423508481', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 10:30:46.658');
INSERT INTO "public"."sys_log_operate" VALUES ('1840580075934732289', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 10:31:01.084');
INSERT INTO "public"."sys_log_operate" VALUES ('1840580100853092353', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 10:31:07.029');
INSERT INTO "public"."sys_log_operate" VALUES ('1840581082580275201', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 10:35:01.091');
INSERT INTO "public"."sys_log_operate" VALUES ('1840582760360615938', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 10:41:41.102');
INSERT INTO "public"."sys_log_operate" VALUES ('1840582808687386625', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 10:41:52.626');
INSERT INTO "public"."sys_log_operate" VALUES ('1840583607622647810', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 10:45:03.104');
INSERT INTO "public"."sys_log_operate" VALUES ('1840586724959334402', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 11, '2024-09-30 10:57:26.336');
INSERT INTO "public"."sys_log_operate" VALUES ('1840586854865317890', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 10:57:57.309');
INSERT INTO "public"."sys_log_operate" VALUES ('1840586912964816897', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 10:58:11.162');
INSERT INTO "public"."sys_log_operate" VALUES ('1840587630182400002', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 11:01:02.158');
INSERT INTO "public"."sys_log_operate" VALUES ('1840588507416985602', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 9, '2024-09-30 11:04:31.31');
INSERT INTO "public"."sys_log_operate" VALUES ('1840588617391636481', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 11:04:57.532');
INSERT INTO "public"."sys_log_operate" VALUES ('1840588744365801473', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 11:05:27.811');
INSERT INTO "public"."sys_log_operate" VALUES ('1840589258277117953', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 11:07:30.326');
INSERT INTO "public"."sys_log_operate" VALUES ('1840604680405671938', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 12:08:47.247');
INSERT INTO "public"."sys_log_operate" VALUES ('1840604685199761410', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> genConf.enableSpringdoc  [in template "controller.java.ftl" at line 9, column 6]

----
Tip: It''s the step after the last dot that caused this error, not those before it.
----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: #if genConf.enableSpringdoc  [in template "controller.java.ftl" at line 9, column 1]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 87, '2024-09-30 12:08:48.391');
INSERT INTO "public"."sys_log_operate" VALUES ('1840604704241901569', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> genConf.enableSpringdoc  [in template "controller.java.ftl" at line 9, column 6]

----
Tip: It''s the step after the last dot that caused this error, not those before it.
----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: #if genConf.enableSpringdoc  [in template "controller.java.ftl" at line 9, column 1]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 89, '2024-09-30 12:08:52.946');
INSERT INTO "public"."sys_log_operate" VALUES ('1840605075811115010', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 12:10:21.519');
INSERT INTO "public"."sys_log_operate" VALUES ('1840605080470986753', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> genConf.enableSpringdoc  [in template "controller.java.ftl" at line 9, column 6]

----
Tip: It''s the step after the last dot that caused this error, not those before it.
----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: #if genConf.enableSpringdoc  [in template "controller.java.ftl" at line 9, column 1]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 88, '2024-09-30 12:10:22.639');
INSERT INTO "public"."sys_log_operate" VALUES ('1840605553458540546', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 7, '2024-09-30 12:12:15.4');
INSERT INTO "public"."sys_log_operate" VALUES ('1840605557174693889', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> genConf.enableSpringdoc  [in template "controller.java.ftl" at line 9, column 6]

----
Tip: It''s the step after the last dot that caused this error, not those before it.
----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: #if genConf.enableSpringdoc = "1"  [in template "controller.java.ftl" at line 9, column 1]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 85, '2024-09-30 12:12:16.295');
INSERT INTO "public"."sys_log_operate" VALUES ('1840616492618575873', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 12:55:43.499');
INSERT INTO "public"."sys_log_operate" VALUES ('1840616713788420097', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 6, '2024-09-30 12:56:36.229');
INSERT INTO "public"."sys_log_operate" VALUES ('1840605796547817473', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> genConf.enableSpringdoc  [in template "controller.java.ftl" at line 9, column 6]

----
Tip: It''s the step after the last dot that caused this error, not those before it.
----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: #if genConf.enableSpringdoc = "1"  [in template "controller.java.ftl" at line 9, column 1]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 31051, '2024-09-30 12:13:13.358');
INSERT INTO "public"."sys_log_operate" VALUES ('1840606189914705921', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 6, '2024-09-30 12:14:47.143');
INSERT INTO "public"."sys_log_operate" VALUES ('1840606205010006017', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> genConf.enableSpringdoc  [in template "controller.java.ftl" at line 9, column 6]

----
Tip: It''s the step after the last dot that caused this error, not those before it.
----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: #if genConf.enableSpringdoc == "1"  [in template "controller.java.ftl" at line 9, column 1]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 3080, '2024-09-30 12:14:50.75');
INSERT INTO "public"."sys_log_operate" VALUES ('1840607516489256962', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 12:20:03.423');
INSERT INTO "public"."sys_log_operate" VALUES ('1840608112181108738', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 12:22:25.447');
INSERT INTO "public"."sys_log_operate" VALUES ('1840609250297008130', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 12:26:56.795');
INSERT INTO "public"."sys_log_operate" VALUES ('1840609631731208193', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 12:28:27.737');
INSERT INTO "public"."sys_log_operate" VALUES ('1840609639197069313', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 12:28:29.516');
INSERT INTO "public"."sys_log_operate" VALUES ('1840609665310806017', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 12:28:35.747');
INSERT INTO "public"."sys_log_operate" VALUES ('1840609731719221249', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 12:28:51.583');
INSERT INTO "public"."sys_log_operate" VALUES ('1840609737159233538', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 12:28:52.874');
INSERT INTO "public"."sys_log_operate" VALUES ('1840609763734343681', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 12:28:59.207');
INSERT INTO "public"."sys_log_operate" VALUES ('1840609784068329474', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 12:29:04.056');
INSERT INTO "public"."sys_log_operate" VALUES ('1840610194460061698', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 21, '2024-09-30 12:30:41.9');
INSERT INTO "public"."sys_log_operate" VALUES ('1840610509406093313', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 9, '2024-09-30 12:31:56.989');
INSERT INTO "public"."sys_log_operate" VALUES ('1840610631791800322', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 12:32:26.168');
INSERT INTO "public"."sys_log_operate" VALUES ('1840611343259004930', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 12:35:15.804');
INSERT INTO "public"."sys_log_operate" VALUES ('1840611778418044930', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 12:36:59.552');
INSERT INTO "public"."sys_log_operate" VALUES ('1840612290739695618', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 12:39:01.696');
INSERT INTO "public"."sys_log_operate" VALUES ('1840612388747997185', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-30 12:39:25.061');
INSERT INTO "public"."sys_log_operate" VALUES ('1840613006510153730', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 12:41:52.346');
INSERT INTO "public"."sys_log_operate" VALUES ('1840613614130601986', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 12:44:17.214');
INSERT INTO "public"."sys_log_operate" VALUES ('1840613617842561025', 'admin', '0', 'ZipException: no current ZIP entry', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 77, '2024-09-30 12:44:18.109');
INSERT INTO "public"."sys_log_operate" VALUES ('1840616113394683905', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 12:54:13.084');
INSERT INTO "public"."sys_log_operate" VALUES ('1842023506276003841', 'admin', '0', NULL, '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 29520, '2024-10-04 10:06:41.699');
INSERT INTO "public"."sys_log_operate" VALUES ('1840617190173241345', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 12:58:29.809');
INSERT INTO "public"."sys_log_operate" VALUES ('1840617503835877378', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 12:59:44.594');
INSERT INTO "public"."sys_log_operate" VALUES ('1840617566796574721', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 12:59:59.608');
INSERT INTO "public"."sys_log_operate" VALUES ('1840617665136226305', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 13:00:23.049');
INSERT INTO "public"."sys_log_operate" VALUES ('1840618274404990977', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 13:02:48.309');
INSERT INTO "public"."sys_log_operate" VALUES ('1840619764091838465', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 13:08:43.479');
INSERT INTO "public"."sys_log_operate" VALUES ('1840620530688933890', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 13:11:46.25');
INSERT INTO "public"."sys_log_operate" VALUES ('1840631593589395457', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 13:55:43.85');
INSERT INTO "public"."sys_log_operate" VALUES ('1840675569344200705', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 21, '2024-09-30 16:50:28.487');
INSERT INTO "public"."sys_log_operate" VALUES ('1840675569386143745', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 16:50:28.508');
INSERT INTO "public"."sys_log_operate" VALUES ('1840675612830744578', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 1, '2024-09-30 16:50:38.856');
INSERT INTO "public"."sys_log_operate" VALUES ('1840675915584008193', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 405, '2024-09-30 16:51:51.038');
INSERT INTO "public"."sys_log_operate" VALUES ('1840677941072130049', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 463142, '2024-09-30 16:59:53.951');
INSERT INTO "public"."sys_log_operate" VALUES ('1840677993811283970', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 5433, '2024-09-30 17:00:06.536');
INSERT INTO "public"."sys_log_operate" VALUES ('1840678266663366658', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 21, '2024-09-30 17:01:11.578');
INSERT INTO "public"."sys_log_operate" VALUES ('1840678266663366659', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 17:01:11.584');
INSERT INTO "public"."sys_log_operate" VALUES ('1840678497463422978', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 412, '2024-09-30 17:02:06.605');
INSERT INTO "public"."sys_log_operate" VALUES ('1840678514303553537', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 0, '2024-09-30 17:02:10.625');
INSERT INTO "public"."sys_log_operate" VALUES ('1840678522159484930', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 5, '2024-09-30 17:02:12.502');
INSERT INTO "public"."sys_log_operate" VALUES ('1840678950796365825', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 18, '2024-09-30 17:03:54.688');
INSERT INTO "public"."sys_log_operate" VALUES ('1840678950842503169', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 17:03:54.699');
INSERT INTO "public"."sys_log_operate" VALUES ('1840679352803635202', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 28, '2024-09-30 17:05:30.534');
INSERT INTO "public"."sys_log_operate" VALUES ('1840679352803635203', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 17:05:30.537');
INSERT INTO "public"."sys_log_operate" VALUES ('1840679603102822402', 'admin', '0', NULL, '192.168.118.1', '/generator/dbTableList', 'com.newbie.generator.controller.GeneratorController.dbTableList', 'GET', 22, '2024-09-30 17:06:30.21');
INSERT INTO "public"."sys_log_operate" VALUES ('1840679603530641410', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 17:06:30.312');
INSERT INTO "public"."sys_log_operate" VALUES ('1840679717372526593', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 24, '2024-09-30 17:06:57.454');
INSERT INTO "public"."sys_log_operate" VALUES ('1840680316335824897', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 8, '2024-09-30 17:09:20.258');
INSERT INTO "public"."sys_log_operate" VALUES ('1840680325169029122', 'admin', '0', NULL, '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 3, '2024-09-30 17:09:22.368');
INSERT INTO "public"."sys_log_operate" VALUES ('1840680430488002562', 'admin', '0', NULL, '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 2, '2024-09-30 17:09:47.477');
INSERT INTO "public"."sys_log_operate" VALUES ('1840680930755223553', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 17:11:46.747');
INSERT INTO "public"."sys_log_operate" VALUES ('1840680932672020482', 'admin', '0', NULL, '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 6, '2024-09-30 17:11:47.209');
INSERT INTO "public"."sys_log_operate" VALUES ('1840681283919855618', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 17:13:10.948');
INSERT INTO "public"."sys_log_operate" VALUES ('1842023819150110722', 'admin', '0', NULL, '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 37000, '2024-10-04 10:07:56.291');
INSERT INTO "public"."sys_log_operate" VALUES ('1842027364943396865', 'admin', '0', '未找到主键字段', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 1029, '2024-10-04 10:22:01.676');
INSERT INTO "public"."sys_log_operate" VALUES ('1840681289707995137', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> springDoc  [in template "controller.java.ftl" at line 9, column 6]

----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: #if springDoc  [in template "controller.java.ftl" at line 9, column 1]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 80, '2024-09-30 17:13:12.332');
INSERT INTO "public"."sys_log_operate" VALUES ('1840681786749845505', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 17:15:10.832');
INSERT INTO "public"."sys_log_operate" VALUES ('1840681789564223489', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> entityName  [in template "controller.java.ftl" at line 49, column 44]

----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: ${entityName}  [in template "controller.java.ftl" at line 49, column 42]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 84, '2024-09-30 17:15:11.513');
INSERT INTO "public"."sys_log_operate" VALUES ('1840682007995211777', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 7, '2024-09-30 17:16:03.582');
INSERT INTO "public"."sys_log_operate" VALUES ('1840682011862360065', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> table  [in template "mapper.java.ftl" at line 19, column 20]

----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: ${table.tableComment!}  [in template "mapper.java.ftl" at line 19, column 18]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 100, '2024-09-30 17:16:04.517');
INSERT INTO "public"."sys_log_operate" VALUES ('1840698740852129794', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 18:22:33.006');
INSERT INTO "public"."sys_log_operate" VALUES ('1840699747170521090', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 18:26:32.931');
INSERT INTO "public"."sys_log_operate" VALUES ('1840702604112424961', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 18:37:54.078');
INSERT INTO "public"."sys_log_operate" VALUES ('1840704029290782721', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 18:43:33.868');
INSERT INTO "public"."sys_log_operate" VALUES ('1840704515108626433', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 10, '2024-09-30 18:45:29.696');
INSERT INTO "public"."sys_log_operate" VALUES ('1840704591088443394', 'admin', '0', '
### Error updating database.  Cause: org.postgresql.util.PSQLException: 错误: 语法错误 在 "INFO" 或附近的
  位置：8
### The error may exist in file [D:\Project\my\newbie\newbie-boot3\newbie-generator-test\target\classes\mapper\TestMapper.xml]
### The error may involve defaultParameterMap
### The error occurred while setting parameters
### SQL: INSERT INFO t_test( dwmc,             user_name )           VALUES( ?,             ? )
### Cause: org.postgresql.util.PSQLException: 错误: 语法错误 在 "INFO" 或附近的
  位置：8
; bad SQL grammar []', '192.168.118.1', '/genteratortest/test/addData', 'com.newbie.genteratortest.controller.TestController.addData', 'POST', 300, '2024-09-30 18:45:47.819');
INSERT INTO "public"."sys_log_operate" VALUES ('1840704919779270657', 'admin', '0', '
### Error updating database.  Cause: org.postgresql.util.PSQLException: 错误: 语法错误 在 "INFO" 或附近的
  位置：8
### The error may exist in file [D:\Project\my\newbie\newbie-boot3\newbie-generator-test\target\classes\mapper\TestMapper.xml]
### The error may involve defaultParameterMap
### The error occurred while setting parameters
### SQL: INSERT INFO t_test( dwmc,             user_name,                          ye )           VALUES( ?,             ?,                          ? )
### Cause: org.postgresql.util.PSQLException: 错误: 语法错误 在 "INFO" 或附近的
  位置：8
; bad SQL grammar []', '192.168.118.1', '/genteratortest/test/addData', 'com.newbie.genteratortest.controller.TestController.addData', 'POST', 15683, '2024-09-30 18:47:06.176');
INSERT INTO "public"."sys_log_operate" VALUES ('1840705104961896449', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 18:47:50.327');
INSERT INTO "public"."sys_log_operate" VALUES ('1840705132002574337', 'admin', '0', '
### Error updating database.  Cause: org.postgresql.util.PSQLException: 错误: 语法错误 在 "INFO" 或附近的
  位置：8
### The error may exist in file [D:\Project\my\newbie\newbie-boot3\newbie-generator-test\target\classes\mapper\TestMapper.xml]
### The error may involve defaultParameterMap
### The error occurred while setting parameters
### SQL: INSERT INFO t_test( dwmc,             user_name )           VALUES( ?,             ? )
### Cause: org.postgresql.util.PSQLException: 错误: 语法错误 在 "INFO" 或附近的
  位置：8
; bad SQL grammar []', '192.168.118.1', '/genteratortest/test/addData', 'com.newbie.genteratortest.controller.TestController.addData', 'POST', 4458, '2024-09-30 18:47:56.784');
INSERT INTO "public"."sys_log_operate" VALUES ('1840705278580883457', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 18:48:31.721');
INSERT INTO "public"."sys_log_operate" VALUES ('1842023950914281474', 'admin', '0', NULL, '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 129, '2024-10-04 10:08:27.705');
INSERT INTO "public"."sys_log_operate" VALUES ('1840705292812156930', 'admin', '0', '
### Error updating database.  Cause: org.postgresql.util.PSQLException: 错误: 语法错误 在 "INFO" 或附近的
  位置：8
### The error may exist in file [D:\Project\my\newbie\newbie-boot3\newbie-generator-test\target\classes\mapper\TestMapper.xml]
### The error may involve defaultParameterMap
### The error occurred while setting parameters
### SQL: INSERT INFO t_test( id,             dwmc )           VALUES( ?,             ? )
### Cause: org.postgresql.util.PSQLException: 错误: 语法错误 在 "INFO" 或附近的
  位置：8
; bad SQL grammar []', '192.168.118.1', '/genteratortest/test/addData', 'com.newbie.genteratortest.controller.TestController.addData', 'POST', 62, '2024-09-30 18:48:35.122');
INSERT INTO "public"."sys_log_operate" VALUES ('1840705623403020289', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 18:49:53.933');
INSERT INTO "public"."sys_log_operate" VALUES ('1840705631930040322', 'admin', '0', '
### Error updating database.  Cause: org.postgresql.util.PSQLException: 错误: null value in column "id" of relation "t_test" violates not-null constraint
  详细：失败, 行包含(null, 321, null, null, null, null, null, null).
### The error may exist in file [D:\Project\my\newbie\newbie-boot3\newbie-generator-test\target\classes\mapper\TestMapper.xml]
### The error may involve defaultParameterMap
### The error occurred while setting parameters
### SQL: INSERT INTO t_test( dwmc )           VALUES( ? )
### Cause: org.postgresql.util.PSQLException: 错误: null value in column "id" of relation "t_test" violates not-null constraint
  详细：失败, 行包含(null, 321, null, null, null, null, null, null).
; 错误: null value in column "id" of relation "t_test" violates not-null constraint
  详细：失败, 行包含(null, 321, null, null, null, null, null, null).', '192.168.118.1', '/genteratortest/test/addData', 'com.newbie.genteratortest.controller.TestController.addData', 'POST', 63, '2024-09-30 18:49:55.966');
INSERT INTO "public"."sys_log_operate" VALUES ('1840705758195400705', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 18:50:26.07');
INSERT INTO "public"."sys_log_operate" VALUES ('1840705770103029762', 'admin', '0', '
### Error updating database.  Cause: org.postgresql.util.PSQLException: 错误: null value in column "id" of relation "t_test" violates not-null constraint
  详细：失败, 行包含(null, 32, 132, null, 1321, null, null, null).
### The error may exist in file [D:\Project\my\newbie\newbie-boot3\newbie-generator-test\target\classes\mapper\TestMapper.xml]
### The error may involve defaultParameterMap
### The error occurred while setting parameters
### SQL: INSERT INTO t_test( dwmc,             user_name,                          ye )           VALUES( ?,             ?,                          ? )
### Cause: org.postgresql.util.PSQLException: 错误: null value in column "id" of relation "t_test" violates not-null constraint
  详细：失败, 行包含(null, 32, 132, null, 1321, null, null, null).
; 错误: null value in column "id" of relation "t_test" violates not-null constraint
  详细：失败, 行包含(null, 32, 132, null, 1321, null, null, null).', '192.168.118.1', '/genteratortest/test/addData', 'com.newbie.genteratortest.controller.TestController.addData', 'POST', 63, '2024-09-30 18:50:28.916');
INSERT INTO "public"."sys_log_operate" VALUES ('1840705954119712769', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 8, '2024-09-30 18:51:12.783');
INSERT INTO "public"."sys_log_operate" VALUES ('1840707544868294657', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 18:57:32.047');
INSERT INTO "public"."sys_log_operate" VALUES ('1840707568813576194', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> ServiceImpl  [in template "serviceImpl.java.ftl" at line 24, column 16]

----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: ${ServiceImpl}  [in template "serviceImpl.java.ftl" at line 24, column 14]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 82, '2024-09-30 18:57:37.766');
INSERT INTO "public"."sys_log_operate" VALUES ('1840707768974077954', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 18:58:25.478');
INSERT INTO "public"."sys_log_operate" VALUES ('1840707775596883969', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> Controller  [in template "controller.java.ftl" at line 30, column 16]

----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: ${Controller}  [in template "controller.java.ftl" at line 30, column 14]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 88, '2024-09-30 18:58:27.065');
INSERT INTO "public"."sys_log_operate" VALUES ('1840707951367581697', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 18:59:08.964');
INSERT INTO "public"."sys_log_operate" VALUES ('1840715201784176642', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 19:27:57.598');
INSERT INTO "public"."sys_log_operate" VALUES ('1840715528247828482', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 9, '2024-09-30 19:29:15.437');
INSERT INTO "public"."sys_log_operate" VALUES ('1840718696218140674', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 19:41:50.735');
INSERT INTO "public"."sys_log_operate" VALUES ('1840718718108213250', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> ModuleName  [in template "menu.sql.ftl" at line 11, column 82]

----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: ${ModuleName}  [in template "menu.sql.ftl" at line 11, column 80]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 87, '2024-09-30 19:41:55.959');
INSERT INTO "public"."sys_log_operate" VALUES ('1840718875126177794', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> ModuleName  [in template "menu.sql.ftl" at line 11, column 82]

----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: ${ModuleName}  [in template "menu.sql.ftl" at line 11, column 80]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 27, '2024-09-30 19:42:33.404');
INSERT INTO "public"."sys_log_operate" VALUES ('1840719024254660610', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> date  [in template "menu.sql.ftl" at line 11, column 175]

----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: ${date}  [in template "menu.sql.ftl" at line 11, column 173]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 2359, '2024-09-30 19:43:08.945');
INSERT INTO "public"."sys_log_operate" VALUES ('1840719905356263426', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 19:46:39.016');
INSERT INTO "public"."sys_log_operate" VALUES ('1840726232430284801', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 20:11:47.509');
INSERT INTO "public"."sys_log_operate" VALUES ('1840726247085182977', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 7, '2024-09-30 20:11:51.008');
INSERT INTO "public"."sys_log_operate" VALUES ('1840726321299197953', 'admin', '0', 'InvalidReferenceException: The following has evaluated to null or missing:
==> field.comment  [in template "dataForm.vue.ftl" at line 10, column 30]

----
Tip: It''s the step after the last dot that caused this error, not those before it.
----
Tip: If the failing expression is known to legally refer to something that''s sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: ${field.comment}  [in template "dataForm.vue.ftl" at line 10, column 28]
----', '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 100, '2024-09-30 20:12:08.7');
INSERT INTO "public"."sys_log_operate" VALUES ('1840726711440773121', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 20:13:41.714');
INSERT INTO "public"."sys_log_operate" VALUES ('1840726911458742273', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 20:14:29.408');
INSERT INTO "public"."sys_log_operate" VALUES ('1840726950453186562', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 20:14:38.706');
INSERT INTO "public"."sys_log_operate" VALUES ('1840726961672949761', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-30 20:14:41.385');
INSERT INTO "public"."sys_log_operate" VALUES ('1840727093948715009', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 20:15:12.914');
INSERT INTO "public"."sys_log_operate" VALUES ('1840727207740182530', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 20:15:40.052');
INSERT INTO "public"."sys_log_operate" VALUES ('1840727226417418241', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-30 20:15:44.495');
INSERT INTO "public"."sys_log_operate" VALUES ('1840727230716579842', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-09-30 20:15:45.519');
INSERT INTO "public"."sys_log_operate" VALUES ('1840727602386477057', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 3, '2024-09-30 20:17:14.131');
INSERT INTO "public"."sys_log_operate" VALUES ('1840727867328077825', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 6, '2024-09-30 20:18:17.303');
INSERT INTO "public"."sys_log_operate" VALUES ('1840727891344662529', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-30 20:18:23.035');
INSERT INTO "public"."sys_log_operate" VALUES ('1840727971116130306', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 6, '2024-09-30 20:18:42.053');
INSERT INTO "public"."sys_log_operate" VALUES ('1842016137106255873', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-10-04 09:37:24.749');
INSERT INTO "public"."sys_log_operate" VALUES ('1842016190894010369', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 2, '2024-10-04 09:37:37.572');
INSERT INTO "public"."sys_log_operate" VALUES ('1842016198166933506', 'admin', '0', 'java.io.FileNotFoundException: D:\project\upload\public\2024\05\24\hbg0276.jpg (系统找不到指定的路径。)', '192.168.118.1', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-10-04 09:37:39.307');
INSERT INTO "public"."sys_log_operate" VALUES ('1842022442034278401', 'admin', '0', NULL, '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 161, '2024-10-04 10:02:27.96');
INSERT INTO "public"."sys_log_operate" VALUES ('1842023118760062977', 'admin', '0', NULL, '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 52138, '2024-10-04 10:05:09.314');
INSERT INTO "public"."sys_log_operate" VALUES ('1842023205699596289', 'admin', '0', NULL, '192.168.118.1', '/generator/generate', 'com.newbie.generator.controller.GeneratorController.generate', 'POST', 7148, '2024-10-04 10:05:30.033');

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
INSERT INTO "public"."sys_menu" VALUES ('2008', '系统管理', '0', 2, '1', '/system', NULL, '', NULL, 'admin', '2023-02-26 01:31:55', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys', 'TdesignSystemSetting', '0', '', '0', NULL, '0', '2008', 1, '/system/user');
INSERT INTO "public"."sys_menu" VALUES ('2009', '用户管理', '2008', 1, '1', '/system/user', 'SysUser', 'system/user/index', NULL, 'admin', '2023-02-26 01:49:34', 'admin', '2024-04-23 19:04:05', '0', '1', '0', 'sys.user', 'MaterialSymbolsManageAccountsOutlineRounded', '0', '', '0', NULL, '0', '2008,2009', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('2010', '角色管理', '2008', 2, '1', '/system/role', 'SysRole', 'system/role/index', NULL, 'admin', '2023-02-26 02:31:10', 'admin', '2024-05-02 14:45:13', '0', '1', '0', 'sys.role', 'CarbonUserRole', '0', '', '0', '', '0', '2008,2010', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('2013', '菜单管理', '2008', 3, '1', '/system/menu', 'SysMenu', 'system/menu/index', NULL, 'admin', '2023-02-26 23:11:00', 'admin', '2024-04-23 19:00:35', '0', '1', '0', 'sys.menu', 'FluentTextBulletListTree16Regular', '0', '', '0', NULL, '0', '2008,2013', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('2042', '首页', '0', 0, '1', '/home', '', 'home/index', '', 'admin', '2023-07-31 05:37:08', 'admin', '2024-05-28 14:34:03', '0', '1', '0', '', 'ep:home-filled', '0', '', '0', NULL, '1', '2042', 1, NULL);
INSERT INTO "public"."sys_menu" VALUES ('2050', '新增', '2013', 1, '1', NULL, NULL, NULL, '菜单新增按钮', 'admin', '2023-08-27 15:54:22', 'admin', '2024-04-18 16:04:23', '0', '0', '0', 'sys.menu.add', NULL, NULL, '', '0', NULL, '0', '2008,2013,2050', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('2051', '修改', '2013', 2, '1', NULL, NULL, NULL, '菜单编辑按钮', 'admin', '2023-08-27 15:54:58', 'admin', '2024-04-18 18:04:41', '0', '0', '0', 'sys.menu.update', NULL, NULL, '', '0', NULL, '0', '2008,2013,2051', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('2052', '删除', '2013', 3, '1', NULL, NULL, NULL, '菜单删除按钮', 'admin', '2023-08-27 15:55:21', 'admin', '2024-04-18 16:04:54', '0', '0', '0', 'sys.menu.del', NULL, NULL, '', '0', NULL, '0', '2008,2013,2052', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('2069', '前端文档', '2072', 98, '1', 'https://zhangyuge7.github.io/preview/five-admin-v2-docs/', '', '', '', 'admin', '2023-11-10 15:03:57', 'admin', '2024-05-18 17:13:56', '0', '1', '0', '', 'ep:document', '0', '', '0', NULL, '0', '2072,2069', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('2071', '部门管理', '2008', 6, '1', '/system/dept', 'SysDept', 'system/dept/index', '', 'admin', '2023-11-18 22:46:58', 'admin', '2024-04-23 19:00:55', '0', '1', '0', 'sys.dept', 'MingcuteDepartmentLine', '0', '', '0', '', '0', '2008,2071', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3009', '字典分类', '2008', 10, '1', '/system/dict/type', 'SysDeptType', 'system/dictType/index', '', 'admin', '2023-11-19 22:33:46', 'admin', '2024-04-23 19:01:22', '0', '1', '1', 'sys.dict.type', 'MingcuteBook5Line', '0', '', '0', '', '0', '2008,3009', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3010', '字典管理', '2008', 11, '1', '/system/dict/data', 'SysDictData', 'system/dictData/index', '', 'admin', '2024-02-20 11:29:06', 'admin', '2024-04-23 19:01:48', '0', '1', '0', 'sys.dict.data', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0', '2008,3010', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3015', '个人中心', '0', 99, '1', '/personal-center', 'PersonalCenter', 'personalCenter/index', '', 'admin', '2024-03-22 12:38:00', 'admin', '2024-05-24 11:17:16', '0', '1', '0', '', 'CarbonUserRole', '0', '', '0', '', '0', '3015', 1, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3038', '新增', '2009', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:10', NULL, NULL, '0', '0', '0', 'sys.user.add', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3038', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3039', '修改', '2009', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:22', 'admin', '2024-04-18 16:07:44', '0', '0', '0', 'sys.user.update', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3039', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3040', '删除', '2009', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:34', NULL, NULL, '0', '0', '0', 'sys.user.del', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3040', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3041', '修改密码', '2009', 4, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:07:24', NULL, NULL, '0', '0', '0', 'sys.user.update.password', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3041', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3042', '新增', '2010', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:31', NULL, NULL, '0', '0', '0', 'sys.role.add', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3042', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3043', '修改', '2010', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:46', NULL, NULL, '0', '0', '0', 'sys.role.update', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3043', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3044', '删除', '2010', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:02:04', NULL, NULL, '0', '0', '0', 'sys.role.del', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3044', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3045', '权限', '2010', 4, '1', NULL, NULL, NULL, '分配权限按钮', 'admin', '2024-04-18 18:03:10', NULL, NULL, '0', '0', '0', 'sys.role.perm', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3045', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3046', '用户', '2010', 5, '1', NULL, NULL, NULL, '分配用户按钮', 'admin', '2024-04-18 18:03:35', NULL, NULL, '0', '0', '0', 'sys.role.user', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3046', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3047', '新增', '2071', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:07', NULL, NULL, '0', '0', '0', 'sys.dept.add', NULL, '0', NULL, '0', NULL, '0', '2008,2071,3047', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3048', '修改', '2071', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:25', NULL, NULL, '0', '0', '0', 'sys.dept.update', NULL, '0', NULL, '0', NULL, '0', '2008,2071,3048', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3049', '删除', '2071', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:57', NULL, NULL, '0', '0', '0', 'sys.dept.del', NULL, '0', NULL, '0', NULL, '0', '2008,2071,3049', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3050', '新增', '3009', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:05:37', 'admin', '2024-04-18 18:05:53', '0', '0', '0', 'sys.dict.type.add', NULL, '0', NULL, '0', NULL, '0', '2008,3009,3050', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3051', '修改', '3009', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:25', NULL, NULL, '0', '0', '0', 'sys.dict.type.update', NULL, '0', NULL, '0', NULL, '0', '2008,3009,3051', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3052', '删除', '3009', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:40', NULL, NULL, '0', '0', '0', 'sys.dict.type.del', NULL, '0', NULL, '0', NULL, '0', '2008,3009,3052', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3053', '新增', '3010', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:10', NULL, NULL, '0', '0', '0', 'sys.dict.data.add', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3053', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3054', '修改', '3010', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:25', NULL, NULL, '0', '0', '0', 'sys.dict.data.update', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3054', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3055', '删除', '3010', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:48', NULL, NULL, '0', '0', '0', 'sys.dict.data.del', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3055', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3056', '默认', '3010', 4, '1', NULL, NULL, NULL, '字典数据设置默认的按钮', 'admin', '2024-04-18 18:08:52', NULL, NULL, '0', '0', '0', 'sys.dict.data.def', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3056', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3059', '演示', '0', 98, '1', '/demo', '', '', '', 'admin', '2024-04-30 15:06:58', 'admin', '2024-05-18 17:11:44', '0', '1', '0', '', 'MingcuteDepartmentLine', '0', '', '0', '', '0', '3059', 1, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3060', '上传下载', '3059', 1, '1', '/uploadtest', 'UploadTest', 'demo/UploadTest', '', 'admin', '2024-04-30 15:08:16', NULL, NULL, '0', '1', '0', '', '', '0', '', '0', '', '0', '3059,3060', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('3068', 'API文档', '2072', 1, '1', 'http://localhost:8080/swagger-ui/index.html,_blank', '', '', '', 'admin', '2024-05-25 14:33:52', 'admin', '2024-05-25 14:35:04', '0', '1', '0', '', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0', '2072,3068', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('1795419039163936769', '系统监控', '0', 3, '1', '/monitor', NULL, NULL, NULL, 'admin', '2024-05-28 19:37:10', 'admin', '2024-05-28 19:42:41', '0', '1', '0', NULL, 'CarbonCloudMonitoring', '0', NULL, '0', NULL, '0', '1795419039163936769', 1, '/monitor/server');
INSERT INTO "public"."sys_menu" VALUES ('1795424113898455041', '操作日志', '1795419039163936769', 20, '1', '/monitor/operatelog', 'SysLogOperate', 'monitor/logOperate/index', NULL, 'admin', '2024-05-28 19:57:20', 'admin', '2024-05-28 20:06:45', '0', '1', '0', 'sys.log.operate', 'MaterialSymbolsDataInfoAlertRounded', '0', NULL, '0', NULL, '0', '1795419039163936769,1795424113898455041', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('1795426597572345858', '删除', '1795424113898455041', 10, '1', NULL, NULL, NULL, NULL, 'admin', '2024-05-28 20:07:12', 'admin', '2024-05-28 20:07:12', NULL, '0', NULL, 'sys.log.operate.del', NULL, NULL, NULL, NULL, NULL, NULL, '1795419039163936769,1795424113898455041,1795426597572345858', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('1795426808940101633', '登录日志', '1795419039163936769', 30, '1', '/monitor/loginlog', 'SysLogLogin', 'monitor/logLogin/index', NULL, 'admin', '2024-05-28 20:08:03', 'admin', '2024-05-28 20:08:43', '0', '1', '0', 'sys.log.login', 'MaterialSymbolsDataInfoAlertRounded', '0', NULL, '0', NULL, '0', '1795419039163936769,1795426808940101633', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('1795427077400723458', '删除', '1795426808940101633', 10, '1', NULL, NULL, NULL, NULL, 'admin', '2024-05-28 20:09:07', 'admin', '2024-05-28 20:09:07', NULL, '0', NULL, 'sys.log.login.del', NULL, NULL, NULL, NULL, NULL, NULL, '1795419039163936769,1795426808940101633,1795427077400723458', 3, NULL);
INSERT INTO "public"."sys_menu" VALUES ('1796439829787398145', '服务监控', '1795419039163936769', 50, '1', '/monitor/server', 'SysServerMonitor', 'monitor/serverMonitor/index', '', 'admin', '2024-05-31 15:13:26', 'admin', '2024-06-04 16:01:58.989', '0', '1', '0', 'sys.monitor.server', 'CarbonCloudMonitoring', '0', '', '0', '', '0', '1795419039163936769,1796439829787398145', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('2072', '文档', '0', 22, '1', '/docs', '', '', '', 'admin', '2023-11-19 00:04:13', 'admin', '2024-09-12 13:47:28.418', '0', '1', '0', '', 'StreamlineInterfaceSettingMenu1ButtonParallelHorizontalLinesMenuNavigationThreeHamburger', '0', '', '0', '', '0', '2072', 1, NULL);
INSERT INTO "public"."sys_menu" VALUES ('1840579422453780482', '开发工具', '0', 100, '1', '/devtool', '', '', '', 'admin', '2024-09-30 10:28:25', 'admin', '2024-09-30 10:30:59.46', '0', '1', '0', '', 'TdesignSystemSetting', '0', '', '0', '', '0', '1840579422453780482', 1, '');
INSERT INTO "public"."sys_menu" VALUES ('1840580008502906881', '代码生成器', '1840579422453780482', 1, '1', '/dev-tool/generator', 'Generator', 'dev-tool/generator/index', '', 'admin', '2024-09-30 10:30:45.007', 'admin', '2024-09-30 10:30:45.015', '0', '1', '0', '', 'CarbonCloudMonitoring', '0', '', '0', '', '0', '1840579422453780482,1840580008502906881', 2, '');
INSERT INTO "public"."sys_menu" VALUES ('dde3e764-a6a4-4c14-9c32-ea1fbdfdcfc1', '新增', '77ca6f16-9670-4f05-a404-463df02739df', 1, '1', NULL, NULL, NULL, '新增按钮', 'NewbieGenerator', '2024-10-04 00:00:00', NULL, NULL, '0', '0', '0', 'generator.genConfig.add', NULL, '0', NULL, '0', NULL, '0', '1840579422453780482,77ca6f16-9670-4f05-a404-463df02739df,dde3e764-a6a4-4c14-9c32-ea1fbdfdcfc1', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('71c0d4ff-df7a-4f60-b6f7-3bbd16498c0d', '修改', '77ca6f16-9670-4f05-a404-463df02739df', 2, '1', NULL, NULL, NULL, '修改按钮', 'NewbieGenerator', '2024-10-04 00:00:00', NULL, NULL, '0', '0', '0', 'generator.genConfig.update', NULL, '0', NULL, '0', NULL, '0', '1840579422453780482,77ca6f16-9670-4f05-a404-463df02739df,71c0d4ff-df7a-4f60-b6f7-3bbd16498c0d', 2, NULL);
INSERT INTO "public"."sys_menu" VALUES ('77ca6f16-9670-4f05-a404-463df02739df', '代码生成器配置', '1840579422453780482', 1, '1', '/dev-tool/genConfig', 'GeneratorgenConfigVue', 'dev-tool/genConfig/index', NULL, 'NewbieGenerator', '2024-10-04 00:00:00', 'admin', '2024-10-04 10:57:44.904', '0', '1', '0', 'generator.genConfig.list', 'TdesignSystemSetting', '0', '', '0', '', '0', '1840579422453780482,77ca6f16-9670-4f05-a404-463df02739df', 1, NULL);
INSERT INTO "public"."sys_menu" VALUES ('d339b227-2352-48d0-b8a6-77ed46fcfc7e', '删除', '77ca6f16-9670-4f05-a404-463df02739df', 3, '1', NULL, NULL, NULL, '删除按钮', 'NewbieGenerator', '2024-10-04 00:00:00', NULL, NULL, '0', '0', '0', 'generator.genConfig.delete', NULL, '0', NULL, '0', NULL, '0', '1840579422453780482,77ca6f16-9670-4f05-a404-463df02739df,d339b227-2352-48d0-b8a6-77ed46fcfc7e', 2, NULL);

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
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411419996161', '173', '2042', 'admin', '2024-10-04 15:04:20.473', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411436773378', '173', '2072', 'admin', '2024-10-04 15:04:20.477', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411436773379', '173', '3068', 'admin', '2024-10-04 15:04:20.477', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411436773380', '173', '2069', 'admin', '2024-10-04 15:04:20.477', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411436773381', '173', '3059', 'admin', '2024-10-04 15:04:20.477', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411436773382', '173', '3060', 'admin', '2024-10-04 15:04:20.477', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411436773383', '173', '3015', 'admin', '2024-10-04 15:04:20.477', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411436773384', '173', '1840579422453780482', 'admin', '2024-10-04 15:04:20.477', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411436773385', '173', '1840580008502906881', 'admin', '2024-10-04 15:04:20.477', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411449356289', '173', '77ca6f16-9670-4f05-a404-463df02739df', 'admin', '2024-10-04 15:04:20.481', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411449356290', '173', 'dde3e764-a6a4-4c14-9c32-ea1fbdfdcfc1', 'admin', '2024-10-04 15:04:20.481', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411449356291', '173', '71c0d4ff-df7a-4f60-b6f7-3bbd16498c0d', 'admin', '2024-10-04 15:04:20.481', NULL, NULL);
INSERT INTO "public"."sys_role_menu" VALUES ('1842098411449356292', '173', 'd339b227-2352-48d0-b8a6-77ed46fcfc7e', 'admin', '2024-10-04 15:04:20.481', NULL, NULL);

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
INSERT INTO "public"."sys_user" VALUES ('1800799163996672001', '271', 'test', '$2a$10$.y5fzz0PCqygP3kx/MEiguH0.H6a4zXxSnVAoZBLZfG7GJMfv0G6C', '测试用户', NULL, '', '18566666666', '', '1', '1', '密码：123456', 1, 'admin', '2024-06-12 15:55:52.584', NULL, NULL);
INSERT INTO "public"."sys_user" VALUES ('57', NULL, 'admin', '$2a$10$Jc9ytizwSRL/nVR6.NGDfOpTgAl0Kwh8BhPhM7/1BmbKLtnsjgOFa', '系统管理员', 'public/2024/10/04/_4k_uhd__pony_tail_by_assassinwarrior_dbfqubi1834.jpg', NULL, '18800000000', '32132@qq.com', '1', '1', NULL, 0, NULL, '2024-05-24 09:15:38', 'admin', '2024-10-04 09:37:45.068');

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
-- Primary Key structure for table gen_config
-- ----------------------------
ALTER TABLE "public"."gen_config" ADD CONSTRAINT "gen_config_pk" PRIMARY KEY ("id");

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
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_pkey" PRIMARY KEY ("id");
