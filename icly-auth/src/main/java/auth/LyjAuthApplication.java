package auth;

import com.lyj.common.security.annotation.EnableLyjFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

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
        System.out.println("(♥◠‿◠)ﾉﾞ  认证授权中心启动成功   ლ(´ڡ`ლ)ﾞ");
    }

}
