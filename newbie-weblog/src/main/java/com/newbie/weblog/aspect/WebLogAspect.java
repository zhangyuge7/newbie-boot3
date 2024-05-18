package com.newbie.weblog.aspect;

import com.newbie.weblog.conditional.DefaultStrategyConditional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Component;

@Aspect
@Component
@ConditionalOnWebApplication
@Conditional(DefaultStrategyConditional.class)
@Slf4j
@RequiredArgsConstructor
public class WebLogAspect {

    private final WebLogAspectAdvice webLogAspectAdvice;
    static {
        log.info("启用 Web Log 记录日志 ---- 使用 DEFAULT 策略");
    }


    @Pointcut("@annotation(com.newbie.common.annotation.IgnoreWebLog) || @within(com.newbie.common.annotation.IgnoreWebLog)")
    public void ignoreWebLogCut() {
    }
    @Pointcut("@annotation(com.newbie.common.annotation.WebLog) || @within(com.newbie.common.annotation.WebLog)")
    public void WebLogCut() {
    }

    @Around(value = "WebLogCut() && !ignoreWebLogCut()")
    public Object doAroundAdvice(ProceedingJoinPoint point) throws Throwable {
        return webLogAspectAdvice.doAroundAdvice(point);
    }
}
