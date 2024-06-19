package ${package.Controller};

<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>
<#if enableApiAuth>
import cn.dev33.satoken.annotation.SaCheckPermission;
</#if>
<#if springdoc>
import io.swagger.v3.oas.annotations.Operation;
</#if>
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.RequiredArgsConstructor;
<#if springdoc>
import io.swagger.v3.oas.annotations.tags.Tag;
</#if>
import ${package.Service}.${table.serviceName};
import ${package.Entity}.${table.entityName};
import com.newbie.common.util.R;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.Arrays;

import org.springframework.web.bind.annotation.*;

/**
 * Created by NewbieGenerator.
 *
 * @Author: ${author}
 * @Email ${email}
 * @Date: ${date}
 * @Descriptions: ${table.comment!} 前端控制器
 */
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("/${package.ModuleName}/${controllerMappingHyphen}")
@RequiredArgsConstructor
<#if springdoc>
@Tag(name = "${table.comment!} 前端控制器")
</#if>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

    private final ${table.serviceName} ${controllerMappingHyphen}Service;

<#if springdoc>
    @Operation(summary ="查询分页数据")
</#if>
<#if enableApiAuth>
    @SaCheckPermission("${package.ModuleName}.${controllerMappingHyphen}")
</#if>
    @GetMapping("/paging")
    public R<IPage<${table.entityName}>> paging(Page<${table.entityName}> page, ${table.entityName} entity) {
      Page<${table.entityName}> pageInfo = ${controllerMappingHyphen}Service
               .lambdaQuery()
                // TODO 这里添加查询过滤条件
               .page(page);
       return R.ok(pageInfo);
   }

<#if springdoc>
    @Operation(summary ="新增")
</#if>
<#if enableApiAuth>
    @SaCheckPermission("${package.ModuleName}.${controllerMappingHyphen}.add")
</#if>
    @PostMapping("/add")
    public R<Object> add(@RequestBody ${table.entityName} entity) {
        ${controllerMappingHyphen}Service.save(entity);
        return R.ok().setMsg("添加成功");
    }

<#if springdoc>
    @Operation(summary ="修改")
</#if>
<#if enableApiAuth>
    @SaCheckPermission("${package.ModuleName}.${controllerMappingHyphen}.update")
</#if>
    @PostMapping("/update")
    public R<Object> update(@RequestBody ${table.entityName} entity) {
        if (entity.${pkValue.getMethod}() == null) {
            return R.error("ID为空");
        }
        // 修改数据
        ${controllerMappingHyphen}Service.updateById(entity);
        return R.ok().setMsg("修改成功");
     }

<#if springdoc>
    @Operation(summary ="批量删除")
</#if>
<#if enableApiAuth>
    @SaCheckPermission("${package.ModuleName}.${controllerMappingHyphen}.del")
</#if>
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody String[] ids) {
        if (ids == null || ids.length == 0) return R.error("ID为空");
        ${controllerMappingHyphen}Service.removeBatchByIds(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }
}