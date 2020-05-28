package com.lyj.common.security.handler;

import com.alibaba.fastjson.JSON;
import com.lyj.common.core.constant.HttpStatus;
import com.lyj.common.core.domain.R;
import com.lyj.common.core.utils.ServletUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.oauth2.provider.error.OAuth2AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/27
 */
@Component
public class CustomAccessDeniedHandler extends OAuth2AccessDeniedHandler
{
    private final Logger logger = LoggerFactory.getLogger(CustomAccessDeniedHandler.class);

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException authException)
    {
        logger.info("权限不足，请联系管理员 {}", request.getRequestURI());

        String msg = authException.getMessage();
        ServletUtils.renderString(response, JSON.toJSONString(R.failed(HttpStatus.FORBIDDEN, msg)));
    }
}
