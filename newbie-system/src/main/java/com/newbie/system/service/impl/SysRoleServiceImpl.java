package com.newbie.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.domain.entity.SysRole;
import com.newbie.common.domain.entity.SysRoleMenu;
import com.newbie.common.domain.entity.SysUserRole;
import com.newbie.common.exception.NewbieException;
import com.newbie.system.mapper.SysRoleMapper;
import com.newbie.system.mapper.SysRoleMenuMapper;
import com.newbie.system.mapper.SysUserRoleMapper;
import com.newbie.system.service.SysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 39869
 * @description 针对表【sys_role(角色表)】的数据库操作Service实现
 * @createDate 2024-04-16 15:30:47
 */
@Service
@RequiredArgsConstructor
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole>
        implements SysRoleService {

    private final SysRoleMapper sysRoleMapper;
    private final SysUserRoleMapper sysUserRoleMapper;
    private final SysRoleMenuMapper sysRoleMenuMapper;

    @Override
    @Transactional
    public void deleteBatch(List<String> idList) {
        // 查询用户角色关系
        if (sysUserRoleMapper.selectCount(new LambdaQueryWrapper<SysUserRole>()
        .in(SysUserRole::getRoleId, idList)) > 0)  throw new NewbieException("请先解除用户与角色的关联后再次尝试");
        // 查询角色菜单关系
        if (sysRoleMenuMapper.selectCount(new LambdaQueryWrapper<SysRoleMenu>()
                .in(SysRoleMenu::getRoleId,idList)) > 0) throw new NewbieException("请先解除角色与菜单/按钮的关联后再次尝试");

        sysRoleMapper.deleteBatchIds(idList);
    }
}




