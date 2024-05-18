package com.newbie.system.service;

import com.newbie.common.domain.entity.SysDictType;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author 39869
* @description 针对表【sys_dict_type(系统字典类型)】的数据库操作Service
* @createDate 2024-04-16 23:21:27
*/
public interface SysDictTypeService extends IService<SysDictType> {

    /**
     * 批量删除字典类型
     * @param idList 字典类型ID列表
     */
    void deleteBatch(List<Long> idList);
}
