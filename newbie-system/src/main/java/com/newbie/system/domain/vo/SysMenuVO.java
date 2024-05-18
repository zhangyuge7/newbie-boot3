package com.newbie.system.domain.vo;

import com.newbie.common.domain.entity.SysMenu;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class SysMenuVO extends SysMenu {
    private List<SysMenuVO> children;
}
