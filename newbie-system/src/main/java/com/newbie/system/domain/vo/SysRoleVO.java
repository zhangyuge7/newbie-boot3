package com.newbie.system.domain.vo;

import com.newbie.common.entity.SysRole;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SysRoleVO extends SysRole {
    /**
     * 菜单 id 列表
     */
    private List<Long> menuIds;
}
