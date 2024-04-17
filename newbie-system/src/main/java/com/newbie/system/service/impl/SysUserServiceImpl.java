package com.newbie.system.service.impl;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.entity.SysDept;
import com.newbie.common.entity.SysUser;
import com.newbie.common.exception.NewbieException;
import com.newbie.system.mapper.SysDeptMapper;
import com.newbie.system.mapper.SysUserMapper;
import com.newbie.system.service.SysUserRoleService;
import com.newbie.system.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author 39869
 * @description 针对表【sys_user(系统用户)】的数据库操作Service实现
 * @createDate 2024-04-16 15:30:47
 */
@Service
@RequiredArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser>
        implements SysUserService {
    private final SysUserMapper sysUserMapper;

    private final SysDeptMapper sysDeptMapper;

    @Override
    public IPage<SysUser> queryPage(Page<SysUser> page, SysUser sysUser) {
        Long deptId = sysUser.getDeptId();
        String username = sysUser.getUsername();
        String nickName = sysUser.getNickName();

        List<SysDept> sysDepts = new ArrayList<>();
        if (Objects.nonNull(deptId)) {
            SysDept sysDept = new SysDept();
            sysDept.setId(deptId);
            sysDepts = sysDeptMapper.selectDeptList(sysDept);
        }
        return lambdaQuery()
                .ne(SysUser::getUsername, "admin")
                .like(StringUtils.hasLength(nickName), SysUser::getNickName, nickName)
                .like(StringUtils.hasLength(username), SysUser::getUsername, username)
                .in(!CollectionUtils.isEmpty(sysDepts), SysUser::getDeptId, sysDepts.stream().map(SysDept::getId).collect(Collectors.toList()))
                .orderBy(true, true, SysUser::getSort)
                .page(page);

    }

    @Transactional
    @Override
    public void saveUser(SysUser sysUser) {
        if (!StringUtils.hasLength(sysUser.getUsername())) throw new NewbieException("用户名不能为空");
        if (!StringUtils.hasLength(sysUser.getPassword())) throw new NewbieException("登录密码不能为空");
        if (!StringUtils.hasLength(sysUser.getNickName())) throw new NewbieException("用户昵称不能为空");
        if (!checkUniqueUsername(sysUser.getUsername())) throw new NewbieException("用户名已存在，请勿重复添加");

        sysUser.setPassword(BCrypt.hashpw(sysUser.getPassword()));
        save(sysUser);
    }

    @Transactional
    @Override
    public void updateUser(SysUser sysUser) {
        if ("admin".equals(sysUser.getUsername()))
            throw new NewbieException("管理员用户不允许修改");
        if (sysUser.getId() == null) throw new NewbieException("用户ID不能为空");
        if (!StringUtils.hasLength(sysUser.getNickName())) throw new NewbieException("用户昵称不能为空");

        sysUser.setPassword(null);
        updateById(sysUser);

        //被修改用户强制掉线
        StpUtil.logout(sysUser.getId());
    }

    @Override
    public IPage<SysUser> queryUserByRoleId(Page<SysUser> page, SysUser sysUser, Long roleId) {
        return sysUserMapper.queryUserByRoleId(page, sysUser, roleId);
    }

    @Override
    public IPage<SysUser> queryUnUserByRoleId(Page<SysUser> page, SysUser sysUser, Long roleId) {
        return sysUserMapper.queryUnUserByRoleId(page, sysUser, roleId);
    }

    @Override
    public boolean updateUserPassword(Long userId, String newPassword, String confirmNewPassword) {
        if (userId == null) throw new NewbieException("用户ID为空");
        if (!StringUtils.hasLength(newPassword)) throw new NewbieException("新密码为空");
        if (!newPassword.equals(confirmNewPassword)) throw new NewbieException("两次输入密码不一致");
        // 密码加密并修改
        SysUser sysUser = new SysUser();
        sysUser.setId(userId);
        sysUser.setPassword(BCrypt.hashpw(newPassword));
        int updateCount = sysUserMapper.updateById(sysUser);

        // 将被修改用户强制掉线
        if (updateCount == 1) {
            StpUtil.logout(userId);
            return true;
        }
        return false;
    }

    /**
     * 校验用户名是否唯一
     *
     * @param username
     * @return boolean
     */
    private boolean checkUniqueUsername(String username) {
        SysUser user = lambdaQuery().eq(SysUser::getUsername, username).one();
        return Objects.isNull(user);
    }
}




