package com.newbie.system.domain.body;

import lombok.Data;

import java.util.List;

@Data
public class SysUserRoleBody {
    private List<String> userIds;
    private List<String> roleIds;
}
