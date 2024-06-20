package com.newbie.common.domain;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import lombok.Data;

/**
 * 系统信息
 *
 */
@Data
public class OSInfo {

    /**
     * 系统
     */
    private String os;

    /**
     * 系统架构
     */
    private String osArch;

    /**
     * java版本
     */
    private String javaVersion;

    /**
     * 工作目录
     */
    private String userDir;

    /**
     * cpu核心数
     */
    private int cpuCount;

    /**
     * 主机host
     */
    private String host;

    /**
     * 主机名称
     */
    private String hostName;

    /**
     * 系统启动时间
     */
    private String bootTime;

    /**
     * 系统正常运行时长
     */
    private String runTime;
    public String getRunTime(){
        String runTime = "";
        if (StrUtil.isNotEmpty(this.bootTime)) {
            DateTime start = DateUtil.parse(this.bootTime, DatePattern.NORM_DATETIME_PATTERN);
            runTime = DateUtil.formatBetween(start, DateUtil.date());
        }
        return runTime;
    }

}

