package com.newbie.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.newbie.common.domain.entity.SysRole;

import java.util.List;

/**
 * @author 39869
 * @description 针对表【sys_role(角色表)】的数据库操作Service
 * @createDate 2024-04-16 15:30:47
 */
public interface SysRoleService extends IService<SysRole> {

    /**
     * 批量删除
     * @param idList ID列表
     */
    void deleteBatch(List<String> idList);
}
