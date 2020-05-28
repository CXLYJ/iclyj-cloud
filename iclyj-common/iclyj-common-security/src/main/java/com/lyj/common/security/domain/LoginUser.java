package com.lyj.common.security.domain;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/27
 *
 * 登录用户身份权限
 */
public class LoginUser extends User {

    private static final long serialVersionUID = 1L;

    private Long userId;

    public LoginUser(Long userId, String username, String password, boolean enabled, boolean accountNonExpired,
                     boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities)
    {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
