package com.newbie.generator.util;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.extra.template.Template;
import cn.hutool.extra.template.TemplateConfig;
import cn.hutool.extra.template.TemplateEngine;
import cn.hutool.extra.template.TemplateUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.newbie.common.util.CamelCaseConverter;
import com.newbie.generator.domain.ColumnInfo;
import com.newbie.generator.domain.FieldInfo;
import com.newbie.generator.domain.GenConfigEntity;
import com.newbie.generator.domain.TableInfo;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 代码生成器工具类
 */
@Slf4j
public class GeneratorUtils {
    public static final String MAPPING_FILE = "mapping.json"; // 映射配置文件
    public static final String TYPE_MAPPING_KEY = "typeMapping"; // 数据类型映射key
    public static final String PACKAGE_MAPPING_KEY = "packageMapping"; // 包映射key
    public static final String TEMPLATES_PATH = "templates"; // 模板目录路径

    public static final Map<String, Map<String, String>> MAPPING_CONTAINER; // 映射配置容器


    static {
        /*
         * 初始化映射配置容器
         * 将 resources/mapper.json 配置文件数据读取到 MAPPING_CONTAINER
         */

        URL url = ClassLoader.getSystemClassLoader().getResource(MAPPING_FILE);
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            MAPPING_CONTAINER = objectMapper.readValue(url, Map.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    /**
     * 生成代码
     *
     * @param tableInfoList 表信息列表
     * @param genConfig     生成器配置
     */
    @SneakyThrows
    public static void generate(List<TableInfo> tableInfoList, GenConfigEntity genConfig, OutputStream outputStream) {
        // 处理生成器配置
        Map<String, Object> gcmap = handleGeneratorConfig(genConfig);
        // 创建模板引擎
        TemplateEngine engine = TemplateUtil.createEngine(new TemplateConfig(TEMPLATES_PATH, TemplateConfig.ResourceMode.CLASSPATH));
        // 获取模板
        Map<String, Template> templateMap = new HashMap<>() {{
            put("entityTemp", engine.getTemplate("entity.java.ftl"));
            put("mapperXmlTemp", engine.getTemplate("mapper.xml.ftl"));
            put("mapperTemp", engine.getTemplate("mapper.java.ftl"));
            put("serviceImplTemp", engine.getTemplate("serviceImpl.java.ftl"));
            put("serviceTemp", engine.getTemplate("service.java.ftl"));
            put("controllerTemp", engine.getTemplate("controller.java.ftl"));

            put("apiTemp",engine.getTemplate("api.js.ftl"));
            put("indexTemp",engine.getTemplate("index.vue.ftl"));
            put("dataFormTemp",engine.getTemplate("dataForm.vue.ftl"));

            put("sqlTemp",engine.getTemplate("menu.sql.ftl"));
        }};

        // 创建压缩流
        ZipOutputStream zipOut = new ZipOutputStream(outputStream);

        // 遍历表列表
        tableInfoList.forEach(tableInfo -> {
            // 构建模板数据
            Map<String, Object> attrMap = buildAttributes(genConfig, tableInfo);
            // 生成器配置
            attrMap.put("gc", gcmap);
            // 模板映射
            Map<String, Template> filePathMapping = getFilePathMapping(templateMap, genConfig, (String) attrMap.get("Entity"),(String) attrMap.get("entity"));
            // 渲染写入到压缩流
            GeneratorUtils.renderToZipStream(filePathMapping, attrMap, zipOut);
        });
        zipOut.flush();
        zipOut.close();
    }

    /**
     * 获取文件路径结构映射
     * @param templateMap 模板集合
     * @param genConfig 生成器配置
     * @param entityName 实体名称
     * @return Map<String, Template>
     */
    private static Map<String, Template> getFilePathMapping(Map<String, Template> templateMap, GenConfigEntity genConfig, String entityName,String entity) {
        String packageParent = genConfig.getPackageParent();
        String[] split = packageParent.split("\\.");
        packageParent = ArrayUtil.join(split, "\\");

        String javaPath = "src\\main\\java\\" + packageParent + "\\" + genConfig.getModuleName() + "\\";
        String xmlPath = "src\\main\\resources\\mapper\\";
        String vuePath = "src\\vue\\";

        return new HashMap<>() {{
            // 后端
            put(javaPath + "controller\\" + entityName + "Controller.java", templateMap.get("controllerTemp"));
            put(javaPath + "entity\\" + entityName + "Entity.java", templateMap.get("entityTemp"));
            put(xmlPath + entityName + "Mapper.xml", templateMap.get("mapperXmlTemp"));
            put(javaPath + "mapper\\" + entityName + "Mapper.java", templateMap.get("mapperTemp"));
            put(javaPath + "service\\impl\\" + entityName + "ServiceImpl.java", templateMap.get("serviceImplTemp"));
            put(javaPath + "service\\I" + entityName + "Service.java", templateMap.get("serviceTemp"));
            // 前端
            put(vuePath + "api\\" + genConfig.getModuleName() + "\\"+entity + ".js", templateMap.get("apiTemp"));
            put(vuePath +"views\\"+ genConfig.getModuleName() + "\\"+entity + "\\index.vue", templateMap.get("indexTemp"));
            put(vuePath +"views\\"+ genConfig.getModuleName() + "\\"+entity +"\\"+ entityName +"DataForm.vue", templateMap.get("dataFormTemp"));
            // sql
            put("src\\"+entityName+"Menu.sql", templateMap.get("sqlTemp"));
        }};
    }

    @SneakyThrows
    private static void renderToZipStream(Map<String, Template> filePathMapping, Map<String, Object> attrMap, ZipOutputStream zipOut) {
        for (Map.Entry<String, Template> entry : filePathMapping.entrySet()) {
            zipOut.putNextEntry(new ZipEntry(entry.getKey()));
            entry.getValue().render(attrMap, zipOut);
        }
    }

    /**
     * 构建模板数据
     *
     * @param tableInfo
     * @return
     */
    private static Map<String, Object> buildAttributes(GenConfigEntity genConfig, TableInfo tableInfo) {
        String ignorePrefixTableName = ignorePrefix(tableInfo.getName(), genConfig.getTablePrefix());

        String EntityName = CamelCaseConverter.toUpperCaseCamel(ignorePrefixTableName.toLowerCase());
        String entityName = CamelCaseConverter.toLowerCaseCamel(ignorePrefixTableName.toLowerCase());

        Map<String, Object> attrMap = new HashMap<>();
        attrMap.put("Entity", EntityName);
        attrMap.put("entity", entityName);

        attrMap.put("tableName", tableInfo.getName());
        attrMap.put("comment", tableInfo.getComment());

        attrMap.put("package", getPackageName(genConfig));
        List<FieldInfo> fields = getFields(tableInfo.getColumns());
        attrMap.put("fields", fields);
        attrMap.put("pkey",getPrimaryKeyField(fields));
        attrMap.put("entityImportPackages", getEntityImportPackage(genConfig, fields));
        attrMap.put("apiPath", getApiPath(genConfig.getModuleName(), entityName));

        attrMap.put("menuId", UUID.randomUUID().toString());
        attrMap.put("addButId", UUID.randomUUID().toString());
        attrMap.put("updateButId", UUID.randomUUID().toString());
        attrMap.put("deleteButId", UUID.randomUUID().toString());

        return attrMap;
    }

    /**
     * 获取主键字段
     * @param fields 字段列表
     * @return FieldInfo
     */
    private static FieldInfo getPrimaryKeyField(List<FieldInfo> fields) {
        for (FieldInfo field : fields) {
            if (field.getPk()) {
                return field;
            }
        }
        throw new RuntimeException("未找到主键字段");
    }



    /**
     * 处理生成器配置
     *
     * @param genConfig 生成器配置实体
     * @return Map<String, Object>
     */
    private static Map<String, Object> handleGeneratorConfig(GenConfigEntity genConfig) {
        String currentDate = DateUtil.format(new Date(), genConfig.getDateFormat());
        return new HashMap<>() {{
            put("author", genConfig.getAuthor());
            put("email", genConfig.getEmail());
            put("date", currentDate);
            put("packageParent", genConfig.getPackageParent());
            put("moduleName", genConfig.getModuleName());
            put("ModuleName", capitalizeFirstLetter(genConfig.getModuleName()));
            put("tablePrefix", genConfig.getTablePrefix());
            put("springDoc", "1".equals(genConfig.getEnableSpringDoc()));
            put("apiAuth", "1".equals(genConfig.getEnableApiAuth()));
            put("drawer", "1".equals(genConfig.getEnableDrawer()));
        }};
    }


    /**
     * 获取实体类中需要导入的包
     *
     * @param genConfig 生成器配置
     * @param fields    字段列表
     * @return List<String>
     */
    private static List<String> getEntityImportPackage(GenConfigEntity genConfig, List<FieldInfo> fields) {
        List<String> ls = new ArrayList<>();
        // 添加java数据类型的包
        Map<String, String> classPackage = MAPPING_CONTAINER.get(PACKAGE_MAPPING_KEY);
        Map<String, String> pkg = new HashMap<>();
        fields.forEach(field -> {
            if (classPackage.containsKey(field.getType())) {
                pkg.put(classPackage.get(field.getType()), "");
            }
        });
        ls.addAll(pkg.keySet());
        // 添加其它包
        // 。。。。。

        return ls;
    }


    /**
     * 获取字段信息
     *
     * @param columnList 字段列表
     * @return
     */
    private static List<FieldInfo> getFields(List<ColumnInfo> columnList) {
        List<FieldInfo> fields = new ArrayList<>();
        columnList.forEach(column -> {
            FieldInfo fieldInfo = new FieldInfo();
            fieldInfo.setName(CamelCaseConverter.toLowerCaseCamel(column.getName().toLowerCase()));
            fieldInfo.setComment(column.getComment());
            // 根据数据库类型获取java类型
            Map<String, String> typeMap = MAPPING_CONTAINER.get(TYPE_MAPPING_KEY);
            fieldInfo.setType(typeMap.get(column.getType()));
            fieldInfo.setPk("1".equals(column.getPk()));
            fieldInfo.setColName(column.getName());
            fieldInfo.setGetMethodName("get"+capitalizeFirstLetter(fieldInfo.getName()));
            fieldInfo.setSetMethodName("set"+capitalizeFirstLetter(fieldInfo.getName()));
            fields.add(fieldInfo);
        });
        return fields;
    }

    /**
     * 首字母转大写
     * @param input 待转的字符串
     * @return String
     */
    private static String capitalizeFirstLetter(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }
        return input.substring(0, 1).toUpperCase() + input.substring(1);
    }

    /**
     * 获取 api 路径
     *
     * @param moduleName 模块名
     * @param tableName  表名
     * @return Map<String, Object>
     */
    private static Map<String, String> getApiPath(String moduleName, String tableName) {
        String parent = "/" + CamelCaseConverter.toLowerCaseCamel(moduleName) + "/" + tableName;
        Map<String, String> apiPathMap = new HashMap<>();
        apiPathMap.put("parent", parent);
        apiPathMap.put("getList", parent + "/list");
        apiPathMap.put("getAll", parent + "/all");
        apiPathMap.put("getByPkVal", parent + "/getByPkVal");
        apiPathMap.put("addData", parent + "/addData");
        apiPathMap.put("updateData", parent + "/updateData");
        apiPathMap.put("deleteByPkVal", parent + "/deleteByPkVal");
        return apiPathMap;
    }

    /**
     * 获取包名
     *
     * @param genConfig 生成器配置
     * @return Map<String, Object>
     */
    private static Map<String, String> getPackageName(GenConfigEntity genConfig) {
        String parent = genConfig.getPackageParent() + "." + genConfig.getModuleName();
        return new HashMap<>() {{
            put("controller", parent + ".controller");
            put("entity", parent + ".entity");
            put("service", parent + ".service");
            put("serviceImpl", parent + ".service.impl");
            put("mapper", parent + ".mapper");
        }};
    }

    /**
     * 忽略前缀
     *
     * @param text   字符串
     * @param prefix 前缀
     * @return 忽略前缀字符串
     */
    private static String ignorePrefix(String text, String prefix) {
        if (!StringUtils.hasLength(prefix)) return text;

        String[] prefixArr = prefix.split(",");
        for (String p : prefixArr) {
            if (text.startsWith(p)) {
                text = text.substring(p.length());
                break;
            }
        }
        return text;
    }
}
