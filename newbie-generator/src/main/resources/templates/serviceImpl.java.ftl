package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
<#if generateService>
import ${package.Service}.${table.serviceName};
</#if>
import ${superServiceImplClassPackage};
import org.springframework.stereotype.Service;

/**
 * Created by NewbieGenerator.
 *
 * @Author: ${author}
 * @Email ${email}
 * @Date: ${date}
 * @Descriptions: ${table.comment!} 服务实现类
 */
@Service
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}><#if generateService> implements ${table.serviceName}</#if> {

}
