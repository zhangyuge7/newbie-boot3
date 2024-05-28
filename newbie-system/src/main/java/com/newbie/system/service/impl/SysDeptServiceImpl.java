package com.newbie.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.newbie.common.domain.entity.SysDept;
import com.newbie.common.exception.NewbieException;
import com.newbie.common.util.TreeUtils;
import com.newbie.system.domain.vo.SysDeptVO;
import com.newbie.system.service.SysDeptService;
import com.newbie.system.mapper.SysDeptMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
* @author 39869
* @description 针对表【sys_dept(部门表)】的数据库操作Service实现
* @createDate 2024-04-16 23:21:27
*/
@Service
@RequiredArgsConstructor
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept>
    implements SysDeptService{
    private final SysDeptMapper sysDeptMapper;

    @Override
    public List<SysDeptVO> getDeptTree(SysDept sysDept) {
        // 查询数据
        List<SysDept> list = this.lambdaQuery()
                .like(StringUtils.hasLength(sysDept.getDeptName()), SysDept::getDeptName, sysDept.getDeptName())
                .like(StringUtils.hasLength(sysDept.getLeader()), SysDept::getLeader, sysDept.getLeader())
                .like(StringUtils.hasLength(sysDept.getPhone()), SysDept::getPhone, sysDept.getPhone())
                .eq(StringUtils.hasLength(sysDept.getStatus()), SysDept::getStatus, sysDept.getStatus())
                .orderByAsc(SysDept::getSort)
                .list();
        // 对象转换
        List<SysDeptVO> tree = new ArrayList<>();
        SysDeptVO target;
        for (SysDept source : list) {
            target = new SysDeptVO();
            BeanUtils.copyProperties(source, target);
            tree.add(target);
        }

        // 组装树结构并返回数据
        return TreeUtils.listToTree(
                tree,
                SysDeptVO::getId,
                SysDeptVO::getParentId,
                SysDeptVO::getChildren,
                SysDeptVO::setChildren
        );
    }

    @Override
    @Transactional
    public boolean addDept(SysDept sysDept){
        this.verifyDeptData(sysDept);

        // 执行新增
        int insertCount = sysDeptMapper.insert(sysDept);
        // 获取父级部门
        SysDept parentDept =
                lambdaQuery()
                        .eq(SysDept::getId, sysDept.getParentId())
                        .one();

        // 祖籍赋值
        sysDept.setAncestors(
                parentDept == null
                        ? String.valueOf(sysDept.getId())
                        : parentDept.getAncestors() + "," + sysDept.getId()
        );
        // 层级赋值
        sysDept.setTier(sysDept.getAncestors().split(",").length);
        // 执行修改
        int updateCount = sysDeptMapper.updateById(sysDept);
        return insertCount == 1 && updateCount == 1;

    }

    @Override
    @Transactional
    public boolean updateDept(SysDept sysDept){
        this.verifyDeptData(sysDept);
        // 检查是否修改节点位置
        SysDept rawDept = sysDeptMapper.selectById(sysDept.getId());
        if (!Objects.equals(rawDept.getParentId(),sysDept.getParentId())) {
            throw new NewbieException("不允许修改节点位置");
        }

        // 执行修改
        return sysDeptMapper.updateById(sysDept) == 1;
    }

    @Override
    @Transactional
    public void deleteBatch(List<Long> idList) {
        if (sysDeptMapper.selectCount(new LambdaQueryWrapper<SysDept>()
                .in(SysDept::getParentId, idList)
                .notIn(SysDept::getId,idList)) > 0) {
            throw new NewbieException("请先删除子部门后再次尝试");
        }
        sysDeptMapper.deleteBatchIds(idList);
    }

    private void verifyDeptData(SysDept sysDept){
        if (!StringUtils.hasLength(sysDept.getDeptName())) throw new NewbieException("部门名称为空");
        if (Objects.isNull(sysDept.getParentId())) throw new NewbieException("父级部门ID为空");
    }

}




