package com.newbie.common.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.newbie.common.entity.SysDept;
import com.newbie.common.entity.SysRole;
import com.newbie.common.entity.SysUser;
import com.newbie.common.constant.SecurityConstant;
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
public class LoginUser extends SysUser {
    private List<String> roles; // 角色代码列表
    private List<String> perms; // 权限标识码列表
    private List<SysRole> roleList; // 角色列表
    private SysDept dept; // 部门

    /**
     * 是否为admin用户
     */
    @JsonIgnore
    public boolean isAdmin(){
        return SecurityConstant.ADMIN_USER_NAME.equals(this.getUsername());
    }
}
