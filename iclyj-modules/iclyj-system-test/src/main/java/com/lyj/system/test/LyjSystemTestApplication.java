package com.lyj.system.test;

import com.lyj.common.security.annotation.EnableCustomConfig;
import com.lyj.common.security.annotation.EnableLyjFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/29
 */
@EnableCustomConfig
@SpringCloudApplication
public class LyjSystemTestApplication {

    public static void main(String[] args) {
        SpringApplication.run(LyjSystemTestApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  系统测试模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" );
    }
}
