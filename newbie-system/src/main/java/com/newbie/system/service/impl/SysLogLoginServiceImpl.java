package com.newbie.system.service.impl;

import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.http.Header;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.domain.entity.SysLogLogin;
import com.newbie.common.util.IpUtils;
import com.newbie.system.mapper.SysLogLoginMapper;
import com.newbie.system.service.SysLogLoginService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Objects;

/**
 * @author 39869
 * @description 针对表【sys_log_login(系统登录日志)】的数据库操作Service实现
 * @createDate 2024-05-20 16:09:37
 */
@Service
public class SysLogLoginServiceImpl extends ServiceImpl<SysLogLoginMapper, SysLogLogin>
        implements SysLogLoginService {

    @Override
    public void saveLoginLog(String username, long startTimeMillis,String type,String loginMethod) {
        this.saveLoginLog(username, startTimeMillis,type, loginMethod,null);
    }

    @Override
    public void saveLoginLog(String username, long startTimeMillis,String type,String loginMethod, Throwable e) {
        // 获取Request对象
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        // 创建登录日志对象
        SysLogLogin sysLogLogin = new SysLogLogin();

        sysLogLogin.setUsername(username);
        sysLogLogin.setStatus(e == null ? "1" : "0");
        sysLogLogin.setFailReason(e == null ? null : e.getMessage());
        sysLogLogin.setLoginIp(IpUtils.getIpAddr(request));
        sysLogLogin.setLoginMethod(loginMethod);
        UserAgent ua = UserAgentUtil.parse(request.getHeader(Header.USER_AGENT.toString()));
        String osInfo = ua.getOs().getName() + "(" + ua.getOsVersion() + ")";
        String browserInfo = ua.getBrowser().getName() + "(" + ua.getVersion() + ")";
        sysLogLogin.setOs(osInfo);
        sysLogLogin.setBrowser(browserInfo);
        sysLogLogin.setLoginType(type);
        sysLogLogin.setCostTime(System.currentTimeMillis() - startTimeMillis);
        // 保存
        ThreadUtil.execute(() -> {
            this.save(sysLogLogin);
        });
    }
}




