package com.newbie.common.enums;

import lombok.Getter;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 16:07
 * @Descriptions: 通用状态枚举
 */
@Getter
public enum CommonStatusEnum {
    NORMAL("1", "正常"),
    DISABLED("0", "禁用"),
    ;
    private final String code;
    private final String msg;

    CommonStatusEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    /**
     * 是否正常状态
     * @param code 状态编码
     * @return
     */
    public static boolean isNormal(String code){
        return NORMAL.getCode().equals(code);
    }

    /**
     * 是否禁用状态
     * @param code 状态编码
     * @return
     */
    public static boolean isDisabled(String code){
        return DISABLED.getCode().equals(code);
    }
}
