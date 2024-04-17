package com.newbie;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Date: 2024/4/15 22:07
 * @Descriptions: 响应数据封装
 */

@SpringBootApplication
@MapperScan("com.newbie.**.mapper")
public class NewbieApplication {
    public static void main(String[] args) {
        SpringApplication.run(NewbieApplication.class, args);
    }
}
