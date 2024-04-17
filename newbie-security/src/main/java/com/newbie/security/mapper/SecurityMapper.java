package com.newbie.security.mapper;

import com.newbie.common.entity.SysMenu;
import com.newbie.common.entity.SysRole;
import com.newbie.common.entity.SysUser;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 19:44
 * @Descriptions: unknown
 */
public interface SecurityMapper {

    /**
     * 根据用户名查询用户
     * @param username 用户名
     * @return 用户
     */
    SysUser selectUserByUsername(String username);

    /**
     * 根据用户id查询菜单列表
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<SysMenu> selectMenuListByUserId(Long userId);

    /**
     * 根据用户ID角色列表
     * @param userId 用户ID
     * @return 角色列表
     */
    List<SysRole> selectRoleListByUserId(Long userId);

    /**
     * 初始化管理员用户
     * @param sysUser 用户对象
     */
    int insertAdminUser(SysUser sysUser);

    /**
     * 查询所有菜单
     * @return 菜单列表
     */
    List<SysMenu> selectMenuAll();

    /**
     * 根据用户ID查询菜单列表
     * @return 菜单列表
     */
    List<SysMenu> selectMenuByUserId(Long userId);

    /**
     * 根据用户ID查询用户
     * @param userId 用户ID
     * @return 用户
     */
    SysUser selectUserByUserId(long userId);

    /**
     * 根据用户ID更新用户密码
     * @param sysUser 用户对象
     */
    int updateUserPasswordByUserId(SysUser sysUser);
}
