package com.newbie.security.domain;

import lombok.Builder;
import lombok.Data;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 19:25
 * @Descriptions: 路由元数据
 */
@Data
@Builder
public class RouteMeta {
    private String title; // 标题。（必填）
    private String icon; // 图标
    private Boolean isHide; // 是否隐藏
    private Boolean hideChildren; // 隐藏子级
    private String iframeLink; // iframe 链接
    private Boolean isOuter; // 是否大屏页面
    private Integer sortNo; // 排序号
    private Boolean isKeep; // 是否缓存页面
    private String transition; // 过渡动画
    private Boolean fixedTab; // 固定在tabs
}
