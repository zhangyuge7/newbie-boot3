package com.newbie.generator.service;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.builder.CustomFile;
import com.baomidou.mybatisplus.generator.config.po.TableField;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/6/12 下午4:17
 * @Descriptions: 代码生成器服务
 */
public class CodeGeneratorService {
    private static final Properties properties = new Properties();

    public static final String RESOURCE_NAME = "generator.properties";

    public static final String DATASOURCE_URL = "datasource.url";
    public static final String DATASOURCE_USERNAME = "datasource.username";
    public static final String DATASOURCE_PASSWORD = "datasource.password";
    public static final String GLOBAL_OUTPUT_DIR = "global.outputDir";
    public static final String GLOBAL_DISABLE_OPEN_DIR = "global.disableOpenDir";
    public static final String GLOBAL_AUTHOR = "global.author";
    public static final String GLOBAL_COMMENT_DATE = "global.commentDate";
    public static final String GLOBAL_ENABLE_SPRING_DOC = "global.enableSpringdoc";
    public static final String PACKAGE_PARENT = "package.parent";
    public static final String PACKAGE_MODULE_NAME = "package.moduleName";
    public static final String STRATEGY_INCLUDE = "strategy.include";
    public static final String STRATEGY_TABLE_PREFIX = "strategy.tablePrefix";
    public static final String NEWBIE_EMAIL = "newbie.email";
    public static final String NEWBIE_ENABLE_API_AUTH = "newbie.enableApiAuth";
    public static final String NEWBIE_ENABLE_DRAWER = "newbie.enableDrawer";


