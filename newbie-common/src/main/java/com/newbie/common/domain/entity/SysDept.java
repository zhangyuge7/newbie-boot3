package com.newbie.common.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 部门表
 * @TableName sys_dept
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value ="sys_dept")
@Data
public class SysDept extends BaseEntity{

    /**
     * 部门名称
     */
    private String deptName;


    /**
     * 父级id
     */
    private String parentId;

    /**
     * 祖级列表
     */
    private String ancestors;

    /**
     * 显示顺序
     */
    private Integer sort;

    /**
     * 负责人
     */
    private String leader;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 状态（1正常 0停用）
     */
    private String status;

    /**
     * 层级
     */
    private Integer tier;

    /**
     * 首页路由地址
     */
    private String homePath;

    /**
     * 备注
     */
    private String remark;

}