package com.newbie.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.newbie.common.domain.entity.SysRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
* @author 39869
* @description 针对表【sys_role(角色表)】的数据库操作Mapper
* @createDate 2024-04-16 15:12:01
* @Entity generator.domain.SysRole
*/
@Mapper
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 根据用户ID角色列表
     * @param userId 用户ID
     * @return 角色列表
     */
    List<SysRole> selectListByUserId(String userId);
}




