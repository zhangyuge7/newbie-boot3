package com.newbie.common.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import jakarta.annotation.Resource;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/17 下午4:24
 * @Descriptions: mybatis-plus配置
 */
@Configuration
@MapperScan("com.newbie.**.mapper")
public class MybatisPlusConfig {
    @Resource
    private DataSource dataSource;
    /**
     * 分页插件
     * @return
     */
    @Bean
    MybatisPlusInterceptor mybatisPlusInterceptor(){
        PaginationInnerInterceptor paginationInnerInterceptor = new PaginationInnerInterceptor();
        try {
            Connection connection = dataSource.getConnection();
            DatabaseMetaData metaData = connection.getMetaData();
            String url = metaData.getURL();
            if (url.contains("mysql")) {
                paginationInnerInterceptor.setDbType(DbType.MYSQL);
            }else if (url.contains("oracle")) {
                paginationInnerInterceptor.setDbType(DbType.ORACLE);
            }else if (url.contains("postgresql")) {
                paginationInnerInterceptor.setDbType(DbType.POSTGRE_SQL);
            }
            MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
            mybatisPlusInterceptor.addInnerInterceptor(paginationInnerInterceptor);
            return mybatisPlusInterceptor;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
