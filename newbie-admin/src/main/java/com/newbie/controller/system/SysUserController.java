package com.newbie.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.domain.entity.SysUser;
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
    @SaCheckPermission("sys.user")
    @GetMapping("/paging")
    public R<IPage<SysUser>> paging(Page<SysUser> page, SysUser sysUser) {
        IPage<SysUser> iPage = sysUserService.queryPage(page, sysUser);
        return R.ok(iPage);
    }
    @SaCheckPermission("sys.user.add")
    @PostMapping("/add")
    public R<Object> add(@RequestBody SysUser sysUser) {
        Long userId = sysUser.getId();
        if (userId != null)  return R.error("请检查此数据是否已存在,userId=" + userId);
        sysUserService.saveUser(sysUser);
        return R.ok().setMsg("添加成功");
    }
    @SaCheckPermission("sys.user.update")
    @PostMapping("/update")
    public R<Object> update(@RequestBody SysUser sysUser) {
        if (sysUser.getId() == null) return R.error("用户ID为空");
        sysUserService.updateUser(sysUser);
        return R.ok().setMsg("修改成功");
    }

    @SaCheckPermission("sys.user.del")
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody Long[] ids) {
        if(ids==null || ids.length==0) return R.error("用户ID为空");
        sysUserService.deleteBatch(Arrays.asList(ids));
        return  R.ok().setMsg("删除成功");
    }

    @SaCheckPermission("sys.user.update.password")
    @PostMapping("/updateUserPassword")
    public R<Object> updateUserPassword(@RequestBody PasswordBody passwordBody){
        boolean b = sysUserService.updateUserPassword(passwordBody.getUserId(),passwordBody.getNewPassword(),passwordBody.getConfirmPassword(),passwordBody.getImmediatelyKick());
        return b?R.ok().setMsg("修改成功"):R.error("修改密码失败");
    }
}
