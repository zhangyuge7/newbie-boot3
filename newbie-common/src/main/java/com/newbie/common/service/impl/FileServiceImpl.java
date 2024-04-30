package com.newbie.common.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.file.FileNameUtil;
import cn.hutool.core.util.RandomUtil;
import com.newbie.common.entity.vo.FileVO;
import com.newbie.common.exception.NewbieException;
import com.newbie.common.service.FileService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/23 下午6:48
 * @Descriptions: 文件服务实现类
 */
public class FileServiceImpl implements FileService {

    private final String fileLocation;
    private final String prefix;

    public FileServiceImpl(String fileLocation, String prefix) {
        this.fileLocation = fileLocation;
        this.prefix = prefix;
    }

    /**
     * 获取新文件名称
     *
     * @param originalFilename 原文件名称
     * @return
     */
    private String getNewFileName(String originalFilename) {
        String newFileName = FileNameUtil.mainName(originalFilename) + RandomUtil.randomNumbers(4);
        String fileSuffix = FileNameUtil.extName(originalFilename);
        if (fileSuffix != null) {
            newFileName += "." + fileSuffix;
        }
        return newFileName;
    }

    @Override
    public List<FileVO> upload(List<MultipartFile> files) {
        String fileDir = this.prefix + DateUtil.format(new Date(), "/yyyy/MM/dd");
        File targetPath = new File(fileLocation, fileDir);
        if (!targetPath.exists()) {
            if (!targetPath.mkdirs()) {
                throw new NewbieException("目录不存在，尝试创建失败");
            }
        }
        List<FileVO> fileVOList = new ArrayList<>();
        try {
            for (MultipartFile file : files) {
                String originalFilename = file.getOriginalFilename();
                String newFileName = this.getNewFileName(originalFilename);
                file.transferTo(new File(targetPath, newFileName));
                fileVOList.add(new FileVO(originalFilename,fileDir + "/" + newFileName));
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return fileVOList;
    }

    @Override
    public void download(String filePath, HttpServletResponse response) {
        response.reset();
        // 读到流中
        InputStream inputStream = null;// 文件的存放路径
        OutputStream outputStream = null;
        try {
            inputStream = new FileInputStream(fileLocation + "/" + filePath);
            outputStream = response.getOutputStream();
            byte[] b = new byte[1024 * 1024];
            int len;
            while ((len = inputStream.read(b)) > 0) {
                outputStream.write(b, 0, len);
            }
            outputStream.flush();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            if(outputStream!=null){
                try {
                    outputStream.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    @Override
    public void remove(String filePath) {
        FileUtil.del(fileLocation + "/" + filePath);
    }
}
