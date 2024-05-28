package com.newbie.system.domain.body;

import com.newbie.common.domain.entity.SysUser;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;


@EqualsAndHashCode(callSuper = true)
@Data
public class SysUserBody extends SysUser {
    private String loginPwd;
    private List<String> rolesIds;
}
