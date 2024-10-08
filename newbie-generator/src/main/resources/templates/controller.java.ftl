package ${package.controller};

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import ${package.service}.I${Entity}Service;
import ${package.entity}.${Entity}Entity;
import com.newbie.common.util.R;
import lombok.RequiredArgsConstructor;
<#if gc.springDoc>
import io.swagger.v3.oas.annotations.Operation;
</#if>
<#if gc.apiAuth>
import cn.dev33.satoken.annotation.SaCheckPermission;
</#if>
import org.springframework.web.bind.annotation.*;
import java.io.Serializable;
import java.util.List;

/**
* Created by NewbieGenerator.
*
* @Author: ${gc.author}
* @Email ${gc.email}
* @Date: ${gc.date}
* @Descriptions: ${comment!} Api 接口
*/
@RestController
@RequestMapping("${apiPath.parent}")
@RequiredArgsConstructor
<#if gc.springDoc>
@Tag(name = "${comment!}")
</#if>
public class ${Entity}Controller {

    private final I${Entity}Service i${Entity}Service;

<#if gc.springDoc>
    @Operation(summary ="分页查询数据列表")
</#if>
<#if gc.apiAuth>
    @SaCheckPermission("${gc.moduleName}.${entity}.list")
</#if>
    @GetMapping("/page")
    public R<IPage<${Entity}Entity>> page(Page<${Entity}Entity> page, ${Entity}Entity entity) {
        return R.ok(i${Entity}Service.getPage(page,entity));
    }

<#if gc.springDoc>
    @Operation(summary ="查询数据列表")
</#if>
<#if gc.apiAuth>
    @SaCheckPermission("${gc.moduleName}.${entity}.list")
</#if>
    @GetMapping("/list")
    public R<List<${Entity}Entity>> list(${Entity}Entity entity) {
       return R.ok(i${Entity}Service.getList(entity));
   }

<#if gc.springDoc>
    @Operation(summary ="新增数据")
</#if>
<#if gc.apiAuth>
    @SaCheckPermission("${gc.moduleName}.${entity}.add")
</#if>
    @PostMapping("/addData")
    public R<Object> addData(@RequestBody ${Entity}Entity entity) {
        i${Entity}Service.addData(entity);
        return R.ok();
    }

<#if gc.springDoc>
    @Operation(summary ="根据主键更新数据")
</#if>
<#if gc.apiAuth>
    @SaCheckPermission("${gc.moduleName}.${entity}.update")
</#if>
    @PostMapping("/updateByPkVal")
    public R<Object> updateByPkVal(@RequestBody ${Entity}Entity entity) {
        i${Entity}Service.updateById(entity);
        return R.ok();
     }
        <#if gc.springDoc>
    @Operation(summary ="根据主键删除数据")
        </#if>
        <#if gc.apiAuth>
    @SaCheckPermission("${gc.moduleName}.${entity}.delete")
        </#if>
    @PostMapping("/deleteByPkVal/{${pkey.name}}")
    public R<Object> deleteByPkVal(@PathVariable Serializable ${pkey.name}) {
        i${Entity}Service.deleteByPkVal(${pkey.name});
        return R.ok();
    }
}