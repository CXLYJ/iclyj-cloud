package com.lyj.common.security.handler;

import com.lyj.common.core.utils.StringUtils;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.Authentication;

/**
 * 认证成功事件处理器模块
 * 
 * @author ruoyi
 */
public abstract class AbstractAuthenticationSuccessEventHandler
        implements ApplicationListener<AuthenticationSuccessEvent>
{
    @Override
    public void onApplicationEvent(AuthenticationSuccessEvent event)
    {
        Authentication authentication = (Authentication) event.getSource();
        if (StringUtils.isNotEmpty(authentication.getAuthorities()))
        {
            handle(authentication);
        }
    }

    /**
     * 处理登录成功方法
     */
    public abstract void handle(Authentication authentication);
}
