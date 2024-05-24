package com.newbie.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.newbie.common.domain.entity.SysLogOperate;

/**
* @author 39869
* @description 针对表【sys_log_operat(系统操作日志)】的数据库操作Service
* @createDate 2024-05-18 18:03:34
*/
public interface SysLogOperateService extends IService<SysLogOperate> {

    /**
     * 保存操作日志
     * @param targetFun 目标类方法
     * @param startTimeMillis 开始时间戳
     * @param throwable 异常对象
     */
    void saveSysLogOperate(String targetFun,long startTimeMillis,Throwable throwable);

    void saveSysLogOperate(String targetFun,long startTimeMillis);
}
