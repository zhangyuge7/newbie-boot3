package com.newbie.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.entity.SysUser;
import com.newbie.common.util.R;
import com.newbie.security.domain.body.PasswordBody;
import com.newbie.system.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;


@RestController
@RequestMapping("/system/user")
@RequiredArgsConstructor
public class SysUserController {
    private final SysUserService sysUserService;

    @GetMapping("/page")
    public R<IPage<SysUser>> page(Page<SysUser> page, SysUser sysUser) {
        IPage<SysUser> iPage = sysUserService.queryPage(page, sysUser);
        return R.ok(iPage);
    }

    @PostMapping("/add")
    public R<Object> add(@RequestBody SysUser sysUser) {
        Long userId = sysUser.getId();
        if (userId != null)  return R.error("请检查此数据是否已存在,userId=" + userId);
        sysUserService.saveUser(sysUser);
        return R.ok().setMsg("添加成功");
    }

    @PostMapping("/update")
    public R<Object> update(@RequestBody SysUser sysUser) {
        if (sysUser.getId() == null) return R.error("用户ID为空");
        sysUserService.updateUser(sysUser);
        return R.ok().setMsg("修改成功");
    }

    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody Long[] ids) {
        if(ids==null || ids.length==0) return R.error("用户ID为空");
        sysUserService.deleteBatch(Arrays.asList(ids));
        return  R.ok().setMsg("删除成功");
    }

    @PostMapping("/updateUserPassword")
    public R<Object> updateUserPassword(@RequestBody PasswordBody passwordBody){
        boolean b = sysUserService.updateUserPassword(passwordBody.getUserId(),passwordBody.getNewPassword(),passwordBody.getConfirmPassword());
        return b?R.ok().setMsg("修改成功"):R.error("修改密码失败");
    }
}
