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
}
