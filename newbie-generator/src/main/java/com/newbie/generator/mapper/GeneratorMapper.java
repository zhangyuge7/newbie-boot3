package com.newbie.generator.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.newbie.generator.domain.ColumnInfo;
import com.newbie.generator.domain.TableInfo;
import jakarta.annotation.Nullable;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GeneratorMapper{
    /**
     * 查询所有表信息
     * @param page 分页信息
     * @param tableInfo 查询条件 名称
     * @return  List<TableInfo>
     */
    List<TableInfo> selectTableList(@Nullable IPage<TableInfo> page, TableInfo tableInfo);

    /**
     * 查询表信息
     * @param tableName 表名
     * @return TableInfo
     */
    TableInfo selectTableByName(@Param("tableName") String tableName);

    /**
     * 查询表字段信息
     * @param tableName 表名
     * @return List<ColumnInfo>
     */
    List<ColumnInfo> selectColumnList(@Param("tableName") String tableName);
}
