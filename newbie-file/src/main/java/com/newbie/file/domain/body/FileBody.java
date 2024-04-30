package com.newbie.file.domain.body;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/30 上午9:12
 * @Descriptions: unknown
 */
@Data
public class FileBody {
    private List<MultipartFile> file; // 文件列表
    private Map<String,Object> params; // 其它参数
}
