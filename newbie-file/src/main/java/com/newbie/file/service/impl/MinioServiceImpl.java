package com.newbie.file.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.file.FileNameUtil;
import cn.hutool.core.util.RandomUtil;
import com.newbie.common.exception.NewbieException;
import com.newbie.file.domain.vo.FileVO;
import com.newbie.file.service.FileService;
import io.minio.*;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/24 下午4:58
 * @Descriptions: 文件服务：minio
 */
public class MinioServiceImpl implements FileService {
    private final MinioClient minioClient;
    private final String bucket;
    private final String prefix;

    public MinioServiceImpl(MinioClient minioClient, String bucket,String prefix) {
        this.minioClient = minioClient;
        this.bucket = bucket;
        this.prefix = prefix;
    }

    /**
     * 桶是否存在
     *
     * @param bucketName 桶名称
     * @return
     */
    private boolean bucketExists(String bucketName) {
        try {
            return minioClient.bucketExists(BucketExistsArgs.builder().bucket(this.bucket).build());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 创建桶
     *
     * @param bucketName 桶名称
     */
    private void makeBucket(String bucketName) {
        try {
            minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
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
        if(StringUtils.hasLength(this.prefix)){
            return this.prefix + DateUtil.format(new Date(), "/yyyy/MM/dd/") + newFileName;
        }else{
            return DateUtil.format(new Date(), "yyyy/MM/dd/") + newFileName;
        }

    }

    @Override
    public List<FileVO> upload(List<MultipartFile> files) {
        try {
            // 查找桶是否存在，不存在则创建桶
            if (!this.bucketExists(this.bucket)) {
                this.makeBucket(this.bucket);
            }

            List<FileVO> fileVOList = new ArrayList<>();
            for (MultipartFile file : files) {
                // 处理文件名称
                String originalFilename = file.getOriginalFilename();
                String newFileName = this.getNewFileName(originalFilename);
                // 将文件流上传到桶
                ObjectWriteResponse response = minioClient.putObject(
                        PutObjectArgs
                                .builder()
                                .bucket(this.bucket)
                                .object(newFileName)
                                .stream(file.getInputStream(), file.getSize(), -1)
                                .build());

                fileVOList.add(new FileVO(originalFilename,response.object()));

            }
            return fileVOList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void download(String objectName, HttpServletResponse response) {
        if (!this.bucketExists(this.bucket)) throw new NewbieException("桶" + this.bucket + "不存在，请联系管理员");
        response.reset();
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
            inputStream = minioClient.getObject(GetObjectArgs
                    .builder()
                    .bucket(this.bucket)
                    .object(objectName)
                    .build());
            byte[] buf = new byte[1024 * 1024];
            int len;
            while ((len = inputStream.read(buf, 0, buf.length)) > 0) {
                outputStream.write(buf, 0, len);
            }
            outputStream.flush();
            outputStream.close();
            inputStream.close();
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            if(outputStream!=null){
                try {
                    outputStream.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            if(inputStream!=null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    @Override
    public void remove(String objectName) {
        if (!this.bucketExists(this.bucket)) throw new NewbieException("桶" + this.bucket + "不存在，请联系管理员");
        try {
            minioClient.removeObject(RemoveObjectArgs.builder()
                    .bucket(this.bucket)
                    .object(objectName)
                    .build());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
