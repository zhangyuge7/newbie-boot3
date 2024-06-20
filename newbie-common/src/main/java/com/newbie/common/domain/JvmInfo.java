package com.newbie.common.domain;

import lombok.Data;

/**
 * JAVA/JVM信息
 */
@Data
public class JvmInfo
{
    /**
     * 当前JVM占用的内存总数(M)
     */
    private long total;

    /**
     * JVM最大可用内存总数(M)
     */
    private long max;

    /**
     * JVM空闲内存(M)
     */
    private long free;

    /**
     * JDK版本
     */
    private String version;

    /**
     * JDK路径
     */
    private String home;
    
}
