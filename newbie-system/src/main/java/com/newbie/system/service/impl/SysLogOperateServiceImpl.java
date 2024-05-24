package com.newbie.system.service.impl;


import cn.hutool.core.thread.ThreadUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.domain.LoginUser;
import com.newbie.common.domain.entity.SysLogOperate;
import com.newbie.common.util.IpUtils;
import com.newbie.common.util.SecurityUtils;
import com.newbie.system.mapper.SysLogOperateMapper;
import com.newbie.system.service.SysLogOperateService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Objects;

/**
* @author 39869
* @description 针对表【sys_log_operat(系统操作日志)】的数据库操作Service实现
* @createDate 2024-05-18 18:03:34
*/
@Service
public class SysLogOperateServiceImpl extends ServiceImpl<SysLogOperateMapper, SysLogOperate>
    implements SysLogOperateService {


    @Override
    public void saveSysLogOperate(String targetFun,long startTimeMillis,Throwable throwable) {
        // 获取Request对象
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        // 创建操作日志对象
        SysLogOperate sysLogOperate = new SysLogOperate();
        // 获取当前用户
        try {
            LoginUser currentLoginUser = SecurityUtils.getCurrentLoginUser();
            if (Objects.nonNull(currentLoginUser)) {
                // 操作者用户名
                sysLogOperate.setUsername(currentLoginUser.getUsername());
            }
        }catch (Exception e){
            sysLogOperate.setUsername("#");
        }

        // 客户端地址
        sysLogOperate.setClientIp(IpUtils.getIpAddr(request));
        // 接口路径
        sysLogOperate.setTargetUri(request.getRequestURI());
        // 目标方法
        sysLogOperate.setTargetFun(targetFun);
        // 请求方式
        sysLogOperate.setMethod(request.getMethod());


        if (Objects.nonNull(throwable)) {
            // 日志类型，1 正常，0 异常
            sysLogOperate.setStatus("0");
            // 异常消息
            sysLogOperate.setFailReason(throwable.getMessage());
        }else{
            sysLogOperate.setStatus("1");
        }
        // 消耗时长，毫秒
        sysLogOperate.setCostTime(System.currentTimeMillis() - startTimeMillis);
        // 保存日志
        ThreadUtil.execute(()-> this.save(sysLogOperate));


    }

    @Override
    public void saveSysLogOperate(String targetFun, long startTimeMillis) {
        this.saveSysLogOperate(targetFun,startTimeMillis,null);
    }
}




