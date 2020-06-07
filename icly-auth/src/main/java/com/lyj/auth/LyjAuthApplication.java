package com.lyj.auth;

import com.lyj.common.security.annotation.EnableLyjFeignClients;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/27
 */
@EnableLyjFeignClients
@SpringCloudApplication
public class LyjAuthApplication {

    public static void main(String[] args)
    {
        SpringApplication.run(LyjAuthApplication.class, args);
        LoggerFactory.getLogger(LyjAuthApplication.class).info(
                "《《《《《《 ROBOT started up successfully at {} {} 》》》》》》", LocalDate.now(), LocalTime.now());
        System.out.println("(♥◠‿◠)ﾉﾞ  认证授权中心启动成功   ლ(´ڡ`ლ)ﾞ ");
    }

}
