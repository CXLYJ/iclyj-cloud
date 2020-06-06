package auth.handler;

import com.lyj.common.core.utils.ServletUtils;
import com.lyj.common.security.handler.AbstractAuthenticationFailureEvenHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * 认证失败处理
 * 
 * @author ruoyi
 */
@Component
@Slf4j
public class AuthenticationFailureEvenHandler extends AbstractAuthenticationFailureEvenHandler
{

    @Override
    public void handle(AuthenticationException authenticationException, Authentication authentication)
    {
        HttpServletRequest request = ServletUtils.getRequest();

        String url = request.getRequestURI();

        String username = (String) authentication.getPrincipal();

        log.info("用户：{} 授权失败，url：{}", username, url);
    }
}
