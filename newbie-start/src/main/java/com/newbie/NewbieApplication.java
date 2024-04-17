package com.newbie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * 启动类
 */
@SpringBootApplication
@EnableAsync
@EnableCaching
public class NewbieApplication {
    public static void main(String[] args) {
        SpringApplication.run(NewbieApplication.class, args);
    }
}
