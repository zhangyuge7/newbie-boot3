package com.newbie.config;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.newbie.security.domain.vo.LoginUserVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Arrays;
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
    @Override
    public void insertFill(MetaObject metaObject) {
        String[] setterNames = metaObject.getSetterNames();

        if (Arrays.asList(setterNames).contains("createTime")) {
            metaObject.setValue("createTime", new Date());
        }

        if (Arrays.asList(setterNames).contains("createBy")) {
            JSONObject jsonObject = (JSONObject) StpUtil.getExtra("user");
            LoginUserVO loginUser = JSONUtil.toBean(jsonObject, LoginUserVO.class);
            metaObject.setValue("createBy", loginUser.getUsername());
        }

    }

    @Override
    public void updateFill(MetaObject metaObject) {
        String[] setterNames = metaObject.getSetterNames();
        if (Arrays.asList(setterNames).contains("updateTime")) {
            metaObject.setValue("updateTime", new Date());
        }

        if (Arrays.asList(setterNames).contains("updateBy")) {
            JSONObject jsonObject = (JSONObject) StpUtil.getExtra("user");
            LoginUserVO loginUser = JSONUtil.toBean(jsonObject, LoginUserVO.class);
            metaObject.setValue("updateBy", loginUser.getUsername());
        }
    }
}
