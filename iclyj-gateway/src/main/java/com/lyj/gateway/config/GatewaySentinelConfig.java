package com.lyj.gateway.config;

import com.alibaba.csp.sentinel.adapter.gateway.sc.SentinelGatewayFilter;
import com.lyj.gateway.handler.SentinelFallbackHandler;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/6/21 10:34
 *
 * 网关限流配置
 */
@Configuration
public class GatewaySentinelConfig {

    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public SentinelFallbackHandler sentinelGatewayExceptionHandler(){
        return new SentinelFallbackHandler();
    }

    @Bean
    @Order(-1)
    public GlobalFilter sentinelGatewayGlobalFilter()
    {
        return new SentinelGatewayFilter();
    }

}
