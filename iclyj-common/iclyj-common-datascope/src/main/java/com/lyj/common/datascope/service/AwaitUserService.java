package com.lyj.common.datascope.service;

import com.lyj.common.core.constant.SecurityConstants;
import com.lyj.common.core.domain.R;
import com.lyj.common.core.utils.StringUtils;
import com.lyj.common.security.utils.SecurityUtils;
import com.lyj.system.api.RemoteUserService;
import com.lyj.system.api.model.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/30
 *
 * 同步调用用户服务
 */
@Service
public class AwaitUserService {

    private static final Logger log = LoggerFactory.getLogger(AwaitUserService.class);

    @Autowired
    private RemoteUserService remoteUserService;

    public UserInfo info(){
        String username = SecurityUtils.getUsername();
        R<UserInfo> userResult = remoteUserService.getUserInfo(username, SecurityConstants.FROM);
        if (StringUtils.isNull(userResult) || StringUtils.isNull(userResult.getData()))
        {
            log.info("数据权限范围查询用户：{} 不存在.", username);
            return null;
        }
        return userResult.getData();
    }

}
