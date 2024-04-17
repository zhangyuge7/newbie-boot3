package com.newbie.common.exception;

import com.newbie.common.util.R;
import lombok.Getter;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/17 下午11:31
 * @Descriptions: 业务异常类
 */
@Getter
public final class NewbieException extends RuntimeException {

    private final Integer code; // 异常编码
    private final Boolean isPrintLog; // 是否打印日志

    public NewbieException(String message) {
        super(message);
        this.code = R.ERROR_CODE;
        this.isPrintLog = false;
    }

    public NewbieException(String message, boolean isPrintLog) {
        super(message);
        this.code = R.ERROR_CODE;
        this.isPrintLog = isPrintLog;
    }

    public NewbieException(int code, String message) {
        super(message);
        this.code = code;
        this.isPrintLog = false;
    }

    public NewbieException(int code, String message, boolean isPrintLog) {
        super(message);
        this.code = code;
        this.isPrintLog = isPrintLog;
    }

}
