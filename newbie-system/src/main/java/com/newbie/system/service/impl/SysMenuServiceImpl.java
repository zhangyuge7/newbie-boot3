package com.newbie.system.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.entity.SysDept;
import com.newbie.common.entity.SysMenu;
import com.newbie.common.entity.SysRoleMenu;
import com.newbie.common.exception.NewbieException;
import com.newbie.common.util.TreeUtils;
import com.newbie.security.domain.vo.LoginUserVO;
import com.newbie.system.constant.SysMenuConstant;
import com.newbie.system.domain.vo.SysMenuVO;
import com.newbie.system.mapper.SysMenuMapper;
import com.newbie.system.mapper.SysRoleMenuMapper;
import com.newbie.system.service.SysMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 39869
 * @description 针对表【sys_menu(系统菜单表)】的数据库操作Service实现
 * @createDate 2024-04-16 15:30:47
 */
@Service
@RequiredArgsConstructor
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu>
        implements SysMenuService {
    private final SysMenuMapper sysMenuMapper;
    private final SysRoleMenuMapper sysRoleMenuMapper;

    @Override
    public List<SysMenuVO> menuTree(SysMenu sysMenu) {
        // 查询数据
        List<SysMenu> menuList = sysMenuMapper.selectMenuList(sysMenu);

        // 对象转换
        List<SysMenuVO> menuTrees = new ArrayList<>();
        SysMenuVO sysMenuVO;
        for (SysMenu menu : menuList) {
            sysMenuVO = new SysMenuVO();
            BeanUtils.copyProperties(menu, sysMenuVO);
            menuTrees.add(sysMenuVO);
        }


        // 组装树结构并返回数据
        menuTrees =  TreeUtils.listToTree(menuTrees, SysMenuVO::getId, SysMenuVO::getParentId,
                SysMenuVO::getChildren,SysMenuVO::setChildren);
        return menuTrees;
    }

    @Override
    @Transactional
    public boolean addData(SysMenu sysMenu){
        // 校验数据
        this.verifyMenu(sysMenu);

        // 新增数据
        int count = sysMenuMapper.insert(sysMenu);
        return count == 1;
    }
    @Override
    @Transactional
    public boolean updateData(SysMenu sysMenu){
        // 校验数据
        this.verifyMenu(sysMenu);
        // 根据 menuId 获取菜单及子级菜单列表
        SysMenu params = new SysMenu();
        params.setId(sysMenu.getId());
        List<SysMenu> sysMenus = sysMenuMapper.selectMenuList(params);
        // 判断列表中是否包含需要修改的菜单的父级菜单，如果有抛出异常
        List<SysMenu> ls = sysMenus.stream().filter(item -> item.getId().equals(sysMenu.getParentId())).collect(Collectors.toList());
        if (!ls.isEmpty()) {
            throw new NewbieException("上级不能为自己或自己的子级");
        }

        // 修改数据
        int count = sysMenuMapper.updateById(sysMenu);
        return count == 1;
    }

    @Override
    @Transactional
    public void deleteBatch(List<Long> idList) {
        // 查找子数据
        if (sysMenuMapper.selectCount(new LambdaQueryWrapper<SysMenu>()
                .in(SysMenu::getParentId, idList)
                .notIn(SysMenu::getId,idList)) > 0) {
            throw new NewbieException("请先删除子菜单/按钮后再次尝试");
        }
        // 查找与角色关系
        if (sysRoleMenuMapper.selectCount(new LambdaQueryWrapper<SysRoleMenu>()
                .in(SysRoleMenu::getMenuId, idList))>0) {
            throw new NewbieException("请先解除角色与菜单的关联后再次尝试");
        }
        sysMenuMapper.deleteBatchIds(idList);
    }


    /**
     * 校验菜单请求体数据
     *
     * @param menu 菜单数据
     */
    private void verifyMenu(SysMenu menu) {
        if (!StringUtils.hasLength(menu.getTitle())) {
            throw new NewbieException("标题不可以为空");
        }
        if (SysMenuConstant.MENU_TYPE_MENU.equals(menu.getType())) {
            if (!StringUtils.hasLength(menu.getRoutePath())) {
                throw new NewbieException("路由地址不可以为空");
            }
            if (!menu.getRoutePath().startsWith("/") && !menu.getRoutePath().startsWith("http:") && !menu.getRoutePath().startsWith("https:")) {
                throw new NewbieException("路由地址必须以 / 开头，外链必须以 http[s]: 开头");
            }
            if(StringUtils.hasLength(menu.getComponent()) && menu.getComponent().startsWith("/")){
                throw new NewbieException("组件路径不需要以 / 开头");
            }

        }
    }
}




