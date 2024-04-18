package com.newbie.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.newbie.common.entity.SysUser;
import com.newbie.security.util.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;


/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/17 上午9:02
 * @Descriptions: 自动填充实现
 */
@Slf4j
@Component
public class MetaObjectHandlerImpl implements MetaObjectHandler {

    /**
     * 数据插入自动填充
     *
     * @param metaObject 元对象
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        // 如果 有createTime 且 为null 则赋值当前时间
        if (metaObject.hasSetter("createTime") && metaObject.getValue("createTime") == null) {
            metaObject.setValue("createTime", new Date());
        }

        // 如果 有createBy 且 为null 则赋值当前用户名
        if (metaObject.hasSetter("createBy") && metaObject.getValue("createBy") == null) {
            SysUser currentUser = SecurityUtils.getCurrentLoginUser();
            metaObject.setValue("createBy", currentUser.getUsername());
        }

    }

    @Override
    public void updateFill(MetaObject metaObject) {

        // 如果 有updateTime 则赋值当前时间
        if (metaObject.hasSetter("updateTime")) {
            metaObject.setValue("updateTime", new Date());
        }

        // 如果 有updateBy 则赋值当前用户名
        if (metaObject.hasSetter("updateBy")) {
            SysUser currentUser = SecurityUtils.getCurrentLoginUser();
            metaObject.setValue("updateBy", currentUser.getUsername());
        }
    }
}
