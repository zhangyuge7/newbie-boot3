package com.newbie.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.domain.entity.SysRole;
import com.newbie.common.util.R;
import com.newbie.system.service.SysRoleService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

@RestController
@RequestMapping("/system/role")
@RequiredArgsConstructor
@Tag(name = "角色管理")
public class SysRoleController {
    private final SysRoleService sysRoleService;

    @Operation(summary ="查询分页数据")
    @SaCheckPermission("sys.role")
    @GetMapping("/paging")
    public R<IPage<SysRole>> paging(Page<SysRole> page, SysRole sysRole) {
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

    @Operation(summary ="新增")
    @SaCheckPermission("sys.role.add")
    @PostMapping("/add")
    public R<Object> add(@RequestBody SysRole sysRole) {
        String roleId = sysRole.getId();
        if (StringUtils.hasLength(roleId)) return R.error("添加失败，请检查此数据是否已存在,roleId=" + roleId);
        // 查询角色编码唯一
        if (sysRoleService.lambdaQuery().eq(SysRole::getRoleCode, sysRole.getRoleCode()).count() > 0)
            return R.error("角色编码已存在");

        // 保存角色信息
        sysRoleService.save(sysRole);
        return R.ok().setMsg("添加成功");
    }

    @Operation(summary ="修改")
    @SaCheckPermission("sys.role.update")
    @PostMapping("/update")
    public R<Object> update(@RequestBody SysRole sysRole) {
        if (sysRole.getId() == null) {
            return R.error("角色ID为空");
        }
        // 判断角色编码是否重复
        if (sysRoleService.lambdaQuery()
                .eq(SysRole::getRoleCode, sysRole.getRoleCode())
                .ne(SysRole::getId, sysRole.getId()).count() > 0)
            return R.error("角色编码已存在");


        // 修改角色信息
        sysRoleService.updateById(sysRole);
        return R.ok().setMsg("修改成功");
    }

    @Operation(summary ="批量删除")
    @SaCheckPermission("sys.role.del")
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody String[] ids) {
        if (ids == null || ids.length == 0) return R.error("角色ID为空");
        sysRoleService.deleteBatch(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }

}
