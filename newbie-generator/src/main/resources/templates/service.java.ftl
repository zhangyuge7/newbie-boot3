package ${package.service};

import com.baomidou.mybatisplus.core.metadata.IPage;
import ${package.entity}.${Entity}Entity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.Serializable;
import java.util.List;

/**
* Created by NewbieGenerator.
*
* @Author: ${gc.author}
* @Email ${gc.email}
* @Date: ${gc.date}
* @Descriptions: ${comment!} 服务类
*/
public interface I${Entity}Service extends IService<${Entity}Entity> {

    /**
    * 分页查询数据列表
    * @param page 分页信息
    * @param entity 数据实体
    * @return IPage<${Entity}Entity>
    */
    IPage<${Entity}Entity> getPage(IPage<${Entity}Entity> page, ${Entity}Entity entity);

    /**
    * 查询数据列表
    * @param entity 数据实体
    * @return List<${Entity}Entity>
    */
    List<${Entity}Entity> getList(${Entity}Entity entity);

    /**
    * 根据主键查询数据详情
    * @param pkVal 主键值
    * @return ${Entity}Entity
    */
    ${Entity}Entity getByPkVal(Serializable pkVal);

    /**
    * 新增数据
    * @param entity 数据实体
    */
    void addData(${Entity}Entity entity);

    /**
    * 根据主键修改数据
    * @param entity 数据实体
    */
    void updateByPkVal(${Entity}Entity entity);

    /**
    * 根据主键删除数据
    * @param pkVal 主键值
    */
    void deleteByPkVal(Serializable pkVal);
}