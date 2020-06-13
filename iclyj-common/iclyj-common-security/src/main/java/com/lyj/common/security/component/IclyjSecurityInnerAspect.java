package com.lyj.common.security.component;

import cn.hutool.core.util.StrUtil;
import com.lyj.common.core.constant.SecurityConstants;
import com.lyj.common.security.config.IclyjInner;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.Ordered;
import org.springframework.security.access.AccessDeniedException;

import javax.servlet.http.HttpServletRequest;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/6/13 13:58
 *
 * 服务间接口不鉴权处理逻辑
 */

@Slf4j
@Aspect
@RequiredArgsConstructor
public class IclyjSecurityInnerAspect implements Ordered {
    private final HttpServletRequest request;

    @SneakyThrows
    @Around("@annotation(iclyjInner)")
    public Object around(ProceedingJoinPoint point, IclyjInner iclyjInner) {
        String header = request.getHeader(SecurityConstants.FROM);
        if (iclyjInner.value() && !StrUtil.equals(SecurityConstants.FROM_IN, header)) {
            log.warn("访问接口 {} 没有权限", point.getSignature().getName());
            throw new AccessDeniedException("Access is denied");
        }
        return point.proceed();
    }

    @Override
    public int getOrder() {
        return Ordered.HIGHEST_PRECEDENCE + 1;
    }
}
