package com.newbie.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.domain.entity.SysDictData;
import com.newbie.common.util.R;
import com.newbie.system.service.SysDictDataService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/system/dict/data")
@RequiredArgsConstructor
@Tag(name = "字典数据")
public class SysDictDataController {
    private final SysDictDataService sysDictDataService;

    @Operation(summary ="获取分页数据")
    @SaCheckPermission("sys.dict.data")
    @GetMapping("/paging")
    public R<IPage<SysDictData>> paging(Page<SysDictData> page, SysDictData sysDictData) {
        String typeId = sysDictData.getTypeId();
        String label = sysDictData.getLabel();
        String status = sysDictData.getStatus();
        Page<SysDictData> pageData = sysDictDataService.lambdaQuery()
                .eq(StringUtils.hasLength(typeId), SysDictData::getTypeId, typeId)
                .like(StringUtils.hasLength(label), SysDictData::getLabel, label)
                .eq(StringUtils.hasLength(status), SysDictData::getStatus, status)
                .orderByAsc(SysDictData::getSort)
                .page(page);
        return R.ok(pageData);
    }

    @Operation(summary ="新增")
    @SaCheckPermission("sys.dict.data.add")
    @PostMapping("/add")
    public R<Object> add(@RequestBody SysDictData sysDictData) {
        if (Objects.isNull(sysDictData.getTypeId())) return R.error("字典类型不能为空");
        if (Objects.isNull(sysDictData.getLabel())) return R.error("字典数据名称不能为空");
        if (Objects.isNull(sysDictData.getValue())) return R.error("字典数据值不能为空");

        String dictDataId = sysDictData.getId();
        if (dictDataId != null) {
            return R.error("请检查此数据是否已存在,dictDataId=" + dictDataId);
        }

        SysDictData dictData = sysDictDataService.lambdaQuery()
                .eq(SysDictData::getTypeId, sysDictData.getTypeId())
                .eq(SysDictData::getLabel, sysDictData.getLabel())
                .one();
        if (Objects.nonNull(dictData)) {
            return R.error("同一字典类型中已存在字典数据名称为【" + sysDictData.getLabel() + "】的数据");
        }

        // 保存
        sysDictDataService.save(sysDictData);
        return R.ok().setMsg("保存成功");
    }

    @Operation(summary ="修改")
    @SaCheckPermission("sys.dict.data.update")
    @PostMapping("/update")
    public R<Object> update(@RequestBody SysDictData sysDictData) {
        if (Objects.isNull(sysDictData.getTypeId())) return R.error("字典类型不能为空");
        if (Objects.isNull(sysDictData.getLabel())) return R.error("字典数据名称不能为空");
        if (Objects.isNull(sysDictData.getValue())) return R.error("字典数据值不能为空");

        if (sysDictData.getId() == null) {
            return R.error("字典数据ID为空");
        }

        SysDictData dictData = sysDictDataService.lambdaQuery()
                .eq(SysDictData::getTypeId, sysDictData.getTypeId())
                .eq(SysDictData::getLabel, sysDictData.getLabel())
                .one();
        if (Objects.nonNull(dictData) && !dictData.getId().equals(sysDictData.getId())) {
            return R.error("同一字典类型中已存在字典数据名称为【" + sysDictData.getLabel() + "】的数据");
        }

        // 更新数据
        sysDictDataService.updateById(sysDictData);
        return R.ok().setMsg("修改成功");
    }

    @Operation(summary ="批量删除")
    @SaCheckPermission("sys.dict.data.del")
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody String[] ids) {
        if (Objects.isNull(ids) || ids.length == 0) return R.error("字典数据ID不能为空");
        sysDictDataService.removeBatchByIds(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }

    /**
     * 设置默认
     *
     * @param id 字典数据ID
     * @return
     */
    @Operation(summary ="设置默认")
    @PostMapping("/updateDictDataAsDefault/{id}")
    public R<Object> updateDictDataAsDefault(@PathVariable String id) {
        sysDictDataService.updateDictDataAsDefault(id);
        return R.ok().setMsg("修改成功");
    }

    /**
     * 根据字典类型编码查询字典数据
     *
     * @param typeCode 字典类型编码
     * @return
     */
    @Operation(summary ="根据字典类型编码查询字典数据")
    @Cacheable("dict")
    @GetMapping("/getDictDataListByTypeCode/{typeCode}")
    public R<List<SysDictData>> getDictDataListByTypeCode(@PathVariable("typeCode") String typeCode) {
        return R.ok(sysDictDataService.getDictDataListByTypeCode(typeCode));
    }

}
