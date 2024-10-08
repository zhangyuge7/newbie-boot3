package com.newbie.generator.domain;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * 表字段信息
 */
@Data
public class ColumnInfo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    private String name; // 字段名
    private String nullable; // 是否可以为null，1是，0否
    private String type; // 数据类型
    private String pk; // 是否为主键字段，1是，0否
    private String comment; // 字段注释

}
