package com.newbie.common.domain.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;
import org.springframework.util.StringUtils;

/**
 * 系统登录日志
 * @TableName sys_log_login
 */
@TableName(value ="sys_log_login")
@Data
public class SysLogLogin implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 状态 1 成功，0 失败
     */
    private String status;

    /**
     * 登录IP
     */
    private String loginIp;

    /**
     * 登录方式
     */
    private String loginMethod;

    /**
     * 失败原因
     */
    private String failReason;

    /**
     * 操作系统
     */
    private String os;

    /**
     * 浏览器信息
     */
    private String browser;

    /**
     * 消耗时长，毫秒
     */
    private Long costTime;

    /**
     * 1 登入，0 登出
     */
    private String loginType;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 用户名
     */
    private String username;

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