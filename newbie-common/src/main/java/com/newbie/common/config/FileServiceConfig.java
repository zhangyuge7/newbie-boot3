package com.newbie.common.config;

import com.newbie.common.service.FileService;
import com.newbie.common.service.impl.FileServiceImpl;
import com.newbie.common.service.impl.MinioServiceImpl;
import io.minio.MinioClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/24 下午4:59
 * @Descriptions: 文件服务配置
 */
@Configuration
public class FileServiceConfig {
    @Value("${newbie.file.file-location}")
    private String fileLocation;
    @Value("${newbie.file.prefix}")
    private String prefix;
    @Value("${newbie.file.minio.end-point}")
    private String endPoint;
    @Value("${newbie.file.minio.access-key}")
    private String accessKey;
    @Value("${newbie.file.minio.secret-key}")
    private String secretKey;
    @Value("${newbie.file.minio.bucket}")
    private String bucket;

    @Bean
    public FileService fileService() {
//        return new MinioServiceImpl(
//                // 创建Minio客户端
//                MinioClient.builder()
//                        .endpoint(this.endPoint)
//                        .credentials(this.accessKey, this.secretKey)
//                        .build(),
//                this.bucket,
//                this.prefix
//        );
        return new FileServiceImpl(this.fileLocation,this.prefix);
    }


}
