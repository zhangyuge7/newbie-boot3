package com.newbie.system.controller;

import com.newbie.common.entity.SysMenu;
import com.newbie.common.util.R;
import com.newbie.system.domain.vo.SysMenuVO;
import com.newbie.system.service.SysMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/system/menu")
@RequiredArgsConstructor
public class SysMenuController {
    private final SysMenuService sysMenuService;

    @GetMapping("/tree")
    public R<List<SysMenuVO>> tree(SysMenu sysMenu) {
        List<SysMenuVO> ls = sysMenuService.menuTree(sysMenu);
        return R.ok(ls);
    }

    @PostMapping("/add")
    public R<Object> add(@RequestBody SysMenu sysMenu) {
        Long menuId = sysMenu.getId();
        if (menuId != null) {
            return R.error("请检查此数据是否已存在,menuId=" + menuId);
        }
        return sysMenuService.addData(sysMenu) ? R.ok() : R.error("新增失败");
    }

    @PostMapping("/update")
    public R<Object> update(@RequestBody SysMenu sysMenu) {
        if (sysMenu.getId() == null) {
            return R.error("菜单ID为空");
        }
        return sysMenuService.updateData(sysMenu) ? R.ok() : R.error("修改失败");
    }

    @PostMapping("/delete")
    public R<Object> delete(@RequestBody String[] ids) {
        if (ids==null || ids.length==0) {
            return R.error("id列表为空");
        }
        List<Long> idList = Arrays.stream(ids).map(Long::valueOf).collect(Collectors.toList());
        boolean b = sysMenuService.deleteBatchByIds(idList);
        return b ? R.ok() : R.error("操作失败");
    }
}
