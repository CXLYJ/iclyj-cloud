package com.lyj.common.security.service;

import com.lyj.common.core.constant.CacheConstants;
import com.lyj.common.core.constant.SecurityConstants;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;

import javax.sql.DataSource;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/27
 *
 * 重写原生方法支持redis缓存
 */
public class RedisClientDetailsService extends JdbcClientDetailsService
{
    public RedisClientDetailsService(DataSource dataSource) {
        super(dataSource);
        super.setSelectClientDetailsSql(SecurityConstants.DEFAULT_SELECT_STATEMENT);
        super.setFindClientDetailsSql(SecurityConstants.DEFAULT_FIND_STATEMENT);
    }

    @Override
    @Cacheable(value = CacheConstants.CLIENT_DETAILS_KEY, key = "#clientId", unless = "#result == null")
    public ClientDetails loadClientByClientId(String clientId)
    {
        return super.loadClientByClientId(clientId);
    }

}
