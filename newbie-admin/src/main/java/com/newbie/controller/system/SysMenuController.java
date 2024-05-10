package com.newbie.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.newbie.common.entity.SysMenu;
import com.newbie.common.util.R;
import com.newbie.system.domain.vo.SysMenuVO;
import com.newbie.system.service.SysMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/system/menu")
@RequiredArgsConstructor
public class SysMenuController {
    private final SysMenuService sysMenuService;

    @SaCheckPermission("sys.menu")
    @GetMapping("/tree")
    public R<List<SysMenuVO>> tree(SysMenu sysMenu) {
        List<SysMenuVO> ls = sysMenuService.menuTree(sysMenu);
        return R.ok(ls);
    }

    @SaCheckPermission("sys.menu.add")
    @PostMapping("/add")
    public R<Object> add(@RequestBody SysMenu sysMenu) {
        Long menuId = sysMenu.getId();
        if (menuId != null) {
            return R.error("请检查此数据是否已存在,menuId=" + menuId);
        }
        return sysMenuService.addData(sysMenu) ? R.ok().setMsg("新增成功") : R.error("新增失败");
    }

    @SaCheckPermission("sys.menu.update")
    @PostMapping("/update")
    public R<Object> update(@RequestBody SysMenu sysMenu) {
        if (sysMenu.getId() == null) {
            return R.error("菜单ID为空");
        }
        return sysMenuService.updateData(sysMenu) ? R.ok().setMsg("修改成功") : R.error("修改失败");
    }

    @SaCheckPermission("sys.menu.del")
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody Long[] ids) {
        if (ids == null || ids.length == 0) return R.error("菜单ID为空");
        sysMenuService.deleteBatch(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }
}
