package com.newbie.common.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import org.springframework.util.StringUtils;

/**
 * 系统操作日志
 *
 * @TableName sys_log_operate
 */
@TableName(value = "sys_log_operate")
@Data
public class SysLogOperate implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 状态，1 成功，0 失败
     */
    private String status;

    /**
     * 失败原因
     */
    private String failReason;

    /**
     * 客户端IP
     */
    private String clientIp;

    /**
     * 请求路径
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

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    public void setFailReason(String msg) {
        if (StringUtils.hasLength(msg) && msg.length() > 1000) {
            this.failReason = msg.substring(0, 1000);
        } else {
            this.failReason = msg;
        }
    }


    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}