package com.newbie.file.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/30 上午9:54
 * @Descriptions: unknown
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVO {
    private String originalName; // 文件原名称
    private String filePath; // 文件路径
    private Long fileSize; // 文件大小
    private String fileType; // 文件类型
}
