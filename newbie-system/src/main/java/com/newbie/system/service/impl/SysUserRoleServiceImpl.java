package com.newbie.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.domain.entity.SysUser;
import com.newbie.common.domain.entity.SysUserRole;
import com.newbie.system.mapper.SysUserMapper;
import com.newbie.system.mapper.SysUserRoleMapper;
import com.newbie.system.service.SysUserRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 39869
 * @description 针对表【sys_user_role(用户和角色关系表)】的数据库操作Service实现
 * @createDate 2024-04-16 15:30:47
 */
@Service
@RequiredArgsConstructor
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole>
        implements SysUserRoleService {
    private final SysUserRoleMapper sysUserRoleMapper;
    private final SysUserMapper sysUserMapper;

    @Transactional
    @Override
    public void removeByUserIdAndRoleIds(Long userId, List<Long> roleIds) {
        sysUserRoleMapper.removeByUserIdAndRoleIds(userId,roleIds);
    }

    @Transactional
    @Override
    public void removeByRoleIdAndUserIds(Long roleId, List<Long> userIds) {
        sysUserRoleMapper.removeByRoleIdAndUserIds(roleId,userIds);

    }
    @Override
    public IPage<SysUser> queryUserByRoleId(Page<SysUser> page, SysUser sysUser, Long roleId) {
        return sysUserMapper.queryUserByRoleId(page, sysUser, roleId);
    }

    @Override
    public IPage<SysUser> queryUnUserByRoleId(Page<SysUser> page, SysUser sysUser, Long roleId) {
        return sysUserMapper.queryUnUserByRoleId(page, sysUser, roleId);
    }
}




