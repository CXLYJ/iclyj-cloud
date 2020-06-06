package auth.handler;

import com.lyj.common.core.utils.ServletUtils;
import com.lyj.common.security.domain.LoginUser;
import com.lyj.common.security.handler.AbstractAuthenticationSuccessEventHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * 认证成功处理
 * 
 * @author ruoyi
 */
@Component
@Slf4j
public class AuthenticationSuccessEventHandler extends AbstractAuthenticationSuccessEventHandler
{

    @Override
    public void handle(Authentication authentication)
    {
        HttpServletRequest request = ServletUtils.getRequest();

        String url = request.getRequestURI();

        if (authentication.getPrincipal() instanceof LoginUser)
        {
            LoginUser user = (LoginUser) authentication.getPrincipal();

            String username = user.getUsername();

            log.info("用户：{} 授权成功，url：{}", username, url);
        }
    }
}
