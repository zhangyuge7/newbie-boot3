package com.newbie.weblog.aspect;

import cn.hutool.core.thread.ThreadUtil;
import com.newbie.common.domain.LoginUser;
import com.newbie.common.domain.entity.SysLogOperate;
import com.newbie.common.util.IpUtils;
import com.newbie.common.util.SecurityUtils;
import com.newbie.system.service.SysLogOperateService;
import com.newbie.weblog.config.WebLogConfigProperties;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Objects;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/5/18 下午6:48
 * @Descriptions: 日志切面通知
 */
@Component
@RequiredArgsConstructor
public class WebLogAspectAdvice {
    private final SysLogOperateService sysLogOperateService;
    private final WebLogConfigProperties webLogConfigProperties;

    public Object doAroundAdvice(ProceedingJoinPoint point)  throws Throwable{
        long beginTime = System.currentTimeMillis();
        try {
            Object proceed = point.proceed();
            if (!webLogConfigProperties.getOnlyError()) {
                this.saveSysLog(point, beginTime, null);
            }
            return proceed;
        } catch (Throwable throwable) {
            this.saveSysLog(point, beginTime, throwable);
            throw throwable;
        }
    }

    private void saveSysLog(ProceedingJoinPoint point, long startTimeMillis, Throwable throwable) {
        // 获取Request对象
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        // 创建操作日志对象
        SysLogOperate sysLogOperate = new SysLogOperate();
        // 获取当前用户
        try {
            LoginUser currentLoginUser = SecurityUtils.getCurrentLoginUser();
            if (Objects.nonNull(currentLoginUser)) {
                // 操作者用户名
                sysLogOperate.setUsername(currentLoginUser.getUsername());
            }
        }catch (Exception e){
            sysLogOperate.setUsername("#");
        }

        // 客户端地址
        sysLogOperate.setClientIp(IpUtils.getIpAddr(request));
        // 接口路径
        sysLogOperate.setTargetUri(request.getRequestURI());
        // 目标方法
        String methodName = point.getSignature().getName();
        String className = point.getTarget().getClass().getName();
        sysLogOperate.setTargetFun(className + "." + methodName);
        // 请求方式
        sysLogOperate.setMethod(request.getMethod());


        if (Objects.nonNull(throwable)) {
            // 日志类型，1 正常，0 异常
            sysLogOperate.setStatus("0");
            // 异常消息
            sysLogOperate.setFailReason(throwable.getMessage());
        }else{
            sysLogOperate.setStatus("1");
        }
        // 消耗时长，毫秒
        sysLogOperate.setCostTime(System.currentTimeMillis() - startTimeMillis);
        ThreadUtil.execute(()->{
            sysLogOperateService.save(sysLogOperate);
        });

    }
}
