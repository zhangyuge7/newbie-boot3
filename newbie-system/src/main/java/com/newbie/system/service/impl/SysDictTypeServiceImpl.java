package com.newbie.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.entity.SysDictData;
import com.newbie.common.entity.SysDictType;
import com.newbie.system.mapper.SysDictDataMapper;
import com.newbie.system.service.SysDictTypeService;
import com.newbie.system.mapper.SysDictTypeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @author 39869
* @description 针对表【sys_dict_type(系统字典类型)】的数据库操作Service实现
* @createDate 2024-04-16 23:21:27
*/
@Service
@RequiredArgsConstructor
public class SysDictTypeServiceImpl extends ServiceImpl<SysDictTypeMapper, SysDictType>
    implements SysDictTypeService{
    private final SysDictTypeMapper sysDictTypeMapper;
    private final SysDictDataMapper sysDictDataMapper;
    @Override
    @Transactional
    public void deleteDictType(Long id) {
        // 删除字典类型
        sysDictTypeMapper.deleteById(id);
        // 根据字典类型id删除字典数据
        QueryWrapper<SysDictData> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type_id", id);
        sysDictDataMapper.delete(queryWrapper);
    }
}




