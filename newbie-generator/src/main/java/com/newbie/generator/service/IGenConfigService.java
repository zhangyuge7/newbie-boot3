package com.newbie.generator.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.newbie.generator.domain.GenConfigEntity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.Serializable;
import java.util.List;

/**
* Created by NewbieGenerator.
*
* @Author: ZhangYuGe
* @Email 398698424@qq.com
* @Date: 2024-10-04
* @Descriptions: 代码生成器配置 服务类
*/
public interface IGenConfigService extends IService<GenConfigEntity> {

    /**
    * 分页查询数据列表
    * @param page 分页信息
    * @param entity 数据实体
    * @return IPage<GenConfigEntity>
    */
    IPage<GenConfigEntity> getPage(IPage<GenConfigEntity> page, GenConfigEntity entity);

    /**
    * 查询数据列表
    * @param entity 数据实体
    * @return List<GenConfigEntity>
    */
    List<GenConfigEntity> getList(GenConfigEntity entity);

    /**
    * 根据主键查询数据详情
    * @param pkVal 主键值
    * @return GenConfigEntity
    */
    GenConfigEntity getByPkVal(Serializable pkVal);

    /**
    * 新增数据
    * @param entity 数据实体
    */
    void addData(GenConfigEntity entity);

    /**
    * 根据主键修改数据
    * @param entity 数据实体
    */
    void updateByPkVal(GenConfigEntity entity);

    /**
    * 根据主键删除数据
    * @param pkVal 主键值
    */
    void deleteByPkVal(Serializable pkVal);
}