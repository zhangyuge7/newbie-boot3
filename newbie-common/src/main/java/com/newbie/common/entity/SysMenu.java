package com.newbie.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 系统菜单表
 * @TableName sys_menu
 */
@TableName(value ="sys_menu")
@Data
public class SysMenu implements Serializable {
    /**
     * 菜单ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 菜单标题
     */
    private String title;

    /**
     * 父菜单ID
     */
    private Long parentId;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 菜单状态（1正常 0停用）
     */
    private String status;

    /**
     * 路由地址
     */
    private String routePath;

    /**
     * 路由name
     */
    private String routeName;

    /**
     * 组件路径
     */
    private String component;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 是否缓存组件（1缓存 0不缓存）
     */
    private String keep;

    /**
     * 菜单类型（1菜单 0按钮）
     */
    private String type;

    /**
     * 是否隐藏菜单（1是 0否 ）
     */
    private String hide;

    /**
     * 权限标识
     */
    private String perm;

    /**
     * 菜单图标
     */
    private String icon;

    /**
     * 是否隐藏子级菜单（1是 0否）
     */
    private String hideChildren;

    /**
     * 内嵌外链接地址
     */
    private String iframeLink;

    /**
     * 是否在layout外显示（1是 0否）
     */
    private String outer;

    /**
     * 切换动画
     */
    private String transition;

    /**
     * 是否固定在tabs（1是 0否）
     */
    private String fixedTab;

    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}