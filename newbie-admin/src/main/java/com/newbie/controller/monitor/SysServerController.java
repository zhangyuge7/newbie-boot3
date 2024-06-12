package com.newbie.controller.monitor;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.system.SystemUtil;
import cn.hutool.system.oshi.CpuInfo;
import cn.hutool.system.oshi.OshiUtil;
import com.newbie.common.util.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HWDiskStore;

import java.lang.management.MemoryUsage;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/5/31 下午4:03
 * @Descriptions: 服务器信息
 */
@RestController
@RequestMapping("/monitor/server")
@Tag(name = "服务器信息监控")
public class SysServerController {

    @Operation(summary = "获取系统服务器信息")
    @SaCheckPermission("sys.monitor.server")
    @GetMapping
    public R<Map<String, Object>> getInfo() {
        Map<String, Object> resultMap = new HashMap<>();

        GlobalMemory memory = OshiUtil.getMemory();
        CpuInfo cpuInfo = OshiUtil.getCpuInfo();
        List<HWDiskStore> diskStores = OshiUtil.getDiskStores();
        // 占用情况
        resultMap.put("memoryRatio", this.getMemoryRatio(memory)); // 内存已用百分比
        resultMap.put("cpuRatio", this.getCpuRatio(cpuInfo)); // cpu已用百分比
        resultMap.put("diskRatio", this.getDiskRatio(diskStores)); // 磁盘已用百分比
        resultMap.put("jvmMemoryRatio", this.getJvmMemoryRatio(SystemUtil.getMemoryMXBean().getHeapMemoryUsage())); // jvm内存已用百分比

        // 服务器信息
        resultMap.put("osArch", SystemUtil.getOsInfo().getArch()); // 系统架构
        resultMap.put("osName", SystemUtil.getOsInfo().getName()); // 系统名称
        resultMap.put("hostAddr", SystemUtil.getHostInfo().getAddress()); // 主机地址
        // jvm信息
        resultMap.put("jvmName", SystemUtil.getJvmInfo().getName()); // jvm名称
        resultMap.put("jvmVersion", SystemUtil.getJvmInfo().getVersion()); // jvm版本

        // java信息
        resultMap.put("javaVersion", SystemUtil.getJavaInfo().getVersion()); // java版本
        resultMap.put("javaVendor", SystemUtil.getJavaInfo().getVendor()); // java供应商

        return R.ok(resultMap);
    }

    /**
     * 获取jvm内存使用率
     * @param heapMemoryUsage
     * @return
     */
    private double getJvmMemoryRatio(MemoryUsage heapMemoryUsage) {
        return BigDecimal.valueOf((double) heapMemoryUsage.getUsed() / heapMemoryUsage.getInit() * 100)
                .setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    /**
     * 获取内存使用率
     *
     * @param memory
     * @return
     */
    private double getMemoryRatio(GlobalMemory memory) {
        double memoryAvailableRatio = (double) memory.getAvailable() / memory.getTotal() * 100;
        return BigDecimal.valueOf(100 - memoryAvailableRatio)
                .setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    /**
     * 获取cpu使用率
     *
     * @param cpuInfo
     * @return
     */
    private double getCpuRatio(CpuInfo cpuInfo) {
        return BigDecimal.valueOf(100 - cpuInfo.getFree())
                .setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    /**
     * 获取磁盘使用率
     *
     * @param diskStores
     * @return
     */
    private Object getDiskRatio(List<HWDiskStore> diskStores) {
        long total = 0;
        long writeBytes = 0;

        for (HWDiskStore diskStore : diskStores) {
            total += diskStore.getSize();
            writeBytes += diskStore.getWriteBytes();
        }
        return BigDecimal.valueOf((double) writeBytes / total * 100)
                .setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    private String getSize(long size) {
        long GB = 1024 * 1024 * 1024;
        long MB = 1024 * 1024;
        long KB = 1024;
        DecimalFormat df = new DecimalFormat("0.00");
        String resultSize;
        if (size / GB >= 1) {
            resultSize = df.format(size / (float) GB) + "GB";
        } else if (size / MB >= 1) {
            resultSize = df.format(size / (float) MB) + "MB";
        } else if (size / KB >= 1) {
            resultSize = df.format(size / (float) KB) + "KB";
        } else {
            resultSize = size + "B";
        }
        return resultSize;
    }
}
