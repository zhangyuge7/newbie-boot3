package com.newbie.file.service;

import com.newbie.file.domain.vo.FileVO;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/23 下午6:47
 * @Descriptions: 文件服务
 */
public interface FileService {
    /**
     * 上传文件
     * @param files 文件对象列表
     * @return 文件路径与名称
     */
    List<FileVO> upload(List<MultipartFile> files);


    /**
     * 下载文件
     *
     * @param filePath     文件路径
     * @param response
     */
    void download(String filePath, HttpServletResponse response);

    /**
     * 删除文件
     * @param filePath 文件路径
     */
    void remove(String filePath);


}
