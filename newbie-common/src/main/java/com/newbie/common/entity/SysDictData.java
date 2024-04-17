package com.newbie.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统字典数据
 * @TableName sys_dict_data
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value ="sys_dict_data")
@Data
public class SysDictData extends BaseEntity {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 标签
     */
    private String label;

    /**
     * 值
     */
    private String value;

    /**
     * 字典类型ID
     */
    private Long typeId;

    /**
     * 元素类型
     */
    private String eleType;

    /**
     * 元素样式类名
     */
    private String eleClass;

    /**
     * 状态（1正常 0禁用）
     */
    private String status;

    /**
     * 默认，Y/N
     */
    private String def;

    /**
     * 排序字段
     */
    private Integer sort;

    /**
     * 备注
     */
    private String remark;

}