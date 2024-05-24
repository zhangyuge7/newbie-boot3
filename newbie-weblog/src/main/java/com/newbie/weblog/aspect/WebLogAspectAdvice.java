package com.newbie.weblog.aspect;

import com.newbie.system.service.SysLogOperateService;
import com.newbie.weblog.config.WebLogConfigProperties;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.stereotype.Component;

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
        String methodName = point.getSignature().getName();
        String className = point.getTarget().getClass().getName();
        try {
            Object proceed = point.proceed();
            if (!webLogConfigProperties.getOnlyError()) {
                sysLogOperateService.saveSysLogOperate(className + "." + methodName, beginTime);
            }
            return proceed;
        } catch (Throwable throwable) {
            sysLogOperateService.saveSysLogOperate(className + "." + methodName, beginTime, throwable);
            throw throwable;
        }
    }
}
