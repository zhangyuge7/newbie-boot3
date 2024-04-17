package com.newbie.security.service.impl;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.newbie.common.entity.SysMenu;
import com.newbie.common.entity.SysRole;
import com.newbie.common.entity.SysUser;
import com.newbie.common.enums.CommonStatusEnum;
import com.newbie.common.util.TreeUtils;
import com.newbie.security.domain.Route;
import com.newbie.security.domain.RouteMeta;
import com.newbie.security.domain.body.LoginBody;
import com.newbie.security.domain.body.PasswordBody;
import com.newbie.security.domain.vo.LoginUserVO;
import com.newbie.security.mapper.SecurityMapper;
import com.newbie.security.service.SecurityService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 15:35
 * @Descriptions: unknown
 */
@Service
@RequiredArgsConstructor
public class SecurityServiceImpl implements SecurityService {
    private final SecurityMapper securityMapper;

    @Override
    public SaTokenInfo login(LoginBody loginBody) {
        // 校验参数
        this.verifyLoginBody(loginBody);

        // 根据username查询用户
        SysUser sysUser = securityMapper.selectUserByUsername(loginBody.getUsername());

        if (sysUser == null) throw new RuntimeException("用户不存在");

        // 验证密码
        if (!BCrypt.checkpw(loginBody.getPassword(), sysUser.getPassword()))
            throw new RuntimeException("密码错误");

        // 是否禁用
        if (CommonStatusEnum.isDisabled(sysUser.getStatus())) {
            throw new RuntimeException("用户被禁用，请联系管理员");
        }

        // 密码隐藏
        sysUser.setPassword(null);

        // 构建登录数据
        LoginUserVO loginUserVO = this.builderLoginUser(sysUser);
        SaLoginModel loginModel = SaLoginModel
                .create()
                .setExtra("user", loginUserVO)
                .build();
        // 登录
        StpUtil.login(loginUserVO.getId(), loginModel);
        return StpUtil.getTokenInfo();
    }

    private LoginUserVO builderLoginUser(SysUser sysUser) {
        LoginUserVO loginUserVO = new LoginUserVO();
        BeanUtils.copyProperties(sysUser, loginUserVO);

        if ("admin".equals(loginUserVO.getUsername())) {
            List<String> all = new ArrayList<>();
            all.add("*");
            loginUserVO.setRoles(all);
            loginUserVO.setPerms(all);
        } else {
            loginUserVO.setRoles(this.getRoleCodes(loginUserVO.getId()));
            loginUserVO.setPerms(this.getPermissions(loginUserVO.getId()));
        }

        return loginUserVO;
    }

    private List<String> getPermissions(Long userId) {
        List<SysMenu> menuList = securityMapper.selectMenuListByUserId(userId);
        return menuList.stream().map(SysMenu::getPerm).toList();
    }

    private List<String> getRoleCodes(Long userId) {
        List<SysRole> roleList = securityMapper.selectRoleListByUserId(userId);
        return roleList.stream().map(SysRole::getRoleCode).toList();
    }


    @Override
    @Transactional
    public void initAdmin(PasswordBody passwordBody) {
        // 校验参数
        this.verifyPasswordBogy(passwordBody);

        if (securityMapper.selectUserByUsername("admin") != null) throw new RuntimeException("系统管理员已存在");

        SysUser sysUser = new SysUser();
        sysUser.setUsername("admin");
        sysUser.setNickName("系统管理员");
        sysUser.setPassword(BCrypt.hashpw(passwordBody.getNewPassword()));
        if (securityMapper.insertAdminUser(sysUser) != 1) throw new RuntimeException("初始化系统管理员失败");
    }

    @Override
    public List<Route> getMenuList() {
        JSONObject jsonObject = (JSONObject) StpUtil.getExtra("user");
        LoginUserVO user = JSONUtil.toBean(jsonObject, LoginUserVO.class);
        List<SysMenu> menuList;
        if ("admin".equals(user.getUsername())) {
            // 获取所有菜单
            menuList = securityMapper.selectMenuAll();
        } else {
            // 根据用户id获取菜单
            menuList = securityMapper.selectMenuByUserId(user.getId());
        }
        if (CollectionUtils.isEmpty(menuList)) {
            return new ArrayList<>();
        }
        return this.routeBuilder(menuList);
    }

    @Override
    @Transactional
    public void updatePassword(PasswordBody passwordBody) {
        if (!StringUtils.hasLength(passwordBody.getOldPassword())) throw new RuntimeException("原密码不能为空");
        this.verifyPasswordBogy(passwordBody);
        long userId = StpUtil.getLoginIdAsLong();
        SysUser sysUser = securityMapper.selectUserByUserId(userId);
        if (!BCrypt.checkpw(passwordBody.getOldPassword(), sysUser.getPassword()))
            throw new RuntimeException("原密码错误");
        String newPassword = BCrypt.hashpw(passwordBody.getNewPassword());
        sysUser.setPassword(newPassword);
        int i = securityMapper.updateUserPasswordByUserId(sysUser);
        if (i != 1) throw new RuntimeException("修改密码失败");

        // 强制下线
        StpUtil.logout();
    }

    /**
     * 构建路由
     *
     * @param menuList 菜单列表
     * @return 路由列表
     */
    private List<Route> routeBuilder(List<SysMenu> menuList) {
        List<Route> routeList = new ArrayList<>();
        menuList.forEach(m ->
                routeList.add(
                        Route
                                .builder()
                                .id(m.getId())
                                .pid(m.getParentId())
                                .path(m.getRoutePath())
                                .name(m.getRouteName())
                                .component(m.getComponent())
                                .meta(metaBuilder(m))
                                .build()
                ));

        return TreeUtils.listToTree(routeList, Route::getId, Route::getPid, Route::getChildren, Route::setChildren);
    }

    /**
     * 构建路由元数据
     *
     * @param m 菜单
     * @return 路由元数据
     */
    private RouteMeta metaBuilder(SysMenu m) {
        return RouteMeta
                .builder()
                .title(m.getTitle())
                .icon(m.getIcon())
                .isHide("1".equals(m.getIsHide()))
                .hideChildren("1".equals(m.getHideChildren()))
                .iframeLink(m.getIframeLink())
                .isOuter("1".equals(m.getIsOuter()))
                .sortNo(m.getSort())
                .isKeep("1".equals(m.getIsKeep()))
                .transition(m.getTransition())
                .fixedTab("1".equals(m.getFixedTab()))
                .build();
    }

    /**
     * 校验密码参数
     *
     * @param passwordBody 密码参数
     */
    private void verifyPasswordBogy(PasswordBody passwordBody) {
        String newPassword = passwordBody.getNewPassword();
        String confirmPassword = passwordBody.getConfirmPassword();
        if (!StringUtils.hasLength(newPassword)) throw new RuntimeException("新密码不能为空");
        if (!StringUtils.hasLength(confirmPassword)) throw new RuntimeException("确认密码不能为空");
        if (!newPassword.equals(confirmPassword)) throw new RuntimeException("两次密码不一致");
    }

    /**
     * 校验登录参数
     *
     * @param loginBody 登录参数
     */
    private void verifyLoginBody(LoginBody loginBody) {
        String username = loginBody.getUsername();
        String password = loginBody.getPassword();
        if (!StringUtils.hasLength(username)) throw new RuntimeException("用户名不能为空");
        if (!StringUtils.hasLength(password)) throw new RuntimeException("密码不能为空");
    }
}