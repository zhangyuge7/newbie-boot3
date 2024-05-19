package com.newbie.weblog.config;

import com.newbie.weblog.enums.WebLogStrategyEnum;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties("newbie.weblog")
public class WebLogConfigProperties {

    /**
     * 是否启用日志记录
     */
    private Boolean enable = false;

    /**
     * 记录日志策略
     */
    private WebLogStrategyEnum defaultStrategy = WebLogStrategyEnum.DEFAULT;

    /**
     * 指定环境生效，不指定则所有环境生效
     */
    private String env;

    /**
     * 仅在异常时记录日志
     */
    private Boolean onlyError = false;
}
