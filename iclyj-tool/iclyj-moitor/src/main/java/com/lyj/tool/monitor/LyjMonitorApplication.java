package com.lyj.tool.monitor;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.SpringCloudApplication;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/6/7
 *
 * 监控中心启动
 */
@EnableAdminServer
//@SpringCloudApplication //当前版本如果使用次注解则需要引入jar包{spring-cloud-starter-netflix-hystrix}
@SpringBootApplication
public class LyjMonitorApplication {

    public static void main(String[] args) {
        SpringApplication.run(LyjMonitorApplication.class, args);
        LoggerFactory.getLogger(LyjMonitorApplication.class).info(
                "《《《《《《 ROBOT started up successfully at {} {} 》》》》》》", LocalDate.now(), LocalTime.now());
        System.out.println("(♥◠‿◠)ﾉﾞ  监控中心启动成功   ლ(´ڡ`ლ)ﾞ " );
    }

}
