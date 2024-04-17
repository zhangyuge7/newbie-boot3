package com.newbie.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.entity.SysRole;
import com.newbie.common.util.R;
import com.newbie.system.service.SysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@RestController
@RequestMapping("/system/role")
@RequiredArgsConstructor
public class SysRoleController {
    private final SysRoleService sysRoleService;


    @GetMapping("/page")
    public R<IPage<SysRole>> page(Page<SysRole> page, SysRole sysRole) {
        String roleName = sysRole.getRoleName();
        String roleCode = sysRole.getRoleCode();
        String status = sysRole.getStatus();

        Page<SysRole> pageInfo = sysRoleService
                .lambdaQuery()
                .like(StringUtils.hasLength(roleName), SysRole::getRoleName, roleName)
                .like(StringUtils.hasLength(roleCode), SysRole::getRoleCode, roleCode)
                .eq(StringUtils.hasLength(status), SysRole::getStatus, status)
                .orderBy(true, true, SysRole::getSort)
                .page(page);
        return R.ok(pageInfo);
    }

    @PostMapping("/add")
    public R<Object> add(@RequestBody SysRole sysRole) {
        Long roleId = sysRole.getId();
        if(roleId != null){
            return R.error("请检查此数据是否已存在,roleId=" + roleId);
        }
        // 查询角色编码唯一
        if (Objects.nonNull(sysRoleService.lambdaQuery().eq(SysRole::getRoleCode, sysRole.getRoleCode()).one())) {
            return R.error("角色编码已存在");
        }

        // 保存角色信息
        sysRoleService.save(sysRole);
        return R.ok();
    }

    @PostMapping("/update")
    public R<Object> update(@RequestBody SysRole sysRole) {
        if (sysRole.getId() == null) {
            return R.error("角色ID为空");
        }
        // 判断角色编码是否重复
        SysRole one = sysRoleService.lambdaQuery().eq(SysRole::getRoleCode, sysRole.getRoleCode()).one();
        if (Objects.nonNull(one) && !one.getId().equals(sysRole.getId())) {
            return R.error("角色编码已存在");
        }

        // 修改角色信息
        sysRoleService.updateById(sysRole);
        return R.ok();
    }

    @DeleteMapping("/{id}")
    public R<Object> deleteRole(@PathVariable Long id) {
        return sysRoleService.removeById(id)?R.ok():R.error("删除失败");
    }

}
