package com.newbie.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.newbie.common.entity.SysUser;
import com.newbie.common.util.R;
import com.newbie.security.domain.body.PasswordBody;
import com.newbie.system.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/system/user")
@RequiredArgsConstructor
public class SysUserController {
    private final SysUserService sysUserService;

    @GetMapping("/page")
    public R<IPage<SysUser>> getUserPaging(Page<SysUser> page, SysUser sysUser) {
        IPage<SysUser> iPage = sysUserService.queryPage(page, sysUser);
        return R.ok(iPage);
    }

    @PostMapping("/add")
    public R<Object> addUser(@RequestBody SysUser sysUser) {
        Long userId = sysUser.getId();
        if (userId != null) {
            return R.error("请检查此数据是否已存在,userId=" + userId);
        }
        sysUserService.saveUser(sysUser);
        return R.ok();
    }

    @PostMapping("/update")
    public R<Object> updateUser(@RequestBody SysUser sysUser) {
        if (sysUser.getId() == null) {
            return R.error("用户ID为空");
        }
        sysUserService.updateUser(sysUser);
        return R.ok();
    }

    @DeleteMapping("/{id}")
    public R<Object> deleteUser(@PathVariable Long id) {
        if (id == null) {
            return R.error("id为空");
        }
        return sysUserService.removeById(id) ? R.ok() : R.error("删除失败");
    }

    @PostMapping("/updateUserPassword")
    public R<Object> updateUserPassword(@RequestBody PasswordBody passwordBody){
        boolean b = sysUserService.updateUserPassword(passwordBody.getUserId(),passwordBody.getNewPassword(),passwordBody.getConfirmPassword());
        return b?R.ok().setMsg("修改成功"):R.error("修改密码失败");
    }

    /**
     * 根据角色ID查询已分配的用户
     *
     * @param page    分页参数对象
     * @param sysUser 筛选条件对象
     * @param roleId  角色ID
     * @return
     */
    @GetMapping("/queryUserByRoleId/{roleId}")
    public R<IPage<SysUser>> queryUserByRoleId(Page<SysUser> page, SysUser sysUser, @PathVariable("roleId") Long roleId) {
        IPage<SysUser> pageInfo = sysUserService.queryUserByRoleId(page, sysUser, roleId);
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
    @GetMapping("/queryUnUserByRoleId/{roleId}")
    public R<IPage<SysUser>> queryUnUserByRoleId(Page<SysUser> page, SysUser sysUser, @PathVariable("roleId") Long roleId) {
        IPage<SysUser> pageInfo = sysUserService.queryUnUserByRoleId(page, sysUser, roleId);
        return R.ok(pageInfo);
    }
}
