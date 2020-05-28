package com.lyj.common.security.config;

import com.lyj.common.core.constant.SecurityConstants;
import com.lyj.common.core.text.Convert;
import com.lyj.common.security.domain.LoginUser;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.provider.token.UserAuthenticationConverter;
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author ：lenglegn
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/27
 *
 * https://my.oschina.net/giegie/blog/3023768 根据checktoken 的结果转化用户信息
 */
public class CommonUserConverter implements UserAuthenticationConverter {

    private static final String N_A = "N/A";

    /**
     * 将授权信息返回到资源服务
     */
    @Override
    public Map<String, ?> convertUserAuthentication(Authentication userAuthentication)
    {
        Map<String, Object> authMap = new LinkedHashMap<>();
        authMap.put(USERNAME, userAuthentication.getName());
        if (userAuthentication.getAuthorities() != null && !userAuthentication.getAuthorities().isEmpty())
        {
            authMap.put(AUTHORITIES, AuthorityUtils.authorityListToSet(userAuthentication.getAuthorities()));
        }
        return authMap;
    }

    /**
     * 获取用户认证信息
     */
    @Override
    public Authentication extractAuthentication(Map<String, ?> map)
    {
        if (map.containsKey(USERNAME))
        {
            Collection<? extends GrantedAuthority> authorities = getAuthorities(map);

            Long userId = Convert.toLong(map.get(SecurityConstants.DETAILS_USER_ID));
            String username = (String) map.get(SecurityConstants.DETAILS_USERNAME);
            LoginUser user = new LoginUser(userId, username, N_A, true, true, true, true, authorities);
            return new UsernamePasswordAuthenticationToken(user, N_A, authorities);
        }
        return null;
    }

    /**
     * 获取权限资源信息
     */
    private Collection<? extends GrantedAuthority> getAuthorities(Map<String, ?> map)
    {
        Object authorities = map.get(AUTHORITIES);
        if (authorities instanceof String)
        {
            return AuthorityUtils.commaSeparatedStringToAuthorityList((String) authorities);
        }
        if (authorities instanceof Collection)
        {
            return AuthorityUtils.commaSeparatedStringToAuthorityList(
                    StringUtils.collectionToCommaDelimitedString((Collection<?>) authorities));
        }
        throw new IllegalArgumentException("Authorities must be either a String or a Collection");
    }

}
