package com.newbie.system.controller;


import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.entity.SysUser;
import com.newbie.common.entity.SysUserRole;
import com.newbie.common.exception.NewbieException;
import com.newbie.common.util.R;
import com.newbie.system.domain.body.SysUserRoleBody;
import com.newbie.system.service.SysUserRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/system/user_role")
@RequiredArgsConstructor
public class SysUserRoleController {
    private final SysUserRoleService sysUserRoleService;

    /**
     * 增量关联
     */
    @SaCheckPermission("sys.role.user")
    @PostMapping("/append")
    public R<Object> append(@RequestBody SysUserRoleBody sysUserRoleBody) {
        List<SysUserRole> list = this.bodyToSysUserRole(sysUserRoleBody);
        sysUserRoleService.saveBatch(list);
        return R.ok().setMsg("关联成功");
    }

    /**
     * 批量清楚关联
     */
    @SaCheckPermission("sys.role.user")
    @PostMapping("/cancelBatch")
    public R<Object> batchDel(@RequestBody SysUserRoleBody sysUserRoleBody) {
        List<Long> userIds = sysUserRoleBody.getUserIds();
        List<Long> roleIds = sysUserRoleBody.getRoleIds();
        if (CollectionUtils.isEmpty(roleIds) || CollectionUtils.isEmpty(userIds)) {
            return R.error("用户ID或角色ID不能为空");

        }

        if(userIds.size() == 1){
            sysUserRoleService.removeByUserIdAndRoleIds(userIds.getFirst(), roleIds);
        }else if(roleIds.size() == 1){
            sysUserRoleService.removeByRoleIdAndUserIds(roleIds.getFirst(), userIds);
        }else{
            return R.error("用户ID或角色ID不能同时大于1");
        }

        return R.ok().setMsg("取消关联成功");
    }

    private List<SysUserRole> bodyToSysUserRole(SysUserRoleBody sysUserRoleBody) {
        List<Long> userIds = sysUserRoleBody.getUserIds();
        List<Long> roleIds = sysUserRoleBody.getRoleIds();
        if (CollectionUtils.isEmpty(roleIds) || CollectionUtils.isEmpty(userIds)) {
            throw new NewbieException("用户ID或角色ID不能为空");
        }
        if (userIds.size() > 1 && roleIds.size() > 1) {
            throw new NewbieException("用户ID或角色ID不能同时大于1");
        }

        List<SysUserRole> list = new ArrayList<>();
        userIds.forEach(uid -> {
            roleIds.forEach(rid -> {
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(uid);
                sysUserRole.setRoleId(rid);
                list.add(sysUserRole);
            });
        });
        return list;
    }

    /**
     * 根据角色ID查询已分配的用户
     *
     * @param page    分页参数对象
     * @param sysUser 筛选条件对象
     * @param roleId  角色ID
     * @return
     */
    @SaCheckPermission("sys.role.user")
    @GetMapping("/queryUserByRoleId/{roleId}")
    public R<IPage<SysUser>> queryUserByRoleId(Page<SysUser> page, SysUser sysUser, @PathVariable("roleId") Long roleId) {
        IPage<SysUser> pageInfo = sysUserRoleService.queryUserByRoleId(page, sysUser, roleId);
        return R.ok(pageInfo);
    }

    /**
     * 根据角色ID查询未分配的用户
     *
     * @param page    分页参数对象
     * @param sysUser 筛选条件对象
     * @param roleId  角色ID
     * @return
     */
    @SaCheckPermission("sys.role.user")
    @GetMapping("/queryUnUserByRoleId/{roleId}")
    public R<IPage<SysUser>> queryUnUserByRoleId(Page<SysUser> page, SysUser sysUser, @PathVariable("roleId") Long roleId) {
        IPage<SysUser> pageInfo = sysUserRoleService.queryUnUserByRoleId(page, sysUser, roleId);
        return R.ok(pageInfo);
    }
}
