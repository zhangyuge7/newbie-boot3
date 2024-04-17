package com.newbie.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.entity.SysDictType;
import com.newbie.common.util.R;
import com.newbie.system.service.SysDictTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Objects;

@RestController
@RequestMapping("/system/dict/type")
@RequiredArgsConstructor
public class SysDictTypeController {
    private final SysDictTypeService sysDictTypeService;

    @GetMapping("/page")
    public R<Page<SysDictType>> page(Page<SysDictType> page, SysDictType sysDictType) {
        String typeName = sysDictType.getTypeName();
        String typeCode = sysDictType.getTypeCode();
        String status = sysDictType.getStatus();
        Page<SysDictType> pageData = sysDictTypeService.lambdaQuery()
                .like(StringUtils.hasLength(typeName), SysDictType::getTypeName, typeName)
                .like(StringUtils.hasLength(typeCode), SysDictType::getTypeCode, typeCode)
                .eq(StringUtils.hasLength(status), SysDictType::getStatus, status)
                .orderByAsc(SysDictType::getSort)
                .page(page);
        return R.ok(pageData);
    }

    @PostMapping("/add")
    public R<Object> add(@RequestBody SysDictType sysDictType) {
        Long dictTypeId = sysDictType.getId();
        if (dictTypeId != null) {
            return R.error("请检查此数据是否已存在,dictTypeId=" + dictTypeId);
        }
        if (!StringUtils.hasLength(sysDictType.getTypeName())) {
            return R.error("名称不能为空");
        }
        if (!StringUtils.hasLength(sysDictType.getTypeCode())) {
            return R.error("编码不能为空");
        }
        if(Objects.nonNull(sysDictTypeService.lambdaQuery().eq(SysDictType::getTypeCode, sysDictType.getTypeCode()).one()))
            return R.error(sysDictType.getTypeCode() + "已存在");

        sysDictTypeService.save(sysDictType);
        return R.ok().setMsg("保存成功");
    }
    @PostMapping("/update")
    public R<Object> update(@RequestBody SysDictType sysDictType) {
        if (sysDictType.getId() == null) {
            return R.error("id不能为空");
        }
        if (!StringUtils.hasLength(sysDictType.getTypeName())) {
            return R.error("名称不能为空");
        }

        if (!StringUtils.hasLength(sysDictType.getTypeCode())) {
            return R.error("编码不能为空");
        }

        // 根据分类编码查询字典数据，保证分类编码唯一
        SysDictType dictType = sysDictTypeService.lambdaQuery().eq(SysDictType::getTypeCode, sysDictType.getTypeCode()).one();
        if(Objects.nonNull(dictType) && !dictType.getId().equals(sysDictType.getId())) return R.error(sysDictType.getTypeCode() + "已存在");

        // 修改数据
        sysDictTypeService.updateById(sysDictType);
        return R.ok().setMsg("修改成功");
    }

    @PostMapping("/deleteBatch")
    @Transactional
    public R<Object> deleteBatch(@RequestBody Long[] ids) {
        if (Objects.isNull(ids) || ids.length == 0) return R.error("id不能为空");
        sysDictTypeService.deleteBatch(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }
}
