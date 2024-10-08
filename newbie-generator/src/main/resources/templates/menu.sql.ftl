-- 需要自定义的值：搜索 aaa 替换为父级菜单ID的值。
-- 菜单ID        ${menuId}
-- 新增按钮ID     ${addButId}
-- 修改按钮ID     ${updateButId}
-- 删除按钮ID     ${deleteButId}



-- 页面菜单
INSERT INTO sys_menu (id,title, parent_id, sort, status, route_path, route_name, component, remark, create_by, create_time, update_by, update_time, is_keep, type, is_hide, perm, icon, hide_children, iframe_link, is_outer, transition, fixed_tab, ancestors, tier)
VALUES ('${menuId}','${comment}', 'aaa', 1, '1', '/${gc.moduleName}/${entity}', '${gc.ModuleName}${entity}Vue', '${gc.moduleName}/${entity}/index', NULL, 'NewbieGenerator', '${gc.date}', NULL, NULL, '0', '1', '0', '${gc.moduleName}.${entity}.list', '', '0', '', '0', '', '0', 'aaa,${menuId}', 1);

-- 新增按钮
INSERT INTO sys_menu (id, title, parent_id, sort, status,  remark, create_by, create_time,  is_keep, type, is_hide, perm, icon, hide_children, iframe_link, is_outer, transition, fixed_tab, ancestors, tier)
VALUES ('${addButId}', '新增', '${menuId}', 1, '1',  '新增按钮', 'NewbieGenerator', '${gc.date}',  '0', '0', '0', '${gc.moduleName}.${entity}.add', NULL, '0', NULL, '0', NULL, '0', 'aaa,${menuId},${addButId}', 2);

-- 修改按钮
INSERT INTO sys_menu (id, title, parent_id, sort, status,  remark, create_by, create_time,  is_keep, type, is_hide, perm, icon, hide_children, iframe_link, is_outer, transition, fixed_tab, ancestors, tier)
VALUES ('${updateButId}', '修改', '${menuId}', 2, '1',  '修改按钮', 'NewbieGenerator', '${gc.date}',  '0', '0', '0', '${gc.moduleName}.${entity}.update', NULL, '0', NULL, '0', NULL, '0', 'aaa,${menuId},${updateButId}', 2);

-- 删除按钮
INSERT INTO sys_menu (id, title, parent_id, sort, status,  remark, create_by, create_time,  is_keep, type, is_hide, perm, icon, hide_children, iframe_link, is_outer, transition, fixed_tab, ancestors, tier)
VALUES ('${deleteButId}', '删除', '${menuId}', 3, '1',  '删除按钮', 'NewbieGenerator', '${gc.date}',  '0', '0', '0', '${gc.moduleName}.${entity}.delete', NULL, '0', NULL, '0', NULL, '0', 'aaa,${menuId},${deleteButId}', 2);



