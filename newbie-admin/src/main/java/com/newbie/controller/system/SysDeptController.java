package com.newbie.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.newbie.common.domain.entity.SysDept;
import com.newbie.common.util.R;
import com.newbie.system.domain.vo.SysDeptVO;
import com.newbie.system.service.SysDeptService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/system/dept")
@RequiredArgsConstructor
@Tag(name = "部门管理")
public class SysDeptController {

    private final SysDeptService sysDeptService;

    @Operation(summary ="获取部门树")
    @SaCheckPermission("sys.dept")
    @GetMapping("/tree")
    public R<List<SysDeptVO>> getDeptTree(SysDept sysDept) {
        return R.ok(sysDeptService.getDeptTree(sysDept));
    }

    @Operation(summary ="新增部门")
    @SaCheckPermission("sys.dept.add")
    @PostMapping("/add")
    public R<Object> addDept(@RequestBody SysDept sysDept) {
        String deptId = sysDept.getId();
        if (deptId != null) {
            return R.error("请检查此数据是否已存在,deptId=" + deptId);
        }
        return sysDeptService.addDept(sysDept) ? R.ok().setMsg("新增成功") : R.error("新增失败");
    }

    @Operation(summary ="修改部门")
    @SaCheckPermission("sys.dept.update")
    @PostMapping("/update")
    public R<Object> updateDept(@RequestBody SysDept sysDept) {
        if (sysDept.getId() == null) {
            return R.error("部门ID为空");
        }
        return sysDeptService.updateDept(sysDept) ? R.ok().setMsg("修改成功") : R.error("修改失败");
    }

    @Operation(summary ="批量删除部门")
    @SaCheckPermission("sys.dept.del")
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody String[] ids) {
        if (ids == null || ids.length == 0) return R.error("部门ID为空");
        sysDeptService.deleteBatch(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }
}
