package com.newbie.security.domain.body;

import lombok.Data;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 12:18
 * @Descriptions: 登录请求体
 */
@Data
public class LoginBody {
    private String username; // 用户名
    private String password; // 密码
    private Long tokenTimeout; // token有效期，单位：秒
}
