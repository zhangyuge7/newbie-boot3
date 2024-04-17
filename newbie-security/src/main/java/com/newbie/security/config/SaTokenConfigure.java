package com.newbie.security.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.jwt.StpLogicJwtForSimple;
import cn.dev33.satoken.stp.StpLogic;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 10:29
 * @Descriptions: SaToken配置
 */
@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {
    public static final String LOGIN_URL = "/security/login";
    // 白名单
    public static final String[] WHITE_LIST = {"/security/initAdmin"};

    /**
     * 注册拦截器
     *
     * @param registry 注册器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册 Sa-Token 拦截器
        registry.addInterceptor(new SaInterceptor(handler -> StpUtil.checkLogin()))
                .addPathPatterns("/**")
                .excludePathPatterns(LOGIN_URL)
                .excludePathPatterns(WHITE_LIST);
    }

    // Sa-Token 整合 jwt
    @Bean
    public StpLogic getStpLogicJwt() {
        return new StpLogicJwtForSimple(); // Simple 简单模式
    }
}
