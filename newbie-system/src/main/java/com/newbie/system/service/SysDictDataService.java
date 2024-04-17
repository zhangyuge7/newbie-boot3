package com.newbie.system.service;

import com.newbie.common.entity.SysDictData;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author 39869
* @description 针对表【sys_dict_data(系统字典数据)】的数据库操作Service
* @createDate 2024-04-16 23:21:27
*/
public interface SysDictDataService extends IService<SysDictData> {

    /**
     * 根据数据ID修改此数据为默认，此数据同分类下其它数据取消默认
     * @param id 数据ID
     */
    void updateDictDataAsDefault(Long id);

    /**
     * 根据分类编码获取数据列表
     * @param typeCode 分类编码
     * @return 是否成功
     */
    List<SysDictData> getDictDataListByTypeCode(String typeCode);
}
