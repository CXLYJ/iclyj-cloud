package com.lyj.common.security.feign;

import feign.RequestInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/27
 *
 * Feign配置注册
 */
@Configuration
public class OAuth2FeignConfig
{
    @Bean
    public RequestInterceptor requestInterceptor()
    {
        return new OAuth2FeignRequestInterceptor();
    }
}
