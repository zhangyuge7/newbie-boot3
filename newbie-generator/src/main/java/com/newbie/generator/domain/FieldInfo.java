package com.newbie.generator.domain;

import lombok.Data;

/**
 * 字段信息
 */
@Data
public class FieldInfo {
    private String name; // 字段名
    private String type; // 类型
    private String comment; // 注释
    private Boolean pk; // 是否主键
    private String colName; // 数据库列名
    private String getMethodName; // get方法名
    private String setMethodName; // set方法名
}
