package com.newbie.system.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.newbie.common.domain.entity.SysMenu;
import com.newbie.system.domain.vo.SysMenuVO;

import java.util.List;

/**
 * @author 39869
 * @description 针对表【sys_menu(系统菜单表)】的数据库操作Service
 * @createDate 2024-04-16 15:30:47
 */
public interface SysMenuService extends IService<SysMenu> {
    /**
     * 获取菜单树
     */
    List<SysMenuVO> menuTree(SysMenu sysMenu);

    /**
     * 新增菜单数据
     * @param sysMenu 菜单数据
     * @return boolean
     */
    boolean addData(SysMenu sysMenu);

    /**
     * 修改菜单数据
     * @param sysMenu 菜单数据
     * @return boolean
     */
    boolean updateData(SysMenu sysMenu);

    /**
     * 批量删除数据
     * @param idList 菜单ID列表
     */
    void deleteBatch(List<Long> idList);
}
