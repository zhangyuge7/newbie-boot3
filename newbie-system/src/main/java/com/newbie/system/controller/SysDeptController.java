package com.newbie.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.newbie.common.entity.SysDept;
import com.newbie.common.util.R;
import com.newbie.system.domain.vo.SysDeptVO;
import com.newbie.system.service.SysDeptService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/system/dept")
@RequiredArgsConstructor
public class SysDeptController {

    private final SysDeptService sysDeptService;

    @SaCheckPermission("sys.dept")
    @GetMapping("/tree")
    public R<List<SysDeptVO>> getDeptTree(SysDept sysDept) {
        return R.ok(sysDeptService.getDeptTree(sysDept));
    }

    @SaCheckPermission("sys.dept.add")
    @PostMapping("/add")
    public R<Object> addDept(@RequestBody SysDept sysDept) {
        Long deptId = sysDept.getId();
        if (deptId != null) {
            return R.error("请检查此数据是否已存在,deptId=" + deptId);
        }
        return sysDeptService.addDept(sysDept) ? R.ok().setMsg("新增成功") : R.error("新增失败");
    }

    @SaCheckPermission("sys.dept.update")
    @PostMapping("/update")
    public R<Object> updateDept(@RequestBody SysDept sysDept) {
        if (sysDept.getId() == null) {
            return R.error("部门ID为空");
        }
        return sysDeptService.updateDept(sysDept) ? R.ok().setMsg("修改成功") : R.error("修改失败");
    }

    @SaCheckPermission("sys.dept.del")
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody Long[] ids) {
        if (ids == null || ids.length == 0) return R.error("部门ID为空");
        sysDeptService.deleteBatch(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }
}
