package com.newbie.common.service;

import com.newbie.common.entity.vo.FileVO;
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
     * 保存文件
     * @param files 文件对象列表
     * @return 文件路径与名称
     */
    List<FileVO> upload(List<MultipartFile> files);


    /**
     * 下载文件
     * 将输入流中的数据循环写入到响应输出流中，而不是一次性读取到内存
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
