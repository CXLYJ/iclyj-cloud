package com.lyj.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/29
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })  //不加载数据源
public class LyjGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(LyjGatewayApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  网关模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" );
    }

}
