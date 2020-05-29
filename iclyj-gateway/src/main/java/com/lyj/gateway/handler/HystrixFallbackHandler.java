package com.lyj.gateway.handler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.HandlerFunction;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/29
 *
 * 熔断降级处理
 */
@Component
@Slf4j
public class HystrixFallbackHandler implements HandlerFunction<ServerResponse> {



    @Override
    public Mono<ServerResponse> handle(ServerRequest serverRequest) {
        return null;
    }
}
