package com.newbie.generator.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.generator.service.IGenConfigService;
import com.newbie.generator.domain.GenConfigEntity;
import com.newbie.common.util.R;
import lombok.RequiredArgsConstructor;
import io.swagger.v3.oas.annotations.Operation;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import java.io.Serializable;
import java.util.List;

/**
* Created by NewbieGenerator.
*
* @Author: ZhangYuGe
* @Email 398698424@qq.com
* @Date: 2024-10-04
* @Descriptions: 代码生成器配置 Api 接口
*/
@RestController
@RequestMapping("/generator/genConfig")
@RequiredArgsConstructor
public class GenConfigController {

    private final IGenConfigService iGenConfigService;

    @Operation(summary ="分页查询数据列表")
    @SaCheckPermission("generator.genConfig.list")
    @GetMapping("/page")
    public R<IPage<GenConfigEntity>> page(Page<GenConfigEntity> page, GenConfigEntity entity) {
        return R.ok(iGenConfigService.getPage(page,entity));
    }

    @Operation(summary ="查询数据列表")
    @SaCheckPermission("generator.genConfig.list")
    @GetMapping("/list")
    public R<List<GenConfigEntity>> list(GenConfigEntity entity) {
       return R.ok(iGenConfigService.getList(entity));
   }

    @Operation(summary ="新增数据")
    @SaCheckPermission("generator.genConfig.add")
    @PostMapping("/addData")
    public R<Object> addData(@RequestBody GenConfigEntity entity) {
        iGenConfigService.addData(entity);
        return R.ok();
    }

    @Operation(summary ="根据主键更新数据")
    @SaCheckPermission("generator.genConfig.update")
    @PostMapping("/updateByPkVal")
    public R<Object> updateByPkVal(@RequestBody GenConfigEntity entity) {
        iGenConfigService.updateById(entity);
        return R.ok();
     }
    @Operation(summary ="根据主键删除数据")
    @SaCheckPermission("generator.genConfig.delete")
    @PostMapping("/deleteByPkVal/{id}")
    public R<Object> deleteByPkVal(@PathVariable Serializable id) {
        iGenConfigService.deleteByPkVal(id);
        return R.ok();
    }
}