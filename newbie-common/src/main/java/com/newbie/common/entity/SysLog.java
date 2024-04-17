package com.newbie.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serial;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName sys_log
 */
@TableName(value ="sys_log")
@Data
public class SysLog implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 操作者
     */
    private String operator;

    /**
     * 响应状态，1 正常，0异常
     */
    private String resStatus;

    /**
     * 异常消息
     */
    private String errMsg;

    /**
     * 操作者IP
     */
    private String fromIp;

    /**
     * 请求地址
     */
    private String targetUri;

    /**
     * 执行的类方法
     */
    private String targetFun;

    /**
     * 请求方式
     */
    private String method;

    /**
     * 消耗时长，毫秒
     */
    private Long costTime;

    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}