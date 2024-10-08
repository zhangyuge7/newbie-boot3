package com.newbie.generator.domain;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

/**
 * 表信息
 */
@Data
public class TableInfo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    private String name; // 表名
    private String comment; // 表注释
    private List<ColumnInfo> columns; // 字段列表
}
