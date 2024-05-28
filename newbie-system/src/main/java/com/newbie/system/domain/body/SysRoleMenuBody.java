package com.newbie.system.domain.body;

import lombok.Data;

import java.util.List;

@Data
public class SysRoleMenuBody {
    private String roleId;
    private List<String> menuIds;
}
