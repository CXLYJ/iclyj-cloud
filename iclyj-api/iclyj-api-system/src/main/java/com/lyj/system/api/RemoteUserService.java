package com.lyj.system.api;

import com.lyj.constant.ServiceNameConstants;
import com.lyj.domain.R;
import com.lyj.system.api.factory.RemoteUserFallbackFactory;
import com.lyj.system.api.model.UserInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 用户服务
 * 
 * @author ruoyi
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteUserFallbackFactory.class)
public interface RemoteUserService
{
    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @param from 调用标志
     * @return 结果
     */
    @GetMapping(value = "/user/info/{username}")
    public R<UserInfo> getUserInfo(@PathVariable("username") String username);
}
