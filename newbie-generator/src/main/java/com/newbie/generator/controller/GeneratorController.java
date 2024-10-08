package com.newbie.generator.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.util.R;
import com.newbie.generator.domain.GenerateBody;
import com.newbie.generator.domain.TableInfo;
import com.newbie.generator.service.GeneratorService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/generator")
@RequiredArgsConstructor
public class GeneratorController {
    private final GeneratorService generatorService;
    @GetMapping("/dbTableList")
    public R<IPage<TableInfo>> dbTableList(Page<TableInfo> page, TableInfo tableInfo){
        return R.ok(generatorService.getDbTableList(page, tableInfo));
    }


    @PostMapping("/generate")
    public R<Object> generate(@RequestBody GenerateBody generateBody, HttpServletResponse response){
        if (!StringUtils.hasLength(generateBody.getConfigId())) {
            return R.error("未选择配置");
        }
        if(generateBody.getTableNames() == null || generateBody.getTableNames().length == 0){
            return R.error("未选择目标");
        }
        generatorService.generatorCode(generateBody,response);
        return R.ok();
    }
}
