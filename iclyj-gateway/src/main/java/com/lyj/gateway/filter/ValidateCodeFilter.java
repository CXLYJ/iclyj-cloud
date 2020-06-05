package com.lyj.gateway.filter;

import com.alibaba.fastjson.JSON;
import com.lyj.common.core.exception.CheckedException;
import com.lyj.common.core.utils.StringUtils;
import com.lyj.common.core.web.domain.AjaxResult;
import com.lyj.gateway.config.properties.IgnoreClientProperties;
import com.lyj.gateway.service.ValidateCodeService;
import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.util.WebUtils;
import reactor.core.publisher.Mono;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;

/**
 * 验证码过滤器
 * 
 * @author ruoyi
 */
@Component
public class ValidateCodeFilter extends AbstractGatewayFilterFactory<Object>
{
    private final static String AUTH_URL = "/oauth/token";

    private static final String BASIC_ = "Basic ";

    @Autowired
    private IgnoreClientProperties ignoreClient;

    @Autowired
    private ValidateCodeService validateCodeService;

    @Override
    public GatewayFilter apply(Object config)
    {
        return (exchange, chain) -> {
            ServerHttpRequest request = exchange.getRequest();

            // 非登录请求，直接向下执行
            if (!StringUtils.containsIgnoreCase(request.getURI().getPath(), AUTH_URL))
            {
                return chain.filter(exchange);
            }
            try
            {
                // 对swagger认证授权中对指定的client_id放行
                String[] clientInfos = this.getClientId(request);
                if (ignoreClient.getClients().contains(clientInfos[0]))
                {
                    return chain.filter(exchange);
                }
                validateCodeService.checkCapcha(request.getQueryParams());
            }
            catch (Exception e)
            {
                ServerHttpResponse response = exchange.getResponse();
                return exchange.getResponse().writeWith(
                        Mono.just(response.bufferFactory().wrap(JSON.toJSONBytes(AjaxResult.error(e.getMessage())))));
            }
            return chain.filter(exchange);
        };
    }


    /**
     * 从request 获取CLIENT_ID
     *
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String[] getClientId(ServerHttpRequest request) throws UnsupportedEncodingException
    {
        String header = request.getHeaders().getFirst(HttpHeaders.AUTHORIZATION);

        if (header == null || !header.startsWith(BASIC_))
        {
            throw new CheckedException("请求头中client信息为空");
        }
        byte[] base64Token = header.substring(6).getBytes("UTF-8");
        byte[] decoded;
        try
        {
            decoded = Base64.decode(base64Token);
        }
        catch (IllegalArgumentException e)
        {
            throw new CheckedException("Failed to decode basic authentication token");
        }

        String token = new String(decoded, StandardCharsets.UTF_8);

        int delim = token.indexOf(":");

        if (delim == -1)
        {
            throw new CheckedException("Invalid basic authentication token");
        }
        return new String[] { token.substring(0, delim), token.substring(delim + 1) };
    }

}
