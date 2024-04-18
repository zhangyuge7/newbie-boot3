package com.newbie.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.entity.SysDictData;
import com.newbie.common.util.R;
import com.newbie.system.service.SysDictDataService;
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
public class SysDictDataController {
    private final SysDictDataService sysDictDataService;

    @GetMapping("/page")
    public R<Page<SysDictData>> page(Page<SysDictData> page, SysDictData sysDictData) {
        Long typeId = sysDictData.getTypeId();
        String label = sysDictData.getLabel();
        String status = sysDictData.getStatus();
        Page<SysDictData> pageData = sysDictDataService.lambdaQuery()
                .eq(Objects.nonNull(typeId), SysDictData::getTypeId, typeId)
                .like(StringUtils.hasLength(label), SysDictData::getLabel, label)
                .eq(StringUtils.hasLength(status), SysDictData::getStatus, status)
                .orderByAsc(SysDictData::getSort)
                .page(page);
        return R.ok(pageData);
    }

    @PostMapping("/add")
    public R<Object> add(@RequestBody SysDictData sysDictData) {
        if (Objects.isNull(sysDictData.getTypeId())) return R.error("字典类型不能为空");
        if (Objects.isNull(sysDictData.getLabel())) return R.error("字典数据名称不能为空");
        if (Objects.isNull(sysDictData.getValue())) return R.error("字典数据值不能为空");

        Long dictDataId = sysDictData.getId();
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

    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody Long[] ids) {
        if (Objects.isNull(ids) || ids.length == 0) return R.error("字典数据ID不能为空");
        sysDictDataService.removeBatchByIds(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }

    /**
     * 设置默认
     * @param id 字典数据ID
     * @return
     */
    @PostMapping("/updateDictDataAsDefault/{id}")
    public R<Object> updateDictDataAsDefault(@PathVariable Long id) {
        sysDictDataService.updateDictDataAsDefault(id);
        return R.ok().setMsg("修改成功");
    }

    /**
     * 根据字典类型编码查询字典数据
     *
     * @param typeCode 字典类型编码
     * @return
     */
    @Cacheable("dict")
    @GetMapping("/getDictDataListByTypeCode/{typeCode}")
    public R<List<SysDictData>> getDictDataListByTypeCode(@PathVariable("typeCode") String typeCode) {
        return R.ok(sysDictDataService.getDictDataListByTypeCode(typeCode));
    }

}
