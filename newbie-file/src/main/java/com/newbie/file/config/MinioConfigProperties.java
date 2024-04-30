package com.newbie.file.config;

import lombok.Data;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/30 下午3:41
 * @Descriptions: minio配置参数
 */
@Data
public class MinioConfigProperties {
    private String endPoint;
    private String accessKey;
    private String secretKey;
    private String bucket;
}
