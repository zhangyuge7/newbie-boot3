package com.newbie.generator.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.newbie.common.domain.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 生成器配置
 */
@EqualsAndHashCode(callSuper = true)
@TableName(value = "gen_config")
@Data
public class GenConfigEntity extends BaseEntity {
    @Serial
    private static final long serialVersionUID = 1L;
    private String author; // 作者
    private String email; // 邮箱
    private String dateFormat; // 日期格式
    private String packageParent; // 父级包名
    private String moduleName; // 模块名
    private String tablePrefix; // 表名前缀，多个以逗号分割
    private String enableSpringDoc; // 接口文档，1开启 0关闭
    private String enableApiAuth; // 接口权限控制，1开启 0关闭
    private String enableDrawer; // ui抽屉组件，1开启 0关闭
    private String configName; // 配置名称
    private String remark; // 备注
}
