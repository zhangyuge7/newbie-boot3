package com.newbie.security.domain.body;

import lombok.Data;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 16:13
 * @Descriptions: unknown
 */
@Data
public class PasswordBody {
    private String userId; // 用户ID
    private String oldPassword; // 原密码
    private String newPassword; // 新密码
    private String confirmPassword; // 确认密码
    private Boolean immediatelyKick; // 立即踢出，修改用户密码时，修改成功后是否立即踢下线
}
