package com.newbie.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.entity.SysDictData;
import com.newbie.common.entity.SysDictType;
import com.newbie.system.mapper.SysDictDataMapper;
import com.newbie.system.mapper.SysDictTypeMapper;
import com.newbie.system.service.SysDictTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

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
    public void deleteBatch(List<Long> idList) {
        // 查询字典类型下的字典数据
        List<SysDictData> dictDataList = sysDictDataMapper.selectList(new LambdaQueryWrapper<SysDictData>()
                .in(SysDictData::getTypeId, idList));

        if (!CollectionUtils.isEmpty(dictDataList)) {
           throw new RuntimeException("请先删除数据后再删除类型");
        }
        // 删除字典类型
        sysDictTypeMapper.deleteBatchIds(idList);
    }
}




