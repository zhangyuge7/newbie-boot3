package com.newbie.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.newbie.common.domain.entity.SysDictData;

import java.util.List;

/**
* @author 39869
* @description 针对表【sys_dict_data(系统字典数据)】的数据库操作Mapper
* @createDate 2024-04-16 23:21:27
* @Entity generator.domain.SysDictData
*/
public interface SysDictDataMapper extends BaseMapper<SysDictData> {
    /**
     * 根据字典类型编码查询字典数据
     * @param typeCode 字典类型编码
     * @return
     */
    List<SysDictData> getDictDataListByTypeCode(String typeCode);

    /**
     * 清除字典类型下的默认字典数据
     * @param typeId 字典类型id
     */
    void clearDefault(String typeId);

    /**
     * 设置字典数据为默认字典数据
     * @param id 字典数据id
     */
    void setDefault(String id);
}




