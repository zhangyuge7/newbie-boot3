package com.newbie.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.newbie.common.entity.SysDept;

import java.util.List;

/**
* @author 39869
* @description 针对表【sys_dept(部门表)】的数据库操作Mapper
* @createDate 2024-04-16 23:21:27
* @Entity generator.domain.SysDept
*/
public interface SysDeptMapper extends BaseMapper<SysDept> {
    /**
     * 查询部门列表，当 deptId 有值时，查询该部门及子部门列表
     * @param sysDept
     * @return
     */
    List<SysDept> selectDeptList(SysDept sysDept);
}




