package com.newbie.system.domain.vo;

import com.newbie.common.entity.SysDept;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author scj
 * @version java version 1.8
 * @since 2023-08-13 23:01
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysDeptVO extends SysDept {

    /** 子节点 */
    private List<SysDeptVO> children;
}
