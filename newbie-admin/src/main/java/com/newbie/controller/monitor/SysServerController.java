package com.newbie.controller.monitor;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.map.MapBuilder;
import com.newbie.common.domain.DisksInfo;
import com.newbie.common.domain.JvmInfo;
import com.newbie.common.domain.NetworkInfo;
import com.newbie.common.domain.OSRuntimeInfo;
import com.newbie.common.util.R;
import com.newbie.common.util.SystemInfoUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.SneakyThrows;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
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

    @SneakyThrows
    @Operation(summary = "获取系统服务器信息")
    @SaCheckPermission("sys.monitor.server")
    @GetMapping
    public R<Map<String, Object>> getInfo() {
        Map<String, Object> resultMap = new HashMap<>();
        // JVM信息
        JvmInfo jvmInfo = SystemInfoUtil.getJvmInfo();

        long totalJvmMemory = jvmInfo.getTotal();
        long freeJvmMemory = jvmInfo.getFree();
        long usedJvmMemory = totalJvmMemory - freeJvmMemory;
        double usageJvmMemory = usedJvmMemory * 1.0 / totalJvmMemory;

        resultMap.put("jvmInfo",
                MapBuilder.create()
                        .put("total", SystemInfoUtil.formatData(jvmInfo.getTotal())) // 当前JVM占用的内存总数
                        .put("max", SystemInfoUtil.formatData(jvmInfo.getMax())) // JVM最大可用内存总数
                        .put("free", SystemInfoUtil.formatData(jvmInfo.getFree())) // JVM空闲内存
                        .put("used", SystemInfoUtil.formatData(usedJvmMemory)) // JVM已用内存
                        .put("usage", SystemInfoUtil.formatRate(usageJvmMemory)) // JVM内存使用率
                        .put("jdkVersion", jvmInfo.getVersion()) // JDK版本
                        .put("jdkHome", jvmInfo.getHome()) // JDK路径
                        .build()
        );
        // 系统信息
        resultMap.put("osInfo", SystemInfoUtil.getSystemInfo());
        // 运行时信息
        OSRuntimeInfo osRuntimeInfo = SystemInfoUtil.getOSRuntimeInfo();
        // 1.CPU信息
        resultMap.put("cpuInfo",
                MapBuilder.create()
                        .put("cpuUsage", SystemInfoUtil.formatRate(osRuntimeInfo.getCpuUsage())) //cpu使用率
                        .put("cpuMaxFreq", osRuntimeInfo.getCpuMaxFreq()) // cpu基准速度
                        .put("cpuCurrentFreq", osRuntimeInfo.getCpuCurrentFreq()) // cpu速度
                        .build()
        );
        // 2.内存信息
        // (1系统内存
        long total = osRuntimeInfo.getTotalMemory();
        long used = osRuntimeInfo.getUsedMemory();
        double usage = used * 1.0 / total;
        resultMap.put("systemMemory",
                MapBuilder.create()
                        .put("total",SystemInfoUtil.formatData(total)) // 系统内存总量
                        .put("used",SystemInfoUtil.formatData(used)) // 系统内存使用量
                        .put("usage",SystemInfoUtil.formatRate(usage)) // 系统内存使用率
                        .build()
        );
        // (2虚拟内存
        resultMap.put("swapMemory",
                MapBuilder.create()
                        .put("total",SystemInfoUtil.formatData(osRuntimeInfo.getSwapTotalMemory())) // 可用虚拟总内存(swap)
                        .put("used",SystemInfoUtil.formatData(osRuntimeInfo.getSwapUsedMemory())) // 虚拟内存使用量(swap)
                        .build()
        );
        // 3.磁盘信息
        List<Map<String,Object>> disksMapList = new ArrayList<>();
        for (DisksInfo disksInfo : osRuntimeInfo.getDisksList()) {
            disksMapList.add(
                    MapBuilder.<String,Object>create()
                            .put("dirName",disksInfo.getDirName()) // 挂载点
                            .put("sysTypeName",disksInfo.getSysTypeName()) // 文件系统名称
                            .put("typeName",disksInfo.getTypeName()) // 文件系统类型
                            .put("total",SystemInfoUtil.formatData(disksInfo.getTotal())) // 磁盘总量
                            .put("used",SystemInfoUtil.formatData(disksInfo.getUsed())) // 磁盘使用量
                            .put("free",SystemInfoUtil.formatData(disksInfo.getFree())) // 磁盘剩余量
                            .put("usage",SystemInfoUtil.formatRate(disksInfo.getUsage())) // 磁盘使用率
                            .build()
            );
        }
        resultMap.put("disksInfo",
                MapBuilder.create()
                        .put("diskReadRate",osRuntimeInfo.getDiskReadRate() + "Kb/s") // 磁盘读取速度(Kb/s)
                        .put("diskWriteRate",osRuntimeInfo.getDiskWriteRate() + "Kb/s") // 磁盘写入速度(Kb/s)
                        .put("disksList",disksMapList)
                        .build()
        );

        // 4.网卡网络信息
        List<Map<String,Object>> networkInfoMapList = new ArrayList<>();
        for (NetworkInfo networkInfo : SystemInfoUtil.getNetworkInfo()) {
            double send = networkInfo.getSend() / 1024.0;
            double accept = networkInfo.getAccept() / 1024.0;
            networkInfoMapList.add(
                    MapBuilder.<String,Object>create()
                            .put("ipv4Address",networkInfo.getIpv4Address()) // ipv4地址
                            .put("macAddress",networkInfo.getMacAddress()) // mac地址
                            .put("networkName",networkInfo.getNetworkName()) // 网卡名称
                            .put("send",String.format("%.1f%s", send, "Kbps")) // 上传速度↑
                            .put("accept",String.format("%.1f%s", accept, "Kbps")) // 下载速度↓
                            .build()
            );
        }
        resultMap.put("networkInfoList",networkInfoMapList);
        return R.ok(resultMap);
    }
}
