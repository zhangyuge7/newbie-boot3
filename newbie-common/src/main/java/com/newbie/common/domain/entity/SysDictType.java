package com.newbie.common.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统字典类型
 * @TableName sys_dict_type
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value ="sys_dict_type")
@Data
public class SysDictType extends BaseEntity{


    /**
     * 字典类型名称
     */
    private String typeName;

    /**
     * 类型编码
     */
    private String typeCode;

    /**
     * 状态（1正常 0禁用）
     */
    private String status;

    /**
     * 排序字段
     */
    private Integer sort;

    /**
     * 备注
     */
    private String remark;

}