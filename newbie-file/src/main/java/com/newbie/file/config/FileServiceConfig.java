package com.newbie.file.config;

import com.newbie.file.enums.FileServiceSchemeEnum;
import com.newbie.file.service.FileService;
import com.newbie.file.service.impl.FileServiceImpl;
import com.newbie.file.service.impl.MinioServiceImpl;
import io.minio.MinioClient;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
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
@Data
@Slf4j
@ConfigurationProperties(prefix = "newbie.file")
public class FileServiceConfig {
    private FileServiceSchemeEnum scheme = FileServiceSchemeEnum.DEFAULT;
    private String fileLocation;
    private String prefix;
    private MinioConfigProperties minio;

    @Bean
    public FileService fileService() {
        log.info("init fileService start");
        FileService fileService = null;
        if (FileServiceSchemeEnum.MINIO.equals(this.scheme)) {
            fileService =  new MinioServiceImpl(
                    // 创建Minio客户端
                    MinioClient.builder()
                            .endpoint(minio.getEndPoint())
                            .credentials(minio.getAccessKey(), minio.getSecretKey())
                            .build(),
                    minio.getBucket(),
                    this.prefix
            );
            log.info("FileService scheme is selected MINIO,endPoint={},bucket={}",minio.getEndPoint(),minio.getBucket());
        } else if (FileServiceSchemeEnum.DEFAULT.equals(this.scheme)) {
            fileService = new FileServiceImpl(this.fileLocation,this.prefix);
            log.info("FileService scheme is selected DEFAULT,fileLocation={}",this.fileLocation);
        }
        return fileService;
    }
}
