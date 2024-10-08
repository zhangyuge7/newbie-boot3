package ${package.serviceImpl};

import com.baomidou.mybatisplus.core.metadata.IPage;
import ${package.entity}.${Entity}Entity;
import ${package.mapper}.${Entity}Mapper;
import ${package.service}.I${Entity}Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.io.Serializable;
import java.util.List;
import java.util.UUID;

/**
* Created by NewbieGenerator.
*
* @Author: ${gc.author}
* @Email ${gc.email}
* @Date: ${gc.date}
* @Descriptions: ${comment!} 服务实现类
*/
@Service
@RequiredArgsConstructor
public class ${Entity}ServiceImpl extends ServiceImpl<${Entity}Mapper, ${Entity}Entity> implements I${Entity}Service {
    private final ${Entity}Mapper ${entity}Mapper;

    @Override
    public IPage<${Entity}Entity> getPage(IPage<${Entity}Entity> page, ${Entity}Entity entity) {
        // Wrapper<${Entity}Entity> wrapper = new LambdaQueryWrapper<${Entity}Entity>()
        <#list fields as field>
        //            .like(StringUtils.hasLength(${field.name}.${field.getMethodName}()), ${Entity}Entity::${field.getMethodName}, ${field.name}.${field.getMethodName}())
        </#list>
        //        ;
        // return genConfigMapper.selectPage(page,wrapper);

        return page.setRecords(${entity}Mapper.selectList(page,entity));
    }

    @Override
    public List<${Entity}Entity> getList(${Entity}Entity entity) {
        // Wrapper<${Entity}Entity> wrapper = new LambdaQueryWrapper<${Entity}Entity>()
        <#list fields as field>
        //            .like(StringUtils.hasLength(${field.name}.${field.getMethodName}()), ${Entity}Entity::${field.getMethodName}, ${field.name}.${field.getMethodName}())
        </#list>
        //        ;
        // return genConfigMapper.selectList(wrapper);

        return ${entity}Mapper.selectList(null,entity);
    }
    
    @Override
    public ${Entity}Entity getByPkVal(Serializable pkVal) {
        return ${entity}Mapper.selectByPkVal(pkVal);
    }
    
    @Override
    public void addData(${Entity}Entity entity) {
        ${entity}Mapper.insert(entity);
    }
    
    @Override
    public void updateByPkVal(${Entity}Entity entity) {
        ${entity}Mapper.updateById(entity);
    }
    
    @Override
    public void deleteByPkVal(Serializable pkVal) {
        ${entity}Mapper.deleteById(pkVal);
    }
}
