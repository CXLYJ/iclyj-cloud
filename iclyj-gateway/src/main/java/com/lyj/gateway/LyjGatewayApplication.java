package com.lyj.gateway;

import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/29
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })  //不加载数据源
public class LyjGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(LyjGatewayApplication.class, args);
        LoggerFactory.getLogger(LyjGatewayApplication.class).info(
                "《《《《《《 ROBOT started up successfully at {} {} 》》》》》》", LocalDate.now(), LocalTime.now());
        System.out.println("(♥◠‿◠)ﾉﾞ  网关模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" );
    }

}
