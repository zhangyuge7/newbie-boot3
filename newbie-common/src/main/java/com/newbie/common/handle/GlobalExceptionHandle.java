package com.newbie.common.handle;

import com.newbie.common.util.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Optional;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 11:22
 * @Descriptions: 全局异常处理
 */
@ControllerAdvice
@ResponseBody
@Slf4j
public class GlobalExceptionHandle {


    /**
     * 运行时异常
     *
     * @param e 异常对象
     * @return 返回结果
     */
    @ExceptionHandler(RuntimeException.class)
    public R<Object> RuntimeExceptionHandler(RuntimeException e) {
        String message = Optional.ofNullable(e.getMessage()).orElse(R.ERROR_MSG);
        log.error(message, e);
        return R.error(message);
    }
}
