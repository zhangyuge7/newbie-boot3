package com.newbie.controller.security;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.thread.ThreadUtil;
import com.newbie.common.annotation.IgnoreWebLog;
import com.newbie.common.constant.LoginMethodConstant;
import com.newbie.common.domain.LoginUser;
import com.newbie.system.service.SysLogLoginService;
import com.newbie.common.util.R;
import com.newbie.common.util.SecurityUtils;
import com.newbie.security.domain.Route;
import com.newbie.security.domain.body.LoginBody;
import com.newbie.security.domain.body.PasswordBody;
import com.newbie.security.domain.vo.Captcha;
import com.newbie.security.service.CaptchaService;
import com.newbie.security.service.SecurityService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 11:30
 * @Descriptions: 安全控制
 */
@RestController
@RequestMapping("/security")
@RequiredArgsConstructor
public class SecurityController {

    private final SecurityService securityService;
    private final CaptchaService captchaService;
    private final SysLogLoginService sysLogLoginService;

    @IgnoreWebLog
    @GetMapping("/imageCaptcha")
    public R<Captcha> imageCaptcha(String key) {

        /*
        为了节省资源
        建议重新生成验证码时，提供之前获取验证码的key
        * */
        if (!StringUtils.hasLength(key)) {
            key = "captcha:" + UUID.randomUUID();
        }
        return R.ok(captchaService.create(key));
    }

    @PostMapping("/initAdmin")
    public R<Object> initAdmin(@RequestBody PasswordBody passwordBody) {
        securityService.initAdmin(passwordBody);
        return R.ok().setMsg("admin初始化成功");
    }

    @IgnoreWebLog
    @PostMapping("/login")
    public R<SaTokenInfo> login(@RequestBody LoginBody loginBody) {
        long startTimeMillis = System.currentTimeMillis();
        try {
            SaTokenInfo tokenInfo = securityService.login(loginBody);
            // 保存登录日志
            sysLogLoginService.saveLoginLog(loginBody.getUsername(),startTimeMillis,"1",LoginMethodConstant.USERNAME);
            return R.ok(tokenInfo);
        }catch (Exception e){
            // 保存登录日志
            sysLogLoginService.saveLoginLog(loginBody.getUsername(),startTimeMillis,"1",LoginMethodConstant.USERNAME,e);
            throw e;
        }
    }

    @IgnoreWebLog
    @PostMapping("/logout")
    public R<Object> logout() {
        long startTimeMillis = System.currentTimeMillis();
        LoginUser loginUser = SecurityUtils.getCurrentLoginUser();
        try {
            StpUtil.logout();
            // 保存登出日志
            sysLogLoginService.saveLoginLog(loginUser.getUsername(),startTimeMillis,"0",LoginMethodConstant.USERNAME);
            return R.ok();
        }catch (Exception e){
            sysLogLoginService.saveLoginLog(loginUser.getUsername(),startTimeMillis,"0",LoginMethodConstant.USERNAME,e);
            throw e;
        }

    }

    @IgnoreWebLog
    @GetMapping("/userInfo")
    public R<Object> userInfo() {
        return R.ok(SecurityUtils.getCurrentLoginUser());
    }

    @PostMapping("/updatePassword")
    public R<Object> updatePassword(@RequestBody PasswordBody passwordBody) {
        securityService.updatePassword(passwordBody);
        return R.ok();
    }

    @IgnoreWebLog
    @GetMapping("/menus")
    public R<List<Route>> menus() {
        return R.ok(securityService.getMenuList());
    }

}
