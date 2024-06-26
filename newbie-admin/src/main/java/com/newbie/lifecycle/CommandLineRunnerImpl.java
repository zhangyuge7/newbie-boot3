package com.newbie.lifecycle;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.web.embedded.tomcat.TomcatWebServer;
import org.springframework.boot.web.server.WebServer;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import java.net.InetAddress;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/17 下午4:28
 * @Descriptions: unknown
 */
@Component
@RequiredArgsConstructor
public class CommandLineRunnerImpl implements CommandLineRunner {
    private final Environment environment;

    @Override
    public void run(String... args) throws Exception {

        String ip = InetAddress.getLocalHost().getHostAddress();
        String port = environment.getProperty("server.port");
        String property = environment.getProperty("server.servlet.context-path");
        String path = property == null ? "" : property;

        String appName = environment.getProperty("spring.application.name");
        String name = appName == null ? "" : appName;

        String swaggerPath =  path.endsWith("/") ? "swagger-ui/index.html" : "/swagger-ui/index.html";
        String knife4jPath =  path.endsWith("/") ? "doc.html" : "/doc.html";

        System.out.printf("\n\t\t\t\t\t\t\u001B[%d;%dm%s\u001B[0m%n", 32, 2, "欢迎使用 NewbieBoot");
        String content1 = """
                ----------------------------------------------------------------------
                    Application %s is running! Access URLs:
                    Local:  http://localhost:%s%s
                    External: http://%s:%s%s
                    Swagger: http://localhost:%s%s%s
                    Knife4j: http://localhost:%s%s%s
                ----------------------------------------------------------------------
                """;
        System.out.printf("\u001B[%d;%dm%s\u001B[0m%n", 32, 2, String.format(content1, name, port, path, ip, port, path, port, path, swaggerPath, port, path, knife4jPath));

    }
}
