package com.newbie.system.domain.body;

import com.newbie.common.entity.SysUser;
import lombok.Data;

import java.util.List;

/**
 * 系统用户请求体
 *
 * @author scj
 * @version java version 1.8
 * @since 2023-08-14 09:56
 */
@Data
public class SysUserBody extends SysUser {
    private String loginPwd;
    private List<Long> rolesIds;
}
