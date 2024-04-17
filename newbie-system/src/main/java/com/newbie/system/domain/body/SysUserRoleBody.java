package com.newbie.system.domain.body;

import lombok.Data;

import java.util.List;

@Data
public class SysUserRoleBody {
    private List<Long> userIds;
    private List<Long> roleIds;
}
