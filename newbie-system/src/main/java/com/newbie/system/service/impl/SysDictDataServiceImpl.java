package com.newbie.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.domain.entity.SysDictData;
import com.newbie.system.service.SysDictDataService;
import com.newbie.system.mapper.SysDictDataMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
* @author 39869
* @description 针对表【sys_dict_data(系统字典数据)】的数据库操作Service实现
* @createDate 2024-04-16 23:21:27
*/
@Service
@RequiredArgsConstructor
public class SysDictDataServiceImpl extends ServiceImpl<SysDictDataMapper, SysDictData>
    implements SysDictDataService{
    private final SysDictDataMapper sysDictDataMapper;

    @Override
    @Transactional
    public void updateDictDataAsDefault(String id) {
        // 根据id查询
        SysDictData dictData = getById(id);
        // 取消默认
        sysDictDataMapper.clearDefault(dictData.getTypeId());
        // 设置默认
        sysDictDataMapper.setDefault(dictData.getId());
    }

    @Override
    public List<SysDictData> getDictDataListByTypeCode(String typeCode) {
        return sysDictDataMapper.getDictDataListByTypeCode(typeCode);
    }
}




