package com.newbie;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动类
 */

@SpringBootApplication
@MapperScan("com.newbie.**.mapper")
public class NewbieApplication {
    public static void main(String[] args) {
        SpringApplication.run(NewbieApplication.class, args);
    }
}
