package com.newbie.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.newbie.common.domain.entity.SysLogLogin;
/**
* @author 39869
* @description 针对表【sys_log_login(系统登录日志)】的数据库操作Service
* @createDate 2024-05-20 16:09:37
*/
public interface SysLogLoginService extends IService<SysLogLogin> {

    void saveLoginLog(String username,long startTimeMillis,String type,String loginMethod);


    /**
     * 存登录日志
     * @param username 用户名
     * @param startTimeMillis 开始时间戳
     * @param type 1 登入，0 登出
     * @param loginMethod 登录方式
     * @param e 异常对象
     */
    void saveLoginLog(String username,long startTimeMillis,String type,String loginMethod, Throwable e);
}
