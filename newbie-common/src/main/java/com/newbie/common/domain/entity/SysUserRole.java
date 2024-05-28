package com.newbie.common.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户和角色关系表
 * @TableName sys_user_role
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value ="sys_user_role")
@Data
public class SysUserRole extends BaseEntity {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 角色ID
     */
    private String roleId;

}