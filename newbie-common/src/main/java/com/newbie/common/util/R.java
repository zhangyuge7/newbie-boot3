package com.newbie.common.util;


import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 *
 * @param <T> 响应数据类型
 * @Author: ZhangYuGe
 * @Date: 2024/4/15 22:07
 * @Descriptions: 响应数据封装
 */
@Data
@Accessors(chain = true)
public class R<T> implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    public static final String SUCCESS_MSG = "成功";
    public static final Integer SUCCESS_CODE = 200;
    public static final String ERROR_MSG = "未知异常，请联系管理员";
    public static final Integer ERROR_CODE = 500;

    private Integer code;
    private String msg;
    private T data;
    private Boolean ok;

    public R() {
    }

    /**
     * 成功（带数据）
     *
     * @param data 响应数据
     */
    public static <T> R<T> ok(T data) {
        return new R<T>()
                .setCode(SUCCESS_CODE)
                .setMsg(SUCCESS_MSG)
                .setOk(true)
                .setData(data);
    }

    /**
     * 成功（不带数据）
     */
    public static <T> R<T> ok() {
        return R.ok(null);
    }

    /**
     * 失败
     *
     * @param code 代码
     * @param msg  消息
     */
    public static <T> R<T> error(int code, String msg) {
        return new R<T>()
                .setCode(code)
                .setMsg(msg)
                .setOk(false);
    }

    /**
     * 失败
     *
     * @param msg 消息
     */
    public static <T> R<T> error(String msg) {
        return R.error(ERROR_CODE, msg);
    }
}
