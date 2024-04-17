package com.newbie.system.domain.body;

import com.newbie.common.entity.SysUser;
import lombok.Data;

import java.util.List;


@Data
public class SysUserBody extends SysUser {
    private String loginPwd;
    private List<Long> rolesIds;
}
