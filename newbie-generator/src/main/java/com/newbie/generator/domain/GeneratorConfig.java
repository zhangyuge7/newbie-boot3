package com.newbie.generator.domain;

import lombok.Data;

/**
 * 生成器配置
 */
@Data
public class GeneratorConfig {
    private String commentAuthor; // 作者名-注释
    private String commentEmail; // 邮箱-注释
    private String commentDate; // 日期格式-注释
    private String outputDir; // 生成文件的输出目录
    private String packageParent; // 父级包名
    private String moduleName; // 模块名
    private String prefix; // 需要忽略的表前缀，多个以逗号分割
    private Boolean enableSpringdoc; // 使用接口文档
    private Boolean enableApiAuth; // 开启接口权限控制
    private Boolean enableDrawer; // 数据表单使用抽屉组件，默认使用dialog
}
