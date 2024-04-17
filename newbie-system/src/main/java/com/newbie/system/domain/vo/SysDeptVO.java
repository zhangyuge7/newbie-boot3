package com.newbie.system.domain.vo;

import com.newbie.common.entity.SysDept;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;


@EqualsAndHashCode(callSuper = true)
@Data
public class SysDeptVO extends SysDept {

    /** 子节点 */
    private List<SysDeptVO> children;
}
