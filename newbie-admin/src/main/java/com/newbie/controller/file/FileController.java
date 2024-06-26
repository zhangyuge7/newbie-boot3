package com.newbie.controller.file;

import com.newbie.file.domain.body.FileBody;
import com.newbie.file.domain.vo.FileVO;
import com.newbie.common.exception.NewbieException;
import com.newbie.file.service.FileService;
import com.newbie.common.util.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/23 下午6:46
 * @Descriptions: 文件控制器
 */
@RestController
@RequestMapping("/file")
@RequiredArgsConstructor
@Tag(name = "文件服务")
public class FileController {
    private final FileService fileService;

    /**
     * 文件上传
     *
     * @param fileBody 文件对象
     * @return 文件路径数组
     */
    @Operation(summary ="上传")
    @PostMapping("/upload")
    public R<List<FileVO>> upload(FileBody fileBody) {
        List<MultipartFile> files = fileBody.getFile();
        if (CollectionUtils.isEmpty(files)) {
            throw new NewbieException("请选择文件");
        }
        return R.ok( fileService.upload(files)).setMsg("上传成功");
    }

    /**
     * 下载文件
     *
     * @param filePath     文件的路径
     */
    @Operation(summary ="下载")
    @GetMapping("/download")
    public void download(String filePath, HttpServletResponse response) {
        fileService.download(filePath,response);
    }


    @Operation(summary ="删除")
    @GetMapping("/remove")
    public R<Object> remove(String filePath) {
        if(!StringUtils.hasLength(filePath)){
            return R.error("文件路径不能为空");
        }
        fileService.remove(filePath);
        return R.ok().setMsg("文件删除成功");
    }
}
