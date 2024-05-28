package com.newbie.system.service;

import com.newbie.common.domain.entity.SysDept;
import com.baomidou.mybatisplus.extension.service.IService;
import com.newbie.system.domain.vo.SysDeptVO;

import java.util.List;

/**
* @author 39869
* @description 针对表【sys_dept(部门表)】的数据库操作Service
* @createDate 2024-04-16 23:21:27
*/
public interface SysDeptService extends IService<SysDept> {

    /**
     * 查询部门树，当 deptId 有值时，仅查询该部门及子部门
     * @param sysDept 查询筛选条件参数
     * @return
     */
    List<SysDeptVO> getDeptTree(SysDept sysDept);


    /**
     * 新增部门
     * @param sysDept 部门数据
     * @return 是否成功
     */
    boolean addDept(SysDept sysDept);

    /**
     * 修改部门
     * @param sysDept 部门数据
     * @return 是否成功
     */
    boolean updateDept(SysDept sysDept);

    /**
     * 批量删除部门
     * @param idList 部门ID列表
     */
    void deleteBatch(List<String> idList);
}
