package com.newbie.common.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 角色表
 * @TableName sys_role
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value ="sys_role")
@Data
public class SysRole extends BaseEntity {


    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 角色编码
     */
    private String roleCode;

    /**
     * 排序顺序
     */
    private Integer sort;

    /**
     * 角色状态（1正常 0停用）
     */
    private String status;

    /**
     * 首页路由地址
     */
    private String homePath;

    /**
     * 备注
     */
    private String remark;

}