package com.newbie.generator.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.newbie.generator.domain.GenConfigEntity;
import jakarta.annotation.Nullable;
import org.apache.ibatis.annotations.Mapper;

import java.io.Serializable;
import java.util.List;

@Mapper
public interface GenConfigMapper extends BaseMapper<GenConfigEntity> {

}
