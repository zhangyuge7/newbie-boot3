package com.newbie.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.newbie.common.domain.entity.SysRoleMenu;
import com.newbie.common.util.R;
import com.newbie.system.domain.body.SysRoleMenuBody;
import com.newbie.system.service.SysRoleMenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/system/role_menu")
@RequiredArgsConstructor
@Tag(name = "角色菜单关系")
public class SysRoleMenuController {
    private final SysRoleMenuService sysRoleMenuService;

    @Operation(summary ="根据角色id删除角色与权限关系并重新保存")
    @SaCheckPermission("sys.role.perm")
    @PostMapping("/removeAndSaveByRoleId")
    @Transactional
    public R<Object> removeAndSaveByRoleId(@RequestBody SysRoleMenuBody sysRoleMenuBody) {
        String roleId = sysRoleMenuBody.getRoleId();
        List<String> menuIds = sysRoleMenuBody.getMenuIds();
        if (roleId == null || menuIds == null) return R.error("角色ID或菜单ID列表为空");

        // 根据 roleId 删除已有的权限信息
        sysRoleMenuService.remove(Wrappers.<SysRoleMenu>lambdaQuery().eq(SysRoleMenu::getRoleId, sysRoleMenuBody.getRoleId()));

        // 保存角色权限信息
        List<SysRoleMenu> sysRoleMenuList = new ArrayList<>();
        menuIds.forEach(menuId -> {
            SysRoleMenu sysRoleMenu = new SysRoleMenu();
            sysRoleMenu.setMenuId(menuId);
            sysRoleMenu.setRoleId(roleId);
            sysRoleMenuList.add(sysRoleMenu);
        });
        sysRoleMenuService.saveBatch(sysRoleMenuList);

        return R.ok().setMsg("保存成功");
    }


    /**
     * 根据角色ID获取权限关系列表
     *
     * @param roleId 角色ID
     * @return 角色权限关系列表
     */
    @Operation(summary ="根据角色ID获取权限关系列表")
    @SaCheckPermission("sys.role.perm")
    @GetMapping("/listByRoleId")
    public R<List<SysRoleMenu>> menuIdsByRoleId(String roleId) {
        List<SysRoleMenu> list = sysRoleMenuService
                .lambdaQuery()
                .eq(SysRoleMenu::getRoleId, roleId)
                .list();
        return R.ok(list);
    }
}
