package com.newbie.system.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.newbie.common.entity.SysRoleMenu;
import com.newbie.common.util.R;
import com.newbie.system.domain.body.SysRoleMenuBody;
import com.newbie.system.service.SysRoleMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/system/role_menu")
@RequiredArgsConstructor
public class SysRoleMenuController {
    private final SysRoleMenuService sysRoleMenuService;

    @PostMapping("/removeAndSaveByRoleId")
    @Transactional
    public R<Object> removeAndSaveByRoleId(@RequestBody SysRoleMenuBody sysRoleMenuBody) {
        Long roleId = sysRoleMenuBody.getRoleId();
        List<Long> menuIds = sysRoleMenuBody.getMenuIds();
        if (roleId == null || menuIds == null) {
            return R.error("角色ID或菜单ID列表为空");
        }

        // 根据 roleId 删除已有的权限信息
        boolean b1 = sysRoleMenuService.remove(Wrappers.<SysRoleMenu>lambdaQuery().eq(SysRoleMenu::getRoleId, sysRoleMenuBody.getRoleId()));

        // 保存角色权限信息
        List<SysRoleMenu> sysRoleMenuList = new ArrayList<>();
        menuIds.forEach(menuId -> {
            SysRoleMenu sysRoleMenu = new SysRoleMenu();
            sysRoleMenu.setMenuId(menuId);
            sysRoleMenu.setRoleId(roleId);
            sysRoleMenuList.add(sysRoleMenu);
        });
        boolean b2 = sysRoleMenuService.saveBatch(sysRoleMenuList);

        return b1 && b2 ? R.ok() : R.error("操作失败");
    }


    /**
     * 根据角色ID获取权限关系列表
     *
     * @param roleId 角色ID
     * @return 角色权限关系列表
     */
    @GetMapping("/listByRoleId")
    public R<List<SysRoleMenu>> menuIdsByRoleId(Long roleId) {
        List<SysRoleMenu> list = sysRoleMenuService
                .lambdaQuery()
                .eq(SysRoleMenu::getRoleId, roleId)
                .list();
        return R.ok(list);
    }
}
