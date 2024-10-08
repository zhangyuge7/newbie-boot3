package com.newbie.security.config;

import cn.dev33.satoken.config.SaTokenConfig;
import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.jwt.StpLogicJwtForSimple;
import cn.dev33.satoken.stp.StpLogic;
import cn.dev33.satoken.stp.StpUtil;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
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
@Data
@ConfigurationProperties(prefix = "sa-token")
public class SaTokenConfigure implements WebMvcConfigurer {
    public static final String[] STATIC_LIST = {"/**/error", "/**/favicon.ico","/**/*.html","/**/*.css","/**/*.js"};

//    白名单
    private String[] whiteList = {
            "/security/login",
            "/security/initAdmin",
            "/security/imageCaptcha",
            "/public/**",
            "/file/download"
    };

    private static final String[] API_DOC = {"/v3/api-docs/**","/swagger-ui/**"};

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
                .excludePathPatterns(STATIC_LIST)
                .excludePathPatterns(this.whiteList)
                .excludePathPatterns(API_DOC);
    }

    // Sa-Token 整合 jwt
    @Bean
    public StpLogic getStpLogicJwt() {
        return new StpLogicJwtForSimple(); // Simple 简单模式
    }

    @Autowired
    public void configSaToken(SaTokenConfig config) {
//        jwt秘钥
        config.setJwtSecretKey("bsdasdasifhueuiwyurfewbfjsdafjg");
    }
}
