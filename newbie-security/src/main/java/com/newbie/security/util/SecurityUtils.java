package com.newbie.security.util;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.newbie.common.entity.SysUser;
import com.newbie.security.constant.SecurityConstant;
import com.newbie.security.domain.vo.LoginUser;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/18 下午1:12
 * @Descriptions: 安全控制工具类
 */
public final class SecurityUtils {
    private SecurityUtils() {}

    /**
     *  密码加密
     * @param plaintext 密码明文
     * @return 密码密文
     */
    public static String encodePassword(String plaintext) {
        return BCrypt.hashpw(plaintext);
    }

    /**
     * 密码校验
     * @param plaintext 密码明文
     * @param encoded 密码密文
     * @return 是否匹配
     */
    public static boolean checkPassword(String plaintext, String encoded) {
        return BCrypt.checkpw(plaintext, encoded);
    }

    /**
     * 获取当前登录用户
     * @return 当前登录用户
     */
    public static LoginUser getCurrentLoginUser(){
        JSONObject jsonObject = (JSONObject) StpUtil.getExtra(SecurityConstant.SYS_USER_KEY);
        return JSONUtil.toBean(jsonObject, LoginUser.class);
    }
    /**
     * 获取当前用户
     * @return 当前用户
     */
    public static SysUser getCurrentUser(){
        return getCurrentLoginUser();
    }
}