package com.newbie.security.service.impl;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import cn.hutool.captcha.generator.CodeGenerator;
import cn.hutool.captcha.generator.MathGenerator;
import com.newbie.common.exception.NewbieException;
import com.newbie.security.domain.vo.Captcha;
import com.newbie.security.domain.vo.ImageCaptcha;
import com.newbie.security.service.CaptchaService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.concurrent.TimeUnit;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/23 上午11:17
 * @Descriptions: 图片验证码实现
 */
@Service
@RequiredArgsConstructor
public class ImageCaptchaServiceImpl implements CaptchaService {
    private final RedisTemplate<String, Object> redisTemplate;
    private final CodeGenerator codeGenerator = new MathGenerator(1);
    @Value("${captcha.timeout}")
    private Long timeout;

    @Override
    public Captcha create(String key) {
        LineCaptcha captcha = CaptchaUtil.createLineCaptcha(200, 100, this.codeGenerator, 0);
        String code = captcha.getCode();
        ImageCaptcha imageCaptcha = new ImageCaptcha();
        imageCaptcha.setCheckCodeKey(key);
        imageCaptcha.setImageBase64(captcha.getImageBase64Data());

        // 缓存key和code
        redisTemplate.opsForValue().set(key, code, timeout, TimeUnit.SECONDS);

        return imageCaptcha;
    }

    @Override
    public boolean verify(String key,String userInputCode) {
        if(!StringUtils.hasLength(key)) throw new NewbieException("验证码key不能为空");
        if(!StringUtils.hasLength(userInputCode)) throw new NewbieException("验证码不能为空");
        Object o = redisTemplate.opsForValue().get(key);
        if(o == null){
            throw new NewbieException("验证码已失效");
        }
        String code = (String)o;
        boolean verify =this.codeGenerator.verify(code, userInputCode);
        if(verify){
            redisTemplate.delete(key);
            return true;
        }else{
            return false;
        }
    }
}
