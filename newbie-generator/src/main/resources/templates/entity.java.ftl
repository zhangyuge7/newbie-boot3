package ${package.entity};

<#list entityImportPackages as pkg>
import ${pkg};
</#list>

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * Created by NewbieGenerator.
 *
 * @Author: ${gc.author}
 * @Email ${gc.email}
 * @Date: ${gc.date}
 * @Descriptions: ${comment!} 实体类
 */
@TableName(value = "${tableName}")
@Data
public class ${Entity}Entity implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
<#list fields as field>
    <#if field.pk>
    @TableId(type = IdType.ASSIGN_ID)
    </#if>
    private ${field.type} ${field.name}; // ${field.comment!}
</#list>

}
