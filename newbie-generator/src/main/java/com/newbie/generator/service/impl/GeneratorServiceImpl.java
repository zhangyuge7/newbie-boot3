package com.newbie.generator.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.newbie.generator.domain.ColumnInfo;
import com.newbie.generator.domain.GenConfigEntity;
import com.newbie.generator.domain.GenerateBody;
import com.newbie.generator.domain.TableInfo;
import com.newbie.generator.mapper.GenConfigMapper;
import com.newbie.generator.mapper.GeneratorMapper;
import com.newbie.generator.service.GeneratorService;
import com.newbie.generator.util.GeneratorUtils;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class GeneratorServiceImpl implements GeneratorService {
    private final GeneratorMapper generatorMapper;
    private final GenConfigMapper genConfigMapper;
    @SneakyThrows
    @Override
    public void generatorCode(GenerateBody generateBody, HttpServletResponse response) {
        response.reset();

        // 获取生成器配置
        GenConfigEntity genConfig = genConfigMapper.selectById(generateBody.getConfigId());

        // 获取表信息
        List<TableInfo> tableInfoList = new ArrayList<>();
        for (String tableName : generateBody.getTableNames()) {
            tableInfoList.add(this.getTableInfo(tableName));
        }

        // 生成代码
        GeneratorUtils.generate(tableInfoList,genConfig,response.getOutputStream());
    }

    /**
     * 获取表信息
     *
     * @param tableName  表名
     * @return TableInfo
     */
    private TableInfo getTableInfo(String tableName) {
        TableInfo tableInfo = generatorMapper.selectTableByName(tableName);
        List<ColumnInfo> columnInfoList = generatorMapper.selectColumnList(tableName);
        tableInfo.setColumns(columnInfoList);
        return tableInfo;
    }

    @Override
    public IPage<TableInfo> getDbTableList(IPage<TableInfo> page, TableInfo tableInfo) {
        return page.setRecords(generatorMapper.selectTableList(page,tableInfo));
    }
}
