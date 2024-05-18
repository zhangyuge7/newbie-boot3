package com.newbie.weblog.enums;

/**
 * WebLog策略枚举
 */
public enum WebLogStrategyEnum {
    /**
     * 默认
     * 记录带有 WebLog 注解的接口的日志
     */
    DEFAULT,
    /**
     * 记录所有接口的日志
     */
    ALL_API
}
