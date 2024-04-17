package com.newbie.security.handle;

import cn.dev33.satoken.exception.NotLoginException;
import cn.dev33.satoken.exception.NotPermissionException;
import cn.dev33.satoken.exception.NotRoleException;
import cn.dev33.satoken.exception.NotSafeException;
import com.newbie.common.util.R;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 11:21
 * @Descriptions: 认证鉴权异常处理
 */
@RestControllerAdvice
public class SaTokenExceptionHandler {
    @ExceptionHandler(NotLoginException.class)
    public R<Object> handlerNotLoginException(NotLoginException nle) {
        return R.error(401,nle.getMessage());
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
}
