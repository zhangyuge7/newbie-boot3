package com.newbie.system.controller;

import com.newbie.common.entity.SysDept;
import com.newbie.common.util.R;
import com.newbie.system.domain.vo.SysDeptVO;
import com.newbie.system.service.SysDeptService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/system/dept")
@RequiredArgsConstructor
public class SysDeptController {

    private final SysDeptService sysDeptService;

    @GetMapping("/tree")
    public R<List<SysDeptVO>> getDeptTree(SysDept sysDept) {
        return R.ok(sysDeptService.getDeptTree(sysDept));
    }

    @PostMapping("/add")
    public R<Object> addDept(@RequestBody SysDept sysDept) {
        Long deptId = sysDept.getId();
        if (deptId != null) {
            return R.error("请检查此数据是否已存在,deptId=" + deptId);
        }
        return sysDeptService.addDept(sysDept) ? R.ok() : R.error("新增失败");
    }

    @PostMapping("/update")
    public R<Object> updateDept(@RequestBody SysDept sysDept) {
        if (sysDept.getId() == null) {
            return R.error("部门ID为空");
        }
        return sysDeptService.updateDept(sysDept) ? R.ok() : R.error("修改失败");
    }

    @PostMapping("/delete")
    public R<Boolean> delete(@RequestBody String[] ids) {
        List<Long> deptIdList = Arrays.stream(ids).map(Long::valueOf).collect(Collectors.toList());
        return sysDeptService.deleteDeptBatch(deptIdList)
                ? R.ok()
                : R.error("操作失败");
    }
}
