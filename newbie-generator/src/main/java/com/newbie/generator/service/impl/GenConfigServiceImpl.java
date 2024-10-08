package com.newbie.generator.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.newbie.generator.domain.GenConfigEntity;
import com.newbie.generator.mapper.GenConfigMapper;
import com.newbie.generator.service.IGenConfigService;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

/**
* Created by NewbieGenerator.
*
* @Author: ZhangYuGe
* @Email 398698424@qq.com
* @Date: 2024-10-04
* @Descriptions: 代码生成器配置 服务实现类
*/
@Service
@RequiredArgsConstructor
public class GenConfigServiceImpl extends ServiceImpl<GenConfigMapper, GenConfigEntity> implements IGenConfigService {
    private final GenConfigMapper genConfigMapper;

    @Override
    public IPage<GenConfigEntity> getPage(IPage<GenConfigEntity> page, GenConfigEntity entity) {
        Wrapper<GenConfigEntity> wrapper = new LambdaQueryWrapper<GenConfigEntity>()
                .like(StringUtils.hasLength(entity.getConfigName()), GenConfigEntity::getConfigName, entity.getConfigName())
                .like(StringUtils.hasLength(entity.getAuthor()),GenConfigEntity::getAuthor,entity.getAuthor());
        return genConfigMapper.selectPage(page,wrapper);
    }

    @Override
    public List<GenConfigEntity> getList(GenConfigEntity entity) {
        Wrapper<GenConfigEntity> wrapper = new LambdaQueryWrapper<GenConfigEntity>()
                .like(StringUtils.hasLength(entity.getConfigName()), GenConfigEntity::getConfigName, entity.getConfigName())
                .like(StringUtils.hasLength(entity.getAuthor()),GenConfigEntity::getAuthor,entity.getAuthor());
        return genConfigMapper.selectList(wrapper);
    }
    
    @Override
    public GenConfigEntity getByPkVal(Serializable pkVal) {
        return genConfigMapper.selectById(pkVal);
    }
    
    @Override
    public void addData(GenConfigEntity entity) {
        genConfigMapper.insert(entity);
    }
    
    @Override
    public void updateByPkVal(GenConfigEntity entity) {
        genConfigMapper.updateById(entity);
    }
    
    @Override
    public void deleteByPkVal(Serializable pkVal) {
        genConfigMapper.deleteById(pkVal);
    }
}
