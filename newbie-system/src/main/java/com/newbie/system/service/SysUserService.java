package com.newbie.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.newbie.common.domain.entity.SysUser;

import java.util.List;

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
     * 修改密码
     *
     * @param userId             用户ID
     * @param newPassword        新密码
     * @param confirmNewPassword 确认密码
     * @param immediatelyKick 修改成功后是否强制下线
     * @return 是否成功
     */
    boolean updateUserPassword(String userId, String newPassword, String confirmNewPassword,Boolean immediatelyKick);

    /**
     * 批量删除
     * @param idList ID列表
     */
    void deleteBatch(List<String> idList);

    /**
     * 修改当前用户基本信息
     * @param sysUser 用户对象
     */
    void updateByCurr(SysUser sysUser);
}
