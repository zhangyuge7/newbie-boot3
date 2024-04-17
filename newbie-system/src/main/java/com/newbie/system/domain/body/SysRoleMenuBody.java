package com.newbie.system.domain.body;

import lombok.Data;

import java.util.List;

@Data
public class SysRoleMenuBody {
    private Long roleId;
    private List<Long> menuIds;
}
