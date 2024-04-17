package com.newbie.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
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
     * 删除并添加记录
     * @param body
     * @return void
     */
    void removeAndAdd(SysUserBody body);

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
}
