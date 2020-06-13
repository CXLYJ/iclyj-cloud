package com.lyj.gateway.config;

import com.lyj.gateway.handler.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.server.RequestPredicates;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/6/5
 *
 * 路由配置信息
 */
@Configuration
public class RouterFunctionConfiguration
{
    @Autowired
    private HystrixFallbackHandler hystrixFallbackHandler;

    @Autowired
    private ValidateCodeHandler validateCodeHandler;
    @Autowired
    private  SwaggerResourceHandler swaggerResourceHandler;
    @Autowired
    private  SwaggerSecurityHandler swaggerSecurityHandler;
    @Autowired
    private  SwaggerUiHandler swaggerUiHandler;

    @SuppressWarnings("rawtypes")
    @Bean
    public RouterFunction routerFunction()
    {
        return RouterFunctions
                // 路由熔断返回信息
                .route(RequestPredicates.path("/fallback")
                         .and(RequestPredicates.accept(MediaType.TEXT_PLAIN)),hystrixFallbackHandler)
                // 路由验正码生成接口
                .andRoute(RequestPredicates.GET("/code")
                        .and(RequestPredicates.accept(MediaType.TEXT_PLAIN)),validateCodeHandler)
                .andRoute(RequestPredicates.GET("/swagger-resources")
                        .and(RequestPredicates.accept(MediaType.ALL)), swaggerResourceHandler)
                .andRoute(RequestPredicates.GET("/swagger-resources/configuration/ui")
                        .and(RequestPredicates.accept(MediaType.ALL)), swaggerUiHandler)
                .andRoute(RequestPredicates.GET("/swagger-resources/configuration/security")
                        .and(RequestPredicates.accept(MediaType.ALL)), swaggerSecurityHandler);
    }

}
