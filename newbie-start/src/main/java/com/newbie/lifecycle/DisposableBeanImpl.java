package com.newbie.lifecycle;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/17 下午4:29
 * @Descriptions: unknown
 */
@Component
public class DisposableBeanImpl  implements DisposableBean {
    @Override
    public void destroy() {
        System.err.println("退出程序");
    }
}
