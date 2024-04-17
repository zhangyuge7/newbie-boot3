package com.newbie.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.entity.SysUserRole;
import com.newbie.system.domain.body.SysUserBody;
import com.newbie.system.mapper.SysUserRoleMapper;
import com.newbie.system.service.SysUserRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

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

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void removeAndAdd(SysUserBody body) {
        List<SysUserRole> userRoles = list(new QueryWrapper<SysUserRole>().eq("user_id", body.getId()));
        List<Long> delIds = userRoles.stream().filter(Objects::nonNull).map(SysUserRole::getId).collect(Collectors.toList());
        removeBatchByIds(delIds);

        List<Long> rolesIds = body.getRolesIds();
        rolesIds.stream().filter(Objects::nonNull).forEach(source -> {
            SysUserRole userRole = new SysUserRole();
            userRole.setUserId(body.getId());
            userRole.setRoleId(source);
            save(userRole);
        });
    }

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
}




