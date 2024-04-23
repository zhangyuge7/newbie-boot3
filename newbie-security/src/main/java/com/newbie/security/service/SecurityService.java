package com.newbie.security.service;

import cn.dev33.satoken.stp.SaTokenInfo;
import com.newbie.security.domain.Route;
import com.newbie.security.domain.body.LoginBody;
import com.newbie.security.domain.body.PasswordBody;
import com.newbie.security.domain.vo.ImageCaptcha;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 15:35
 * @Descriptions: unknown
 */
public interface SecurityService {
    /**
     * 登录
     * @param loginBody 登录请求体参数
     * @return token信息
     */
    SaTokenInfo login(LoginBody loginBody);

    /**
     * 初始化管理员
     * @param passwordBody 初始化管理员密码
     */
    void initAdmin(PasswordBody passwordBody);

    /**
     * 获取菜单列表
     * @return 菜单列表
     */
    List<Route> getMenuList();

    /**
     * 修改密码
     * @param passwordBody 修改密码参数
     */
    void updatePassword(PasswordBody passwordBody);

}
