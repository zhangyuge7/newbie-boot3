package com.newbie.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.domain.entity.SysDictType;
import com.newbie.common.util.R;
import com.newbie.system.service.SysDictTypeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Objects;

@RestController
@RequestMapping("/system/dict/type")
@RequiredArgsConstructor
@Tag(name = "字典类型")
public class SysDictTypeController {
    private final SysDictTypeService sysDictTypeService;

    @Operation(summary ="查询分页数据")
    @SaCheckPermission("sys.dict.type")
    @GetMapping("/paging")
    public R<Page<SysDictType>> paging(Page<SysDictType> page, SysDictType sysDictType) {
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

    @Operation(summary ="新增")
    @SaCheckPermission("sys.dict.type.add")
    @PostMapping("/add")
    public R<Object> add(@RequestBody SysDictType sysDictType) {
        String dictTypeId = sysDictType.getId();
        if (StringUtils.hasLength(dictTypeId))  return R.error("请检查此数据是否已存在,dictTypeId=" + dictTypeId);
        if (!StringUtils.hasLength(sysDictType.getTypeName())) return R.error("名称不能为空");
        if (!StringUtils.hasLength(sysDictType.getTypeCode()))  return R.error("编码不能为空");
        if (Objects.nonNull(sysDictTypeService.lambdaQuery().eq(SysDictType::getTypeCode, sysDictType.getTypeCode()).one()))
            return R.error(sysDictType.getTypeCode() + "已存在");

        sysDictTypeService.save(sysDictType);
        return R.ok().setMsg("保存成功");
    }

    @Operation(summary ="修改")
    @SaCheckPermission("sys.dict.type.update")
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
        if (Objects.nonNull(dictType) && !dictType.getId().equals(sysDictType.getId()))
            return R.error(sysDictType.getTypeCode() + "已存在");

        // 修改数据
        sysDictTypeService.updateById(sysDictType);
        return R.ok().setMsg("修改成功");
    }

    @Operation(summary ="批量删除")
    @SaCheckPermission("sys.dict.type.del")
    @PostMapping("/deleteBatch")
    @Transactional
    public R<Object> deleteBatch(@RequestBody String[] ids) {
        if (Objects.isNull(ids) || ids.length == 0) return R.error("id不能为空");
        sysDictTypeService.deleteBatch(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }
}
