package com.newbie.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.domain.entity.SysUser;
import com.newbie.common.util.R;
import com.newbie.security.domain.body.PasswordBody;
import com.newbie.system.service.SysUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;


@RestController
@RequestMapping("/system/user")
@RequiredArgsConstructor
@Tag(name = "用户管理")
public class SysUserController {
    private final SysUserService sysUserService;

    @Operation(summary ="查询分页数据")
    @SaCheckPermission("sys.user")
    @GetMapping("/paging")
    public R<IPage<SysUser>> paging(Page<SysUser> page, SysUser sysUser) {
        IPage<SysUser> iPage = sysUserService.queryPage(page, sysUser);
        return R.ok(iPage);
    }

    @Operation(summary ="新增")
    @SaCheckPermission("sys.user.add")
    @PostMapping("/add")
    public R<Object> add(@RequestBody SysUser sysUser) {
        String userId = sysUser.getId();
        if (StringUtils.hasLength(userId))  return R.error("请检查此数据是否已存在,userId=" + userId);
        sysUserService.saveUser(sysUser);
        return R.ok().setMsg("添加成功");
    }

    @Operation(summary ="修改")
    @SaCheckPermission("sys.user.update")
    @PostMapping("/update")
    public R<Object> update(@RequestBody SysUser sysUser) {
        if (sysUser.getId() == null) return R.error("用户ID为空");
        sysUserService.updateUser(sysUser);
        return R.ok().setMsg("修改成功");
    }

    @Operation(summary ="批量删除")
    @SaCheckPermission("sys.user.del")
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody String[] ids) {
        if(ids==null || ids.length==0) return R.error("用户ID为空");
        sysUserService.deleteBatch(Arrays.asList(ids));
        return  R.ok().setMsg("删除成功");
    }

    @Operation(summary ="修改用户密码")
    @SaCheckPermission("sys.user.update.password")
    @PostMapping("/updateUserPassword")
    public R<Object> updateUserPassword(@RequestBody PasswordBody passwordBody){
        boolean b = sysUserService.updateUserPassword(passwordBody.getUserId(),passwordBody.getNewPassword(),passwordBody.getConfirmPassword(),passwordBody.getImmediatelyKick());
        return b?R.ok().setMsg("修改成功"):R.error("修改密码失败");
    }

    /**
     * 当前用户修改自己的基本用户信息
     * @param sysUser 用户对象
     * @return
     */
    @Operation(summary ="当前用户修改自己的基本用户信息")
    @PostMapping("/updateByCurr")
    public R<Object> updateByCurr(@RequestBody SysUser sysUser){
        sysUserService.updateByCurr(sysUser);
        return R.ok();
    }
}
