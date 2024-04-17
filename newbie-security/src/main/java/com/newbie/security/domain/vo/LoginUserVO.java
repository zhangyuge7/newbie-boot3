package com.newbie.security.domain.vo;

import com.newbie.common.entity.SysUser;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 17:36
 * @Descriptions: unknown
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class LoginUserVO extends SysUser {
    private List<String> roles; // 角色代码列表
    private List<String> perms; // 权限标识码列表
}
