package com.newbie.security.service;

import com.newbie.security.domain.vo.Captcha;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/23 上午11:12
 * @Descriptions: 验证码服务
 */
public interface CaptchaService {
    /**
     * 创建验证码
     * @param key 验证码缓存的key
     * @return
     */
    Captcha create(String key);

    /**
     * 校验验证码
     * @param userInputCode 验证码
     * @param key 验证码缓存的key
     * @return 是否匹配
     */
    boolean verify(String key,String userInputCode);

}
