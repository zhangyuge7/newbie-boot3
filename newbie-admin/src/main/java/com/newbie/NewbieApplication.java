package com.newbie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/5/6 上午9:56
 * @Descriptions: 后台启动类
 */
@SpringBootApplication
@EnableAsync
@EnableCaching
//@EnableScheduling
public class NewbieApplication {
    public static void main(String[] args) {
        // 当前时间戳
        long beginTime = System.currentTimeMillis();
        SpringApplication.run(NewbieApplication.class, args);
        System.out.println("启动完成：: " + (System.currentTimeMillis() - beginTime) + "ms");
    }
}