    static {
        InputStream inputStream = null;
        try {
            inputStream = ClassLoader.getSystemClassLoader().getResourceAsStream(RESOURCE_NAME);
            properties.load(inputStream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static void main(String[] args) {
        String url = properties.getProperty(DATASOURCE_URL);
        String username = properties.getProperty(DATASOURCE_USERNAME);
        String password = properties.getProperty(DATASOURCE_PASSWORD);
        FastAutoGenerator.create(url, username, password)
                .globalConfig(CodeGeneratorService::globalConfig)
                .packageConfig(CodeGeneratorService::packageConfig)
                .strategyConfig(CodeGeneratorService::strategyConfig)
                .injectionConfig(CodeGeneratorService::injectionConfig)
                .templateEngine(new FreemarkerTemplateEngine())
                .execute();
    }

    /**
     * 注入配置
     *
     * @param builder
     */
    private static void injectionConfig(InjectionConfig.Builder builder) {

        builder
                // 输出文件之前执行的逻辑
                .beforeOutputFile((tableInfo, objectMap) -> {
                    System.out.println("准备生成文件: " + tableInfo.getEntityName());
                    // 注入主键名称
                    Map<String, String> pkValue = new HashMap<>();
                    for (TableField field : tableInfo.getFields()) {
                        if (field.isKeyFlag()) {
                            pkValue.put("name", field.getName());
                            pkValue.put("getMethod", "get" + field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1));
                            break;
                        }
                    }
                    objectMap.put("pkValue", pkValue);
                    //判断是否需要继承BaseEntity
                    int[] arr = new int[5];
                    if (!(boolean) objectMap.get("activeRecord")) {
                        for (TableField field : tableInfo.getFields()) {
                            switch (field.getPropertyName()) {
                                case "id":
                                    arr[0] = 1;
                                    break;
                                case "createBy":
                                    arr[1] = 1;
                                    break;
                                case "createTime":
                                    arr[2] = 1;
                                    break;
                                case "updateBy":
                                    arr[3] = 1;
                                    break;
                                case "updateTime":
                                    arr[4] = 1;
                                    break;
                            }
                        }
                        if (Arrays.binarySearch(arr, 0) < 0) {
                            // 满足继承条件
                            objectMap.put("superEntityClass", "BaseEntity");
                            tableInfo.getImportPackages().add("com.newbie.common.domain.entity.BaseEntity");
                            Iterator<TableField> iterator = tableInfo.getFields().iterator();
                            while (iterator.hasNext()) {
                                String propertyName = iterator.next().getPropertyName();
                                if ("id".equals(propertyName)
                                        || "createBy".equals(propertyName)
                                        || "createTime".equals(propertyName)
                                        || "updateBy".equals(propertyName)
                                        || "updateTime".equals(propertyName)) {
                                    iterator.remove();
                                }
                            }
                        }
                    }
                })
                // 自定义配置 Map 对象
                .customMap(CodeGeneratorService.getCustomMap())
                // 自定义配置模板文件
                .customFile(CodeGeneratorService.getVueCustomFiles())
                .build();
    }

    private static Map<String, Object> getCustomMap() {
        Map<String, Object> m = new HashMap<>();
        m.put("email", properties.getProperty(NEWBIE_EMAIL));
        m.put("enableApiAuth", Boolean.parseBoolean(properties.getProperty(NEWBIE_ENABLE_API_AUTH)));
        String moduleName = properties.getProperty(PACKAGE_MODULE_NAME);
        m.put("upModuleName", moduleName.substring(0, 1).toUpperCase() + moduleName.substring(1));
        m.put("enableDrawer", Boolean.parseBoolean(properties.getProperty(NEWBIE_ENABLE_DRAWER)));
        return m;
    }

    /**
     * 获取前端vue文件模板
     *
     * @return
     */
    private static List<CustomFile> getVueCustomFiles() {
        Map<String, String> map = new HashMap<>();
        map.put("/index.vue", "/templates/index.vue.ftl");
        map.put("/DataForm.vue", "/templates/dataForm.vue.ftl");
        map.put("/menu.sql", "/templates/menu.sql.ftl");
        map.put("/api.js", "/templates/api.js.ftl");
        return map.entrySet().stream().map(e ->
                new CustomFile.Builder()
                        .enableFileOverride()
                        .fileName(e.getKey())
                        .templatePath(e.getValue())
                        .filePath(properties.getProperty(GLOBAL_OUTPUT_DIR))
                        .packageName("UI")
                        .formatNameFunction(TableInfo::getEntityPath)
                        .build()
        ).collect(Collectors.toList());
    }

    /**
     * 策略配置
     *
     * @param builder
     */
    private static void strategyConfig(StrategyConfig.Builder builder) {
        if (StringUtils.hasLength(properties.getProperty(STRATEGY_TABLE_PREFIX))) {
            builder.addTablePrefix(properties.getProperty(STRATEGY_TABLE_PREFIX).split(","));
        }
        if (StringUtils.hasLength(properties.getProperty(STRATEGY_INCLUDE))) {
            builder.addInclude(properties.getProperty(STRATEGY_INCLUDE).split(","));
        } else {
            throw new RuntimeException("表名不能为空");
        }

        // 模板配置
        templateConfig(builder);

        builder.build();
    }

    /**
     * 模板配置
     *
     * @param builder
     */
    private static void templateConfig(StrategyConfig.Builder builder) {
        // 实体类
        builder
                .entityBuilder()
                .javaTemplate("/templates/entity.java")
                .enableFileOverride()
                .enableLombok()
//                .superClass(BaseEntity.class)
//                .enableActiveRecord()
                .idType(IdType.ASSIGN_ID)
                .build();
        // service
        builder.serviceBuilder()
                .enableFileOverride()
                .serviceTemplate("/templates/service.java")
                .serviceImplTemplate("/templates/serviceImpl.java");
        // controller
        builder.controllerBuilder()
                .enableFileOverride()
                .enableRestStyle()
                .template("/templates/controller.java");
        // mapper
        builder.mapperBuilder()
                .enableFileOverride()
                .mapperTemplate("/templates/mapper.java")
                .mapperXmlTemplate("/templates/mapper.xml");

    }

    /**
     * 包配置
     *
     * @param builder
     */
    private static void packageConfig(PackageConfig.Builder builder) {
        String parent = properties.getProperty(PACKAGE_PARENT);
        String moduleName = properties.getProperty(PACKAGE_MODULE_NAME);
        String outputDir = properties.getProperty(GLOBAL_OUTPUT_DIR);

        builder.parent(parent) // 设置父包名
                .moduleName(moduleName) // 设置父包模块名
                .pathInfo(Collections.singletonMap(OutputFile.xml, outputDir))
                .build();
    }

    /**
     * 全局配置
     *
     * @param builder
     */
    private static void globalConfig(GlobalConfig.Builder builder) {
        boolean disableOpenDir = Boolean.parseBoolean(properties.getProperty(GLOBAL_DISABLE_OPEN_DIR));
        String outputDir = properties.getProperty(GLOBAL_OUTPUT_DIR);
        String author = properties.getProperty(GLOBAL_AUTHOR);
        String commentDate = properties.getProperty(GLOBAL_COMMENT_DATE);
        boolean enableSpringDoc = Boolean.parseBoolean(properties.getProperty(GLOBAL_ENABLE_SPRING_DOC));

        if (disableOpenDir) {
            builder.disableOpenDir();
        }
        if (enableSpringDoc) {
            builder.enableSpringdoc();
        }
        builder.outputDir(outputDir)
                .author(author)
                .commentDate(commentDate)
                .dateType(DateType.ONLY_DATE)
                .build();

    }


}
