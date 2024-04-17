package com.newbie.system.service;

import com.newbie.common.entity.SysDictType;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author 39869
* @description 针对表【sys_dict_type(系统字典类型)】的数据库操作Service
* @createDate 2024-04-16 23:21:27
*/
public interface SysDictTypeService extends IService<SysDictType> {
    /**
     * 删除字典分类并删除类型下的字典数据
     * @param id 字典分类ID
     * @return 是否成功
     */
    void deleteDictType(Long id);
}
