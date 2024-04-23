package com.newbie.security.domain.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/23 上午10:49
 * @Descriptions: unknown
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ImageCaptcha extends Captcha{
    private String checkCodeKey; // 验证码key
    private String imageBase64; // 验证码图片base64
}
