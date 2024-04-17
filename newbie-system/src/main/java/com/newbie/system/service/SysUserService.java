package com.newbie.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.newbie.common.entity.SysUser;

/**
 * @author 39869
 * @description 针对表【sys_user(系统用户)】的数据库操作Service
 * @createDate 2024-04-16 15:30:47
 */
public interface SysUserService extends IService<SysUser> {
    /**
     * 分页查询
     *
     * @param page
     * @param entity
     * @return com.baomidou.mybatisplus.core.metadata.IPage<com.newbie.system.domain.vo.SysUserVO>
     */
    IPage<SysUser> queryPage(Page<SysUser> page, SysUser entity);

    /**
     * 添加用户
     *
     * @param sysUser
     */
    void saveUser(SysUser sysUser);

    /**
     * 修改用户
     *
     * @param sysUser
     */
    void updateUser(SysUser sysUser);


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

    /**
     * 修改密码
     *
     * @param userId             用户ID
     * @param newPassword        新密码
     * @param confirmNewPassword 确认密码
     * @return 是否成功
     */
    boolean updateUserPassword(Long userId, String newPassword, String confirmNewPassword);
}
