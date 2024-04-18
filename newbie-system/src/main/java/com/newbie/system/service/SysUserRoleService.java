package com.newbie.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.newbie.common.entity.SysUser;
import com.newbie.common.entity.SysUserRole;
import com.newbie.system.domain.body.SysUserBody;

import java.util.List;

/**
 * @author 39869
 * @description 针对表【sys_user_role(用户和角色关系表)】的数据库操作Service
 * @createDate 2024-04-16 15:30:47
 */
public interface SysUserRoleService extends IService<SysUserRole> {

    /**
     * 根据 用户ID 及 角色ID列表 删除数据
     * @param userId 用户ID
     * @param roleIds 角色ID列表
     */
    void removeByUserIdAndRoleIds(Long userId, List<Long> roleIds);

    /**
     * 根据 角色ID 及 用户ID列表 删除数据
     * @param roleId 角色ID
     * @param userIds 用户ID列表
     */
    void removeByRoleIdAndUserIds(Long roleId, List<Long> userIds);

    /**
     * 根据角色ID查询已分配的用户
     *
     * @param page    分页参数对象
     * @param sysUser 筛选条件对象
     * @param roleId  角色ID
     * @return
     */
    IPage<SysUser> queryUserByRoleId(Page<SysUser> page, SysUser sysUser, Long roleId);

    /**
     * 根据角色ID查询未分配的用户
     *
     * @param page    分页参数对象
     * @param sysUser 筛选条件对象
     * @param roleId  角色ID
     * @return
     */
    IPage<SysUser> queryUnUserByRoleId(Page<SysUser> page, SysUser sysUser, Long roleId);

}
