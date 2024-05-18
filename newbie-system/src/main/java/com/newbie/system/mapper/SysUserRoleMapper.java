package com.newbie.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.newbie.common.domain.entity.SysUserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author 39869
* @description 针对表【sys_user_role(用户和角色关系表)】的数据库操作Mapper
* @createDate 2024-04-16 15:12:01
* @Entity generator.domain.SysUserRole
*/
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {
    void removeByUserIdAndRoleIds(@Param("userId") Long userId, @Param("roleIds") List<Long> roleIds);

    void removeByRoleIdAndUserIds(@Param("roleId") Long roleId, @Param("userIds") List<Long> userIds);
}




