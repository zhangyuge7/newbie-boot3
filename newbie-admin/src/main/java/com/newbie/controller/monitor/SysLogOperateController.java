package com.newbie.controller.monitor;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.domain.entity.SysLogOperate;
import com.newbie.common.util.R;
import com.newbie.system.service.SysLogOperateService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/5/18 下午10:29
 * @Descriptions: 系统操作日志
 */
@RestController
@RequestMapping("/monitor/log/operate")
@RequiredArgsConstructor
@Tag(name = "操作日志")
public class SysLogOperateController {

    private final SysLogOperateService sysLogOperateService;

    @Operation(summary ="查询分页数据")
    @SaCheckPermission("sys.log.operate")
    @GetMapping("/paging")
    public R<IPage<SysLogOperate>> paging(Page<SysLogOperate> page, SysLogOperate sysLogOperate) {
        String clientIp = sysLogOperate.getClientIp();
        String status = sysLogOperate.getStatus();
        String method = sysLogOperate.getMethod();
        String targetUri = sysLogOperate.getTargetUri();
        Page<SysLogOperate> pageData = sysLogOperateService.lambdaQuery()
                .like(StringUtils.hasLength(clientIp),SysLogOperate::getClientIp,clientIp)
                .eq(StringUtils.hasLength(status),SysLogOperate::getStatus,status)
                .eq(StringUtils.hasLength(method),SysLogOperate::getMethod,method)
                .like(StringUtils.hasLength(targetUri),SysLogOperate::getTargetUri,targetUri)
                .orderByDesc(SysLogOperate::getCreateTime)
                .page(page);
        return R.ok(pageData);
    }

    @Operation(summary ="批量删除")
    @SaCheckPermission("sys.log.operate.del")
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody String[] ids) {
        if (ids == null || ids.length == 0) return R.error("日志ID为空");
        sysLogOperateService.removeBatchByIds(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }

    @Operation(summary ="删除i天前数据")
    @SaCheckPermission("sys.log.operate.del")
    @GetMapping("/deleteBeforeData")
    public R<Object> deleteBeforeData(Integer i) {

        long l = System.currentTimeMillis();
        long j = 1000L * 60 * 60 * 24 * i;

        LambdaQueryWrapper<SysLogOperate> wrapper = new LambdaQueryWrapper<SysLogOperate>()
                .lt(SysLogOperate::getCreateTime, new Date(l-j));
        sysLogOperateService.remove(wrapper);
        return R.ok().setMsg("清除成功");
    }

}
