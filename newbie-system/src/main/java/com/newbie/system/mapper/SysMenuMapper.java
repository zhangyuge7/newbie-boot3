package com.newbie.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.newbie.common.domain.entity.SysMenu;

import java.util.List;

/**
* @author 39869
* @description 针对表【sys_menu(系统菜单表)】的数据库操作Mapper
* @createDate 2024-04-16 15:12:01
* @Entity generator.domain.SysMenu
*/
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    List<SysMenu> selectMenuList(SysMenu sysMenu);
}




