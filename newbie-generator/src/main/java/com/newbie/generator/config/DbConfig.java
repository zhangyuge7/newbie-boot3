package com.newbie.generator.config;

import com.newbie.generator.mapper.GeneratorMapper;
import com.newbie.generator.mapper.MysqlGeneratorMapper;
import com.newbie.generator.mapper.Postgresql16GeneratorMapper;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DatabaseMetaData;

/**
 * 数据库配置
 */
@Configuration
@RequiredArgsConstructor
@Slf4j
public class DbConfig {
    private final Postgresql16GeneratorMapper postgresql16GeneratorMapper;
    private final MysqlGeneratorMapper mysqlGeneratorMapper;
    private final DataSource dataSource;

    @SneakyThrows
    @Bean
    @Primary
    public GeneratorMapper generatorMapper(){
        Connection connection = dataSource.getConnection();
        DatabaseMetaData metaData = connection.getMetaData();
        String databaseProductName = metaData.getDatabaseProductName();
        log.info("========== 代码生成器启动 ==========");
        if("PostgreSQL".equals(databaseProductName)){
            return postgresql16GeneratorMapper;
        }
        if ("MySQL".equals(databaseProductName)) {
            return mysqlGeneratorMapper;
        }
        log.warn("====== 代码生成器：不支持的数据库类型，默认使用 PostgreSQL ======");
        return postgresql16GeneratorMapper;
    }
}
