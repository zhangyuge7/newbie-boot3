package com.newbie.security.config;

import cn.dev33.satoken.stp.StpInterface;
import com.newbie.security.domain.vo.LoginUser;
import com.newbie.security.util.SecurityUtils;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 21:31
 * @Descriptions: 自定义权限加载接口实现类
 */
@Component
public class StpInterfaceImpl implements StpInterface {
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        LoginUser loginUser = SecurityUtils.getCurrentLoginUser();
        return loginUser.getPerms();
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        LoginUser loginUser = SecurityUtils.getCurrentLoginUser();
        return loginUser.getRoles();
    }
}
