package com.newbie.common.handle;

import cn.dev33.satoken.exception.NotLoginException;
import cn.dev33.satoken.exception.NotPermissionException;
import cn.dev33.satoken.exception.NotRoleException;
import cn.dev33.satoken.exception.NotSafeException;
import com.newbie.common.exception.NewbieException;
import com.newbie.common.util.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Optional;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 11:22
 * @Descriptions: 全局异常处理
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandle {

    @ExceptionHandler(NotLoginException.class)
    public R<Object> handlerNotLoginException(NotLoginException nle) {
        // 判断场景值，定制化异常信息
        String message = "";
        if(nle.getType().equals(NotLoginException.NOT_TOKEN)) {
            message = "未能读取到有效 token";
        }
        else if(nle.getType().equals(NotLoginException.INVALID_TOKEN)) {
            message = "token 无效";
        }
        else if(nle.getType().equals(NotLoginException.TOKEN_TIMEOUT)) {
            message = "token 已过期";
        }
        else if(nle.getType().equals(NotLoginException.BE_REPLACED)) {
            message = "token 已被顶下线";
        }
        else if(nle.getType().equals(NotLoginException.KICK_OUT)) {
            message = "token 已被踢下线";
        }
        else if(nle.getType().equals(NotLoginException.TOKEN_FREEZE)) {
            message = "token 已被冻结";
        }
        else if(nle.getType().equals(NotLoginException.NO_PREFIX)) {
            message = "未按照指定前缀提交 token";
        }
        else {
            message = "当前会话未登录";
        }

        // 返回给前端
        return R.error(401, message);
    }

    @ExceptionHandler
    public R<Object> handlerNotRoleException(NotRoleException e) {
        return R.error(403, "无此角色：" + e.getRole());
    }

    @ExceptionHandler
    public R<Object> handlerNotPermissionException(NotPermissionException e) {
        return R.error(403, "无此权限：" + e.getPermission());
    }

    @ExceptionHandler
    public R<Object> handlerNotSafeException(NotSafeException e) {
        return R.error(401, "二级认证异常：" + e.getMessage());
    }

    /**
     * 业务异常
     *
     * @param e 异常对象
     * @return 返回结果
     */
    @ExceptionHandler(NewbieException.class)
    public R<Object> NewbieExceptionHandler(NewbieException e) {
        int code = Optional.ofNullable(e.getCode()).orElse(R.ERROR_CODE);
        String message = Optional.ofNullable(e.getMessage()).orElse(R.ERROR_MSG);
        if (e.getIsPrintLog()) {
            log.error(message, e);
        }
        return R.error(code,message);
    }

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
