package com.newbie.generator.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.newbie.generator.domain.GenerateBody;
import com.newbie.generator.domain.TableInfo;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

/**
 * 代码生成器服务接口
 */
public interface GeneratorService {
    void generatorCode(GenerateBody generateBody, HttpServletResponse response);
    IPage<TableInfo> getDbTableList(IPage<TableInfo> page,TableInfo tableInfo);
}
