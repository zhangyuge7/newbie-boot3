package com.newbie.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.domain.entity.SysUser;
import org.apache.ibatis.annotations.Param;

/**
* @author 39869
* @description 针对表【sys_user(系统用户)】的数据库操作Mapper
* @createDate 2024-04-16 15:12:01
* @Entity generator.domain.SysUser
*/
public interface SysUserMapper extends BaseMapper<SysUser> {
    IPage<SysUser> queryUserByRoleId(@Param("page") Page<SysUser> page, @Param("sysUser") SysUser sysUser, @Param("roleId") Long roleId);

    IPage<SysUser> queryUnUserByRoleId(@Param("page") Page<SysUser> page,@Param("sysUser") SysUser sysUser, @Param("roleId") Long roleId);
}




