package com.newbie.weblog.aspect;

import com.newbie.weblog.conditional.AllApiStrategyConditional;
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
@Conditional(AllApiStrategyConditional.class)
@Slf4j
@RequiredArgsConstructor
public class AllApiWebLogAspect {

    static {
        log.info("启用 Web Log 记录日志 ---- 使用 ALL_API 策略");
    }

    private final WebLogAspectAdvice webLogAspectAdvice;

    @Pointcut(
            "@annotation(org.springframework.web.bind.annotation.GetMapping) " +
                    "|| @annotation(org.springframework.web.bind.annotation.PostMapping) " +
                    "|| @annotation(org.springframework.web.bind.annotation.PutMapping) " +
                    "||  @annotation(org.springframework.web.bind.annotation.DeleteMapping)" +
                    "|| @annotation(org.springframework.web.bind.annotation.PatchMapping)" +
                    "|| @annotation(org.springframework.web.bind.annotation.RequestMapping)"

    )
    public void requestMappingCut() {
    }

    @Pointcut("@annotation(com.newbie.common.annotation.IgnoreWebLog) || @within(com.newbie.common.annotation.IgnoreWebLog)")
    public void ignoreWebLogCut() {
    }

    @Pointcut("requestMappingCut() && !ignoreWebLogCut()")
    public void webLogCut() {
    }

    @Around(value = "webLogCut()")
    public Object doAroundAdvice(ProceedingJoinPoint point) throws Throwable {
        return webLogAspectAdvice.doAroundAdvice(point);
    }
}
