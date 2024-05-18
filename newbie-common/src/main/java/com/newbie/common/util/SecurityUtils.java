package com.newbie.common.util;


import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.crypto.digest.BCrypt;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.newbie.common.constant.SecurityConstant;
import com.newbie.common.domain.LoginUser;


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
     * 判断当前登录用户是否为admin用户
     */
    public static boolean isAdmin(){
        return getCurrentLoginUser().isAdmin();
    }

    /**
     * 登录
     * @param loginUser 登录用户对象
     * @param tokenTimeout token超时
     * @return SaTokenInfo
     */
    public static SaTokenInfo login(LoginUser loginUser,Long tokenTimeout){
        SaLoginModel loginModel = SaLoginModel
                .create()
                .setExtra(SecurityConstant.SYS_USER_KEY, loginUser)
                .build();

        // token有效期
        if (tokenTimeout != null) {
            loginModel.setTimeout(tokenTimeout);
        }
        // 登录
        StpUtil.login(loginUser.getId(), loginModel);
        return StpUtil.getTokenInfo();
    }

    /**
     * 登录
     * @param loginUser 登录用户对象
     * @return SaTokenInfo
     */
    public static SaTokenInfo login(LoginUser loginUser){
       return SecurityUtils.login(loginUser,null);
    }

}
