package com.newbie.common.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 角色菜单关系表
 * @TableName sys_role_menu
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value ="sys_role_menu")
@Data
public class SysRoleMenu extends BaseEntity {


    /**
     * 角色ID
     */
    private String roleId;

    /**
     * 菜单ID
     */
    private String menuId;
}