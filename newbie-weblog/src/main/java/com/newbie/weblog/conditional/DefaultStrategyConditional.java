package com.newbie.weblog.conditional;

import com.newbie.weblog.enums.WebLogStrategyEnum;
import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.env.Environment;
import org.springframework.core.type.AnnotatedTypeMetadata;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.Objects;


public class DefaultStrategyConditional implements Condition {

    @Override
    public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
        Environment environment = context.getEnvironment();
        String[] activeProfiles = environment.getActiveProfiles();
        Boolean enable = environment.getProperty("newbie.weblog.enable", Boolean.class);
        String env = environment.getProperty("newbie.weblog.env");
        WebLogStrategyEnum strategy = environment.getProperty("newbie.weblog.default-strategy", WebLogStrategyEnum.class);

        return Boolean.TRUE.equals(enable)
                && (Objects.isNull(strategy) || WebLogStrategyEnum.DEFAULT.equals(strategy))
                && (!StringUtils.hasLength(env) || Arrays.asList(activeProfiles).contains(env));
    }
}
