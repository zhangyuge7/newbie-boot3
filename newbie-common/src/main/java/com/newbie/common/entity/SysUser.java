package com.newbie.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统用户
 * @TableName sys_user
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value ="sys_user")
@Data
public class SysUser extends BaseEntity {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 头像地址
     */
    private String avatar;

    /**
     * 首页路由地址
     */
    private String homePath;

    /**
     * 电话（手机号）
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别（1男 0女）
     */
    private String gender;

    /**
     * 账号状态（1正常 0锁定）
     */
    private String status;

    /**
     * 备注
     */
    private String remark;

    /**
     * 排序
     */
    private Integer sort;

}