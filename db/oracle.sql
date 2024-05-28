/*
 Navicat Premium Data Transfer

 Source Server         : oracle
 Source Server Type    : Oracle
 Source Server Version : 120100 (Oracle Database 12c Standard Edition Release 12.1.0.2.0 - 64bit Production)
 Source Host           : 10.68.199.105:1521
 Source Schema         : TEST1

 Target Server Type    : Oracle
 Target Server Version : 120100 (Oracle Database 12c Standard Edition Release 12.1.0.2.0 - 64bit Production)
 File Encoding         : 65001

 Date: 27/05/2024 19:02:13
*/


-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
CREATE TABLE TEST1.sys_dept (
  id NUMBER(20,0) VISIBLE NOT NULL,
  dept_name NVARCHAR2(30) VISIBLE,
  parent_id NUMBER(20,0) VISIBLE,
  ancestors NVARCHAR2(1000) VISIBLE,
  sort NUMBER(11,0) VISIBLE,
  leader NVARCHAR2(30) VISIBLE,
  phone NCHAR(11) VISIBLE,
  email NVARCHAR2(50) VISIBLE,
  status NCHAR(1) VISIBLE,
  tier NUMBER(11,0) VISIBLE,
  home_path NVARCHAR2(255) VISIBLE,
  remark NVARCHAR2(120) VISIBLE,
  create_by NVARCHAR2(30) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(30) VISIBLE,
  update_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_dept.id IS '主键';
COMMENT ON COLUMN TEST1.sys_dept.dept_name IS '部门名称';
COMMENT ON COLUMN TEST1.sys_dept.parent_id IS '父级id';
COMMENT ON COLUMN TEST1.sys_dept.ancestors IS '祖级列表';
COMMENT ON COLUMN TEST1.sys_dept.sort IS '显示顺序';
COMMENT ON COLUMN TEST1.sys_dept.leader IS '负责人';
COMMENT ON COLUMN TEST1.sys_dept.phone IS '联系电话';
COMMENT ON COLUMN TEST1.sys_dept.email IS '邮箱';
COMMENT ON COLUMN TEST1.sys_dept.status IS '状态（1正常 0停用）';
COMMENT ON COLUMN TEST1.sys_dept.tier IS '层级';
COMMENT ON COLUMN TEST1.sys_dept.home_path IS '首页路由地址';
COMMENT ON COLUMN TEST1.sys_dept.remark IS '备注';
COMMENT ON COLUMN TEST1.sys_dept.create_by IS '创建者';
COMMENT ON COLUMN TEST1.sys_dept.create_time IS '创建时间';
COMMENT ON COLUMN TEST1.sys_dept.update_by IS '更新者';
COMMENT ON COLUMN TEST1.sys_dept.update_time IS '修改时间';
COMMENT ON TABLE TEST1.sys_dept IS '部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO TEST1.sys_dept VALUES ('270', '公司总部', '0', '270', '1', '张三', '13566666666', 'zhangsan@newbie.com', '1', '1', NULL, '描述信息', 'admin', TO_DATE('2023-11-28 19:42:59', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dept VALUES ('271', '山东分公司', '270', '270,271', '1', '张三', '13566666666', 'zhangsan@newbie.com', '1', '2', NULL, '描述信息', 'admin', TO_DATE('2023-11-28 19:43:42', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dept VALUES ('272', '河南分公司', '270', '270,272', '2', '李四', '13566666666', 'lisi@newbie.com', '1', '2', NULL, '描述信息', 'admin', TO_DATE('2023-11-28 19:46:35', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dept VALUES ('273', '云南分公司', '270', '270,273', '3', '王五', '13566666666', 'wangwu@newbie.com', '1', '2', NULL, '描述信息', 'admin', TO_DATE('2023-11-28 19:51:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dept VALUES ('274', '河北分公司', '270', '270,274', '4', '赵六', '13599999999', 'zhaoliu@newbie.com', '1', '2', NULL, '描述信息', 'admin', TO_DATE('2023-11-28 19:51:55', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dept VALUES ('275', '东营分部', '271', '270,271,275', '2', '悟空', '13234435454', 'wukong@newbie.com', '1', '3', NULL, '描述信息', 'admin', TO_DATE('2023-11-28 19:53:38', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dept VALUES ('276', '济南分部', '271', '270,271,276', '1', '八戒', '15543547357', 'bajie@newbie.com', '1', '3', NULL, '描述信息', 'admin', TO_DATE('2023-11-28 19:55:25', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dept VALUES ('277', '昆明分部', '273', '270,273,277', '1', '三藏', '16546273436', 'sanzang@newbie.com', '1', '3', NULL, NULL, 'admin', TO_DATE('2023-11-28 19:56:21', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dept VALUES ('278', '济宁分部', '271', '270,271,278', '4', '阿虎', '16323242332', 'ahu@newbie.com', '1', '3', NULL, NULL, 'admin', TO_DATE('2023-11-28 19:57:47', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dept VALUES ('279', '菏泽分部', '271', '270,271,279', '5', '石头', '16767466463', 'shitou@newbie.com', '1', '3', NULL, NULL, 'admin', TO_DATE('2023-11-28 19:58:35', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:57:50', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
CREATE TABLE TEST1.sys_dict_data (
  id NUMBER(20,0) VISIBLE NOT NULL,
  label NVARCHAR2(30) VISIBLE,
  value NVARCHAR2(10) VISIBLE,
  type_id NUMBER(20,0) VISIBLE,
  ele_type NVARCHAR2(10) VISIBLE,
  ele_class NVARCHAR2(255) VISIBLE,
  status NCHAR(1) VISIBLE,
  def NCHAR(1) VISIBLE,
  sort NUMBER(11,0) VISIBLE,
  remark NVARCHAR2(120) VISIBLE,
  create_by NVARCHAR2(30) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(30) VISIBLE,
  update_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_dict_data.id IS '主键';
COMMENT ON COLUMN TEST1.sys_dict_data.label IS '标签';
COMMENT ON COLUMN TEST1.sys_dict_data.value IS '值';
COMMENT ON COLUMN TEST1.sys_dict_data.type_id IS '字典类型ID';
COMMENT ON COLUMN TEST1.sys_dict_data.ele_type IS '元素类型';
COMMENT ON COLUMN TEST1.sys_dict_data.ele_class IS '元素样式类名';
COMMENT ON COLUMN TEST1.sys_dict_data.status IS '状态（1正常 0禁用）';
COMMENT ON COLUMN TEST1.sys_dict_data.def IS '默认，Y/N';
COMMENT ON COLUMN TEST1.sys_dict_data.sort IS '排序字段';
COMMENT ON COLUMN TEST1.sys_dict_data.remark IS '备注';
COMMENT ON COLUMN TEST1.sys_dict_data.create_by IS '创建者';
COMMENT ON COLUMN TEST1.sys_dict_data.create_time IS '创建时间';
COMMENT ON COLUMN TEST1.sys_dict_data.update_by IS '修改者';
COMMENT ON COLUMN TEST1.sys_dict_data.update_time IS '修改时间';
COMMENT ON TABLE TEST1.sys_dict_data IS '系统字典数据';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO TEST1.sys_dict_data VALUES ('16', '女', '0', '33', 'danger', NULL, '1', 'N', '1', NULL, NULL, TO_DATE('2024-02-21 17:10:58', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-09 22:38:57', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('19', '男', '1', '33', 'primary', NULL, '1', 'N', '2', NULL, NULL, TO_DATE('2024-03-09 13:28:37', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-09 23:16:49', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('20', '正常', '1', '35', 'primary', NULL, '1', 'Y', '1', NULL, NULL, TO_DATE('2024-03-09 21:02:49', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-09 23:16:45', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('21', '锁定', '0', '35', 'info', NULL, '1', 'N', '2', NULL, NULL, TO_DATE('2024-03-09 21:02:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-09 22:36:03', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('22', '正常', '1', '37', 'primary', 'status-enable status-box', '1', 'Y', '1', NULL, NULL, TO_DATE('2024-03-09 21:34:07', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-18 14:55:10', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('23', '禁用', '0', '37', 'info', 'status-disabled status-box', '1', 'N', '2', NULL, NULL, TO_DATE('2024-03-09 21:34:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-21 18:14:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('25', '未知', '2', '33', 'warning', NULL, '1', 'Y', '3', NULL, NULL, TO_DATE('2024-03-09 22:24:30', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-09 22:37:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('26', 'primary', 'primary', '38', 'primary', NULL, '1', 'Y', '1', NULL, NULL, TO_DATE('2024-03-09 22:53:21', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-18 14:48:24', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('27', 'success', 'success', '38', 'success', NULL, '1', 'N', '2', NULL, NULL, TO_DATE('2024-03-09 22:53:30', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-09 23:17:28', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('28', 'info', 'info', '38', 'info', NULL, '1', 'N', '3', NULL, NULL, TO_DATE('2024-03-09 22:53:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-09 23:17:33', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('29', 'warning', 'warning', '38', 'warning', NULL, '1', 'N', '4', NULL, NULL, TO_DATE('2024-03-09 22:53:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-09 23:17:36', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_data VALUES ('30', 'danger', 'danger', '38', 'danger', NULL, '1', 'N', '5', NULL, NULL, TO_DATE('2024-03-09 22:53:54', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2024-03-09 23:17:40', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
CREATE TABLE TEST1.sys_dict_type (
  id NUMBER(20,0) VISIBLE NOT NULL,
  type_name NVARCHAR2(30) VISIBLE NOT NULL,
  type_code NVARCHAR2(30) VISIBLE NOT NULL,
  status NCHAR(1) VISIBLE,
  sort NUMBER(11,0) VISIBLE,
  remark NVARCHAR2(120) VISIBLE,
  create_by NVARCHAR2(30) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(30) VISIBLE,
  update_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_dict_type.id IS '主键';
COMMENT ON COLUMN TEST1.sys_dict_type.type_name IS '字典类型名称';
COMMENT ON COLUMN TEST1.sys_dict_type.type_code IS '类型编码';
COMMENT ON COLUMN TEST1.sys_dict_type.status IS '状态（1正常 0禁用）';
COMMENT ON COLUMN TEST1.sys_dict_type.sort IS '排序字段';
COMMENT ON COLUMN TEST1.sys_dict_type.remark IS '备注';
COMMENT ON COLUMN TEST1.sys_dict_type.create_by IS '创建者';
COMMENT ON COLUMN TEST1.sys_dict_type.create_time IS '创建时间';
COMMENT ON COLUMN TEST1.sys_dict_type.update_by IS '修改者';
COMMENT ON COLUMN TEST1.sys_dict_type.update_time IS '修改时间';
COMMENT ON TABLE TEST1.sys_dict_type IS '系统字典类型';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO TEST1.sys_dict_type VALUES ('33', '用户性别', 'userGender', '1', '2', NULL, 'admin', TO_DATE('2024-02-21 17:10:39', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-03-09 22:03:41', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_type VALUES ('35', '用户状态', 'userStatus', '1', '3', NULL, 'admin', TO_DATE('2024-03-09 21:02:27', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-03-09 22:50:28', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_type VALUES ('37', '通用状态', 'commonStatus', '1', '1', '通用状态', 'admin', TO_DATE('2024-03-09 21:32:14', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-30 21:48:51', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_dict_type VALUES ('38', '元素类型', 'eleType', '1', '4', '元素类型', 'admin', TO_DATE('2024-03-09 22:52:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-03-10 13:41:31', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
CREATE TABLE TEST1.sys_log_login (
  id NUMBER(20,0) VISIBLE NOT NULL,
  status NCHAR(1) VISIBLE,
  login_ip NVARCHAR2(45) VISIBLE,
  login_method NVARCHAR2(50) VISIBLE,
  fail_reason NVARCHAR2(1000) VISIBLE,
  os NVARCHAR2(255) VISIBLE,
  browser NVARCHAR2(255) VISIBLE,
  cost_time NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE,
  login_type NCHAR(1) VISIBLE,
  username NVARCHAR2(255) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_log_login.id IS '主键';
COMMENT ON COLUMN TEST1.sys_log_login.status IS '状态 1 成功，0 失败';
COMMENT ON COLUMN TEST1.sys_log_login.login_ip IS '登录IP';
COMMENT ON COLUMN TEST1.sys_log_login.login_method IS '登录方式';
COMMENT ON COLUMN TEST1.sys_log_login.fail_reason IS '失败原因';
COMMENT ON COLUMN TEST1.sys_log_login.os IS '操作系统';
COMMENT ON COLUMN TEST1.sys_log_login.browser IS '浏览器信息';
COMMENT ON COLUMN TEST1.sys_log_login.cost_time IS '消耗时长，毫秒';
COMMENT ON COLUMN TEST1.sys_log_login.create_time IS '创建时间';
COMMENT ON COLUMN TEST1.sys_log_login.login_type IS '1 登入，0 登出';
COMMENT ON COLUMN TEST1.sys_log_login.username IS '用户名';
COMMENT ON TABLE TEST1.sys_log_login IS '系统登录日志';

-- ----------------------------
-- Table structure for sys_log_operate
-- ----------------------------
CREATE TABLE TEST1.sys_log_operate (
  id NUMBER(20,0) VISIBLE NOT NULL,
  username NVARCHAR2(30) VISIBLE,
  status NCHAR(1) VISIBLE,
  fail_reason NVARCHAR2(1000) VISIBLE,
  client_ip NVARCHAR2(100) VISIBLE,
  target_uri NVARCHAR2(255) VISIBLE,
  target_fun NVARCHAR2(255) VISIBLE,
  method NVARCHAR2(10) VISIBLE,
  cost_time NUMBER(20,0) VISIBLE,
  create_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_log_operate.id IS '主键';
COMMENT ON COLUMN TEST1.sys_log_operate.username IS '用户名';
COMMENT ON COLUMN TEST1.sys_log_operate.status IS '状态，1 成功，0 失败';
COMMENT ON COLUMN TEST1.sys_log_operate.fail_reason IS '失败原因';
COMMENT ON COLUMN TEST1.sys_log_operate.client_ip IS '客户端IP';
COMMENT ON COLUMN TEST1.sys_log_operate.target_uri IS '请求路径';
COMMENT ON COLUMN TEST1.sys_log_operate.target_fun IS '执行的类方法';
COMMENT ON COLUMN TEST1.sys_log_operate.method IS '请求方式';
COMMENT ON COLUMN TEST1.sys_log_operate.cost_time IS '消耗时长，毫秒';
COMMENT ON COLUMN TEST1.sys_log_operate.create_time IS '创建时间';
COMMENT ON TABLE TEST1.sys_log_operate IS '系统操作日志';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
CREATE TABLE TEST1.sys_menu (
  id NUMBER(20,0) VISIBLE NOT NULL,
  title NVARCHAR2(50) VISIBLE NOT NULL,
  parent_id NUMBER(20,0) VISIBLE,
  sort NUMBER(11,0) VISIBLE,
  status NCHAR(1) VISIBLE,
  route_path NVARCHAR2(255) VISIBLE,
  route_name NVARCHAR2(30) VISIBLE,
  component NVARCHAR2(255) VISIBLE,
  remark NVARCHAR2(120) VISIBLE,
  create_by NVARCHAR2(30) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(30) VISIBLE,
  update_time DATE VISIBLE,
  is_keep NCHAR(1) VISIBLE,
  type NCHAR(1) VISIBLE,
  is_hide NCHAR(1) VISIBLE,
  perm NVARCHAR2(100) VISIBLE,
  icon NVARCHAR2(100) VISIBLE,
  hide_children NCHAR(1) VISIBLE,
  iframe_link NVARCHAR2(255) VISIBLE,
  is_outer NCHAR(1) VISIBLE,
  transition NVARCHAR2(30) VISIBLE,
  fixed_tab NCHAR(1) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_menu.id IS '菜单ID';
COMMENT ON COLUMN TEST1.sys_menu.title IS '菜单标题';
COMMENT ON COLUMN TEST1.sys_menu.parent_id IS '父菜单ID';
COMMENT ON COLUMN TEST1.sys_menu.sort IS '排序';
COMMENT ON COLUMN TEST1.sys_menu.status IS '菜单状态（1正常 0停用）';
COMMENT ON COLUMN TEST1.sys_menu.route_path IS '路由地址';
COMMENT ON COLUMN TEST1.sys_menu.route_name IS '路由name';
COMMENT ON COLUMN TEST1.sys_menu.component IS '组件路径';
COMMENT ON COLUMN TEST1.sys_menu.remark IS '备注';
COMMENT ON COLUMN TEST1.sys_menu.create_by IS '创建者';
COMMENT ON COLUMN TEST1.sys_menu.create_time IS '创建时间';
COMMENT ON COLUMN TEST1.sys_menu.update_by IS '更新者';
COMMENT ON COLUMN TEST1.sys_menu.update_time IS '修改时间';
COMMENT ON COLUMN TEST1.sys_menu.is_keep IS '是否缓存组件（1缓存 0不缓存）';
COMMENT ON COLUMN TEST1.sys_menu.type IS '菜单类型（1菜单 0按钮）';
COMMENT ON COLUMN TEST1.sys_menu.is_hide IS '是否隐藏菜单（1是 0否 ）';
COMMENT ON COLUMN TEST1.sys_menu.perm IS '权限标识';
COMMENT ON COLUMN TEST1.sys_menu.icon IS '菜单图标';
COMMENT ON COLUMN TEST1.sys_menu.hide_children IS '是否隐藏子级菜单（1是 0否）';
COMMENT ON COLUMN TEST1.sys_menu.iframe_link IS '内嵌外链接地址';
COMMENT ON COLUMN TEST1.sys_menu.is_outer IS '是否在layout外显示（1是 0否）';
COMMENT ON COLUMN TEST1.sys_menu.transition IS '切换动画';
COMMENT ON COLUMN TEST1.sys_menu.fixed_tab IS '是否固定在tabs（1是 0否）';
COMMENT ON TABLE TEST1.sys_menu IS '系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO TEST1.sys_menu VALUES ('2008', '系统管理', '0', '2', '1', '/system', 'System', NULL, NULL, 'admin', TO_DATE('2023-02-26 01:31:55', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:58:16', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', 'sys', 'TdesignSystemSetting', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('2009', '用户管理', '2008', '1', '1', '/system/user', 'SysUser', 'system/user/index', NULL, 'admin', TO_DATE('2023-02-26 01:49:34', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-23 19:04:05', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', 'sys.user', 'MaterialSymbolsManageAccountsOutlineRounded', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('2010', '角色管理', '2008', '2', '1', '/system/role', 'SysRole', 'system/role/index', NULL, 'admin', TO_DATE('2023-02-26 02:31:10', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-02 14:45:13', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', 'sys.role', 'CarbonUserRole', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('2013', '菜单管理', '2008', '3', '1', '/system/menu', 'SysMenu', 'system/menu/index', NULL, 'admin', TO_DATE('2023-02-26 23:11:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-23 19:00:35', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', 'sys.menu', 'FluentTextBulletListTree16Regular', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('2042', '首页', '0', '0', '1', '/home', NULL, 'home/index', NULL, 'admin', TO_DATE('2023-07-31 05:37:08', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-18 19:56:32', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', NULL, 'ep:home-filled', '0', NULL, '0', NULL, '1');
INSERT INTO TEST1.sys_menu VALUES ('2050', '新增', '2013', '1', '1', NULL, NULL, NULL, '菜单新增按钮', 'admin', TO_DATE('2023-08-27 15:54:22', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-18 16:04:23', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', 'sys.menu.add', NULL, NULL, NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('2051', '修改', '2013', '2', '1', NULL, NULL, NULL, '菜单编辑按钮', 'admin', TO_DATE('2023-08-27 15:54:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-18 18:04:41', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', 'sys.menu.update', NULL, NULL, NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('2052', '删除', '2013', '3', '1', NULL, NULL, NULL, '菜单删除按钮', 'admin', TO_DATE('2023-08-27 15:55:21', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-18 16:04:54', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', 'sys.menu.del', NULL, NULL, NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('2069', '前端文档', '2072', '98', '1', 'https://zhangyuge7.github.io/preview/five-admin-v2-docs/', NULL, NULL, NULL, 'admin', TO_DATE('2023-11-10 15:03:57', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-18 17:13:56', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', NULL, 'ep:document', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('2071', '部门管理', '2008', '6', '1', '/system/dept', 'SysDept', 'system/dept/index', NULL, 'admin', TO_DATE('2023-11-18 22:46:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-23 19:00:55', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', 'sys.dept', 'MingcuteDepartmentLine', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('2072', '文档', '0', '22', '1', '/docs', NULL, NULL, NULL, 'admin', TO_DATE('2023-11-19 00:04:13', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2023-11-28 20:58:16', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', NULL, 'EpSetting', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3009', '字典分类', '2008', '10', '1', '/system/dict/type', 'SysDeptType', 'system/dictType/index', NULL, 'admin', TO_DATE('2023-11-19 22:33:46', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-23 19:01:22', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '1', 'sys.dict.type', 'MingcuteBook5Line', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3010', '字典管理', '2008', '11', '1', '/system/dict/data', 'SysDictData', 'system/dictData/index', NULL, 'admin', TO_DATE('2024-02-20 11:29:06', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-23 19:01:48', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', 'sys.dict.data', 'SolarNotebookMinimalisticLinear', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3015', '个人中心', '0', '99', '1', '/personal-center', 'PersonalCenter', 'personalCenter/index', NULL, 'admin', TO_DATE('2024-03-22 12:38:00', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-24 11:17:16', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', NULL, 'CarbonUserRole', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3038', '新增', '2009', '1', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 16:06:10', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.user.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3039', '修改', '2009', '2', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 16:06:22', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-18 16:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', 'sys.user.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3040', '删除', '2009', '3', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 16:06:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.user.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3041', '修改密码', '2009', '4', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 16:07:24', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.user.update.password', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3042', '新增', '2010', '1', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 16:09:31', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.role.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3043', '修改', '2010', '2', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 16:09:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.role.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3044', '删除', '2010', '3', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:02:04', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.role.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3045', '权限', '2010', '4', '1', NULL, NULL, NULL, '分配权限按钮', 'admin', TO_DATE('2024-04-18 18:03:10', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.role.perm', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3046', '用户', '2010', '5', '1', NULL, NULL, NULL, '分配用户按钮', 'admin', TO_DATE('2024-04-18 18:03:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.role.user', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3047', '新增', '2071', '1', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:04:07', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.dept.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3048', '修改', '2071', '2', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:04:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.dept.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3049', '删除', '2071', '3', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:04:57', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.dept.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3050', '新增', '3009', '1', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:05:37', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-04-18 18:05:53', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', 'sys.dict.type.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3051', '修改', '3009', '2', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:06:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.dict.type.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3052', '删除', '3009', '3', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:06:40', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.dict.type.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3053', '新增', '3010', '1', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:07:10', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.dict.data.add', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3054', '修改', '3010', '2', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:07:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.dict.data.update', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3055', '删除', '3010', '3', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-04-18 18:07:48', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.dict.data.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3056', '默认', '3010', '4', '1', NULL, NULL, NULL, '字典数据设置默认的按钮', 'admin', TO_DATE('2024-04-18 18:08:52', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.dict.data.def', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3059', '演示', '0', '98', '1', '/demo', NULL, NULL, NULL, 'admin', TO_DATE('2024-04-30 15:06:58', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-18 17:11:44', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', NULL, 'MingcuteDepartmentLine', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3060', '上传下载', '3059', '1', '1', '/uploadtest', 'UploadTest', 'demo/UploadTest', NULL, 'admin', TO_DATE('2024-04-30 15:08:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '1', '0', NULL, NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3064', '操作日志', '2008', '20', '1', '/system/operatelog', 'SysLogOperate', 'system/logOperate/index', NULL, 'admin', TO_DATE('2024-05-18 21:03:59', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-19 21:29:07', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', 'sys.log.operate', 'MaterialSymbolsDataInfoAlertRounded', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3065', '登录日志', '2008', '30', '1', '/system/loginlog', 'SysLogLogin', 'system/logLogin/index', NULL, 'admin', TO_DATE('2024-05-18 21:18:26', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-24 10:37:20', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', 'sys.log.login', 'CarbonCloudMonitoring', '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3066', '删除', '3064', '10', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-05-19 21:21:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.log.operate.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3067', '删除', '3065', '10', '1', NULL, NULL, NULL, NULL, 'admin', TO_DATE('2024-05-24 11:12:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '0', '0', '0', 'sys.log.login.del', NULL, '0', NULL, '0', NULL, '0');
INSERT INTO TEST1.sys_menu VALUES ('3068', 'API文档', '2072', '1', '1', 'http://localhost:8080/swagger-ui/index.html,_blank', NULL, NULL, NULL, 'admin', TO_DATE('2024-05-25 14:33:52', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-25 14:35:04', 'SYYYY-MM-DD HH24:MI:SS'), '0', '1', '0', NULL, 'SolarNotebookMinimalisticLinear', '0', NULL, '0', NULL, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
CREATE TABLE TEST1.sys_role (
  id NUMBER(20,0) VISIBLE NOT NULL,
  role_name NVARCHAR2(30) VISIBLE NOT NULL,
  role_code NVARCHAR2(60) VISIBLE NOT NULL,
  sort NUMBER(11,0) VISIBLE,
  status NCHAR(1) VISIBLE NOT NULL,
  home_path NVARCHAR2(255) VISIBLE,
  remark NVARCHAR2(120) VISIBLE,
  create_by NVARCHAR2(30) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(30) VISIBLE,
  update_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_role.id IS '主键';
COMMENT ON COLUMN TEST1.sys_role.role_name IS '角色名称';
COMMENT ON COLUMN TEST1.sys_role.role_code IS '角色编码';
COMMENT ON COLUMN TEST1.sys_role.sort IS '排序顺序';
COMMENT ON COLUMN TEST1.sys_role.status IS '角色状态（1正常 0停用）';
COMMENT ON COLUMN TEST1.sys_role.home_path IS '首页路由地址';
COMMENT ON COLUMN TEST1.sys_role.remark IS '备注';
COMMENT ON COLUMN TEST1.sys_role.create_by IS '创建者';
COMMENT ON COLUMN TEST1.sys_role.create_time IS '创建时间';
COMMENT ON COLUMN TEST1.sys_role.update_by IS '更新者';
COMMENT ON COLUMN TEST1.sys_role.update_time IS '修改时间';
COMMENT ON TABLE TEST1.sys_role IS '角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO TEST1.sys_role VALUES ('173', '测试', 'test', '1', '1', NULL, '测试角色', 'admin', TO_DATE('2024-04-18 15:53:42', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-02 15:48:58', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
CREATE TABLE TEST1.sys_role_menu (
  id NUMBER(20,0) VISIBLE NOT NULL,
  role_id NUMBER(20,0) VISIBLE NOT NULL,
  menu_id NUMBER(20,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(30) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(30) VISIBLE,
  update_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_role_menu.id IS '主键';
COMMENT ON COLUMN TEST1.sys_role_menu.role_id IS '角色ID';
COMMENT ON COLUMN TEST1.sys_role_menu.menu_id IS '菜单ID';
COMMENT ON COLUMN TEST1.sys_role_menu.create_by IS '创建者';
COMMENT ON COLUMN TEST1.sys_role_menu.create_time IS '创建时间';
COMMENT ON COLUMN TEST1.sys_role_menu.update_by IS '修改者';
COMMENT ON COLUMN TEST1.sys_role_menu.update_time IS '修改时间';
COMMENT ON TABLE TEST1.sys_role_menu IS '角色菜单关系表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO TEST1.sys_role_menu VALUES ('1112', '173', '2042', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1113', '173', '3059', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1114', '173', '3060', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1115', '173', '3038', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1116', '173', '3039', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1117', '173', '2010', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1118', '173', '2013', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1119', '173', '2071', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1120', '173', '3009', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1121', '173', '3010', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1122', '173', '2072', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1123', '173', '2069', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1124', '173', '3015', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1125', '173', '2008', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO TEST1.sys_role_menu VALUES ('1126', '173', '2009', 'admin', TO_DATE('2024-04-30 17:05:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
CREATE TABLE TEST1.sys_user (
  id NUMBER(20,0) VISIBLE NOT NULL,
  dept_id NUMBER(20,0) VISIBLE,
  username NVARCHAR2(30) VISIBLE NOT NULL,
  password NVARCHAR2(255) VISIBLE,
  nick_name NVARCHAR2(30) VISIBLE,
  avatar NVARCHAR2(255) VISIBLE,
  home_path NVARCHAR2(255) VISIBLE,
  phone NCHAR(11) VISIBLE,
  email NVARCHAR2(35) VISIBLE,
  gender NCHAR(1) VISIBLE,
  status NCHAR(1) VISIBLE,
  remark NVARCHAR2(120) VISIBLE,
  sort NUMBER(11,0) VISIBLE,
  create_by NVARCHAR2(30) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(30) VISIBLE,
  update_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_user.id IS '主键';
COMMENT ON COLUMN TEST1.sys_user.dept_id IS '部门ID';
COMMENT ON COLUMN TEST1.sys_user.username IS '用户名';
COMMENT ON COLUMN TEST1.sys_user.password IS '密码';
COMMENT ON COLUMN TEST1.sys_user.nick_name IS '昵称';
COMMENT ON COLUMN TEST1.sys_user.avatar IS '头像地址';
COMMENT ON COLUMN TEST1.sys_user.home_path IS '首页路由地址';
COMMENT ON COLUMN TEST1.sys_user.phone IS '电话（手机号）';
COMMENT ON COLUMN TEST1.sys_user.email IS '邮箱';
COMMENT ON COLUMN TEST1.sys_user.gender IS '性别（1男 0女）';
COMMENT ON COLUMN TEST1.sys_user.status IS '账号状态（1正常 0锁定）';
COMMENT ON COLUMN TEST1.sys_user.remark IS '备注';
COMMENT ON COLUMN TEST1.sys_user.sort IS '排序';
COMMENT ON COLUMN TEST1.sys_user.create_by IS '创建者';
COMMENT ON COLUMN TEST1.sys_user.create_time IS '创建时间';
COMMENT ON COLUMN TEST1.sys_user.update_by IS '修改者';
COMMENT ON COLUMN TEST1.sys_user.update_time IS '修改时间';
COMMENT ON TABLE TEST1.sys_user IS '系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO TEST1.sys_user VALUES ('52', '272', 'test1', '$2a$10$3sFeXxGHsTI4jwIjzxjfI.kzTl52cywiKfkoUxJ7j0I0UDP4jurZC', '测试用户1', NULL, NULL, '32132132131', '3213213213211', '1', '1', NULL, '3', 'admin', TO_DATE('2024-04-18 15:51:03', 'SYYYY-MM-DD HH24:MI:SS'), 'test1', TO_DATE('2024-05-02 15:48:27', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO TEST1.sys_user VALUES ('57', NULL, 'admin', '$2a$10$Jc9ytizwSRL/nVR6.NGDfOpTgAl0Kwh8BhPhM7/1BmbKLtnsjgOFa', '系统管理员', 'public/2024/05/24/hbg0276.jpg', NULL, '18800000000', '32132@qq.com', '1', '1', NULL, '0', NULL, TO_DATE('2024-05-24 09:15:38', 'SYYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2024-05-24 17:47:42', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
CREATE TABLE TEST1.sys_user_role (
  id NUMBER(20,0) VISIBLE NOT NULL,
  user_id NUMBER(20,0) VISIBLE NOT NULL,
  role_id NUMBER(20,0) VISIBLE NOT NULL,
  create_by NVARCHAR2(30) VISIBLE,
  create_time DATE VISIBLE,
  update_by NVARCHAR2(30) VISIBLE,
  update_time DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN TEST1.sys_user_role.id IS '主键';
COMMENT ON COLUMN TEST1.sys_user_role.user_id IS '用户ID';
COMMENT ON COLUMN TEST1.sys_user_role.role_id IS '角色ID';
COMMENT ON COLUMN TEST1.sys_user_role.create_by IS '创建者';
COMMENT ON COLUMN TEST1.sys_user_role.create_time IS '创建时间';
COMMENT ON COLUMN TEST1.sys_user_role.update_by IS '修改者';
COMMENT ON COLUMN TEST1.sys_user_role.update_time IS '修改时间';
COMMENT ON TABLE TEST1.sys_user_role IS '用户和角色关系表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO TEST1.sys_user_role VALUES ('236', '52', '173', 'admin', TO_DATE('2024-05-10 17:06:28', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE TEST1.sys_dept ADD CONSTRAINT SYS_C0029354 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_dept
-- ----------------------------
ALTER TABLE TEST1.sys_dept ADD CONSTRAINT SYS_C0029337 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table sys_dict_data
-- ----------------------------
ALTER TABLE TEST1.sys_dict_data ADD CONSTRAINT SYS_C0029355 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_dict_data
-- ----------------------------
ALTER TABLE TEST1.sys_dict_data ADD CONSTRAINT SYS_C0029333 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table sys_dict_type
-- ----------------------------
ALTER TABLE TEST1.sys_dict_type ADD CONSTRAINT SYS_C0029353 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_dict_type
-- ----------------------------
ALTER TABLE TEST1.sys_dict_type ADD CONSTRAINT SYS_C0029334 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_dict_type ADD CONSTRAINT SYS_C0029335 CHECK (type_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_dict_type ADD CONSTRAINT SYS_C0029336 CHECK (type_code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table sys_dict_type
-- ----------------------------
CREATE UNIQUE INDEX TEST1.type_code
  ON TEST1.sys_dict_type (type_code ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
  FLASH_CACHE DEFAULT
)
   USABLE;

-- ----------------------------
-- Primary Key structure for table sys_log_login
-- ----------------------------
ALTER TABLE TEST1.sys_log_login ADD CONSTRAINT SYS_C0029356 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_log_login
-- ----------------------------
ALTER TABLE TEST1.sys_log_login ADD CONSTRAINT SYS_C0029332 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table sys_log_operate
-- ----------------------------
ALTER TABLE TEST1.sys_log_operate ADD CONSTRAINT SYS_C0029359 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_log_operate
-- ----------------------------
ALTER TABLE TEST1.sys_log_operate ADD CONSTRAINT SYS_C0029343 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE TEST1.sys_menu ADD CONSTRAINT SYS_C0029357 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_menu
-- ----------------------------
ALTER TABLE TEST1.sys_menu ADD CONSTRAINT SYS_C0029338 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_menu ADD CONSTRAINT SYS_C0029339 CHECK (title IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE TEST1.sys_role ADD CONSTRAINT SYS_C0029360 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_role
-- ----------------------------
ALTER TABLE TEST1.sys_role ADD CONSTRAINT SYS_C0029344 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_role ADD CONSTRAINT SYS_C0029345 CHECK (role_name IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_role ADD CONSTRAINT SYS_C0029346 CHECK (role_code IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_role ADD CONSTRAINT SYS_C0029347 CHECK (status IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE TEST1.sys_role_menu ADD CONSTRAINT SYS_C0029358 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_role_menu
-- ----------------------------
ALTER TABLE TEST1.sys_role_menu ADD CONSTRAINT SYS_C0029340 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_role_menu ADD CONSTRAINT SYS_C0029341 CHECK (role_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_role_menu ADD CONSTRAINT SYS_C0029342 CHECK (menu_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE TEST1.sys_user ADD CONSTRAINT SYS_C0029362 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_user
-- ----------------------------
ALTER TABLE TEST1.sys_user ADD CONSTRAINT SYS_C0029351 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_user ADD CONSTRAINT SYS_C0029352 CHECK (username IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE TEST1.sys_user_role ADD CONSTRAINT SYS_C0029361 PRIMARY KEY (id);

-- ----------------------------
-- Checks structure for table sys_user_role
-- ----------------------------
ALTER TABLE TEST1.sys_user_role ADD CONSTRAINT SYS_C0029348 CHECK (id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_user_role ADD CONSTRAINT SYS_C0029349 CHECK (user_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE TEST1.sys_user_role ADD CONSTRAINT SYS_C0029350 CHECK (role_id IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
