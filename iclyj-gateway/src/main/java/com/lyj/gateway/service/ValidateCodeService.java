package com.lyj.gateway.service;

import com.lyj.common.core.exception.CaptchaException;
import com.lyj.common.core.web.domain.AjaxResult;
import org.springframework.util.MultiValueMap;

import java.io.IOException;

/**
 * 验证码处理
 * 
 * @author ruoyi
 */
public interface ValidateCodeService
{
    /**
     * 生成验证码
     */
    public AjaxResult createCapcha() throws IOException, CaptchaException;

    /**
     * 校验验证码
     */
    public void checkCapcha(MultiValueMap<String, String> getQueryParams) throws CaptchaException;
}
