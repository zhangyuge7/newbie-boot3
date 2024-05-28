package com.newbie.security.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 19:24
 * @Descriptions: unknown
 */
@Data
@Builder
public class Route {
    private String path; // 路由地址
    private String name; // 路由名称
    private String component; // 组件路径
    private RouteMeta meta; // 路由元信息

    @JsonIgnore
    private String id;
    @JsonIgnore
    private String pid;
    private List<Route> children;
}
