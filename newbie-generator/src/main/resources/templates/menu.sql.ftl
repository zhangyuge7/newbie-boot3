-- 需要自定义的值，搜索替换。菜单默认为顶级菜单，如果不是请自行添加或修改
-- 菜单ID                         menuId_123
-- 新增按钮ID                     addButId_123
-- 修改按钮ID                     updateButId_123
-- 删除按钮ID                     delButId_123



-- 页面菜单
INSERT INTO sys_menu (id,title, parent_id, sort, status, route_path, route_name, component, remark, create_by, create_time, update_by, update_time, is_keep, type, is_hide, perm, icon, hide_children, iframe_link, is_outer, transition, fixed_tab, ancestors, tier)
VALUES ('menuId_123','${table.comment}', '0', 1, '1', '/${package.ModuleName}/${controllerMappingHyphen}', '${upModuleName}${entity}Vue', '${package.ModuleName}/${controllerMappingHyphen}/index', NULL, 'NewbieGenerator', '${date}', NULL, NULL, '0', '1', '0', '${package.ModuleName}.${controllerMappingHyphen}', '', '0', '', '0', '', '0', '0,menuId_123', 1);

-- 新增按钮
INSERT INTO sys_menu (id, title, parent_id, sort, status,  remark, create_by, create_time,  is_keep, type, is_hide, perm, icon, hide_children, iframe_link, is_outer, transition, fixed_tab, ancestors, tier)
VALUES ('addButId_123', '新增', 'menuId_123', 1, '1',  '新增按钮', 'NewbieGenerator', '${date}',  '0', '0', '0', '${package.ModuleName}.${controllerMappingHyphen}.add', NULL, '0', NULL, '0', NULL, '0', '0,menuId_123,addButId_123', 2);

-- 修改按钮
INSERT INTO sys_menu (id, title, parent_id, sort, status,  remark, create_by, create_time,  is_keep, type, is_hide, perm, icon, hide_children, iframe_link, is_outer, transition, fixed_tab, ancestors, tier)
VALUES ('updateButId_123', '修改', 'menuId_123', 2, '1',  '修改按钮', 'NewbieGenerator', '${date}',  '0', '0', '0', '${package.ModuleName}.${controllerMappingHyphen}.update', NULL, '0', NULL, '0', NULL, '0', '0,menuId_123,updateButId_123', 2);

-- 删除按钮
INSERT INTO sys_menu (id, title, parent_id, sort, status,  remark, create_by, create_time,  is_keep, type, is_hide, perm, icon, hide_children, iframe_link, is_outer, transition, fixed_tab, ancestors, tier)
VALUES ('delButId_123', '删除', 'menuId_123', 3, '1',  '删除按钮', 'NewbieGenerator', '${date}',  '0', '0', '0', '${package.ModuleName}.${controllerMappingHyphen}.del', NULL, '0', NULL, '0', NULL, '0', '0,menuId_123,delButId_123', 2);



