package com.newbie.system.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.constant.SecurityConstant;
import com.newbie.common.entity.SysDept;
import com.newbie.common.entity.SysUser;
import com.newbie.common.entity.SysUserRole;
import com.newbie.common.exception.NewbieException;
import com.newbie.common.util.SecurityUtils;
import com.newbie.system.mapper.SysDeptMapper;
import com.newbie.system.mapper.SysUserMapper;
import com.newbie.system.mapper.SysUserRoleMapper;
import com.newbie.system.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
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
    private final SysUserRoleMapper sysUserRoleMapper;

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
                .ne(SysUser::getUsername, SecurityConstant.ADMIN_USER_NAME)
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
        if(SecurityConstant.ADMIN_USER_NAME.equals(sysUser.getUsername())) throw new NewbieException("用户名不能为admin");
        if (sysUserMapper.selectCount(new LambdaQueryWrapper<SysUser>().eq(SysUser::getUsername,sysUser.getUsername())) > 0)
            throw new NewbieException("用户名已存在，请勿重复添加");

        sysUser.setPassword(SecurityUtils.encodePassword(sysUser.getPassword()));
        save(sysUser);
    }

    @Transactional
    @Override
    public void updateUser(SysUser sysUser) {
        if (SecurityConstant.ADMIN_USER_NAME.equals(sysUser.getUsername()))
            throw new NewbieException("管理员用户不允许修改");
        if (sysUser.getId() == null) throw new NewbieException("用户ID不能为空");
        if (!StringUtils.hasLength(sysUser.getNickName())) throw new NewbieException("用户昵称不能为空");

        sysUser.setPassword(null);
        updateById(sysUser);

        //被修改用户强制掉线
        StpUtil.logout(sysUser.getId());
    }

    @Override
    @Transactional
    public boolean updateUserPassword(Long userId, String newPassword, String confirmNewPassword,Boolean immediatelyKick) {
        if (userId == null) throw new NewbieException("用户ID为空");
        if (!StringUtils.hasLength(newPassword)) throw new NewbieException("新密码为空");
        if (!newPassword.equals(confirmNewPassword)) throw new NewbieException("两次输入密码不一致");

        // 系统管理员密码只能由系统管理员修改
        if (this.isAdminById(userId) && !SecurityUtils.isAdmin()) {
            throw new NewbieException("您没有权限修改系统管理员密码");
        }

        // 密码加密并修改
        SysUser sysUser = new SysUser();
        sysUser.setId(userId);
        sysUser.setPassword(SecurityUtils.encodePassword(newPassword));
        int updateCount = sysUserMapper.updateById(sysUser);

        // 将被修改用户强制掉线
        if (immediatelyKick && updateCount == 1) {
            StpUtil.logout(userId);
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public void deleteBatch(List<Long> idList) {
        // 是否有admin用户
        if (hasAdminByIdList(idList))
            throw new NewbieException("不可以删除admin系统管理员");

        // 查询用户角色关系
        if (sysUserRoleMapper.selectCount(new LambdaQueryWrapper<SysUserRole>().in(SysUserRole::getUserId,idList)) > 0)
            throw new NewbieException("请先解除用户与角色的关联后再次尝试");

        idList.forEach(StpUtil::logout); // 被删除用户下线

        sysUserMapper.deleteBatchIds(idList);
    }

    /**
     * 根据用户ID判断是否为admin系统管理员
     * @param userId 用户ID
     */
    private boolean isAdminById(Long userId) {
        return sysUserMapper.selectCount(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getId, userId)
                .eq(SysUser::getUsername,SecurityConstant.ADMIN_USER_NAME)) > 0;
    }

    /**
     * 根据用户ID列表判断是否有admin系统管理员
     * @param userIdList 用户ID列表
     */
    private boolean hasAdminByIdList(List<Long> userIdList) {
        return sysUserMapper.selectCount(new LambdaQueryWrapper<SysUser>()
                .in(SysUser::getId, userIdList)
                .eq(SysUser::getUsername,SecurityConstant.ADMIN_USER_NAME)) > 0;
    }

}




