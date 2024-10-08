package ${package.mapper};

import com.baomidou.mybatisplus.core.metadata.IPage;
import ${package.entity}.${Entity}Entity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import jakarta.annotation.Nullable;
import org.apache.ibatis.annotations.Mapper;

import java.io.Serializable;
import java.util.List;


/**
* Created by NewbieGenerator.
*
* @Author: ${gc.author}
* @Email ${gc.email}
* @Date: ${gc.date}
* @Descriptions: ${comment!} Mapper 接口
*/
@Mapper
public interface ${Entity}Mapper extends BaseMapper<${Entity}Entity> {

    /**
    * 查询数据列表
    * @param page 分页信息
    * @param entity 数据实体类
    * @return List<${Entity}Entity>
    */
    List<${Entity}Entity> selectList(@Nullable IPage<${Entity}Entity> page, ${Entity}Entity entity);

    /**
    * 根据主键查询数据
    * @param pkVal 主键值
    * @return ${Entity}Entity
    */
    ${Entity}Entity selectByPkVal(Serializable pkVal);

    /**
    * 插入数据
    * @param entity 数据实体类
    * @return 插入条数
    */
    int insertData(${Entity}Entity entity);

    /**
    * 根据主键更新数据
    * @param entity 数据实体类
    * @return 更新条数
    */
    int updateByPkVal(${Entity}Entity entity);

    /**
    * 根据主键删除数据
    * @param pkVal 主键值
    * @return 删除条数
    */
    int deleteByPkVal(Serializable pkVal);
}
