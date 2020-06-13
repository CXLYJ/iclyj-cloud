/*
 *
 *  *  Copyright (c) 2019-2020, 冷冷 (wangiegie@gmail.com).
 *  *  <p>
 *  *  Licensed under the GNU Lesser General Public License 3.0 (the "License");
 *  *  you may not use this file except in compliance with the License.
 *  *  You may obtain a copy of the License at
 *  *  <p>
 *  * https://www.gnu.org/licenses/lgpl.html
 *  *  <p>
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 *
 */

package com.lyj.common.security.component;

import cn.hutool.core.util.ReUtil;
import com.lyj.common.security.config.IclyjInner;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.regex.Pattern;

/**
 * @author lengleng
 * @date 2020-03-11
 * <p>
 * 资源服务器对外直接暴露URL,如果设置contex-path 要特殊处理
 */
@Slf4j
@Configuration
@ConditionalOnExpression("!'${security.oauth2.client.ignore-urls}'.isEmpty()")
@ConfigurationProperties(prefix = "security.oauth2.client")
public class PermitAllUrlProperties implements InitializingBean, ApplicationContextAware {
	private static final Pattern PATTERN = Pattern.compile("\\{(.*?)\\}");
	private ApplicationContext applicationContext;
	private static final String ASTERISK = "*";

	@Getter
	@Setter
	private List<String> urls = new ArrayList<>();

	@Override
	public void afterPropertiesSet() {
		RequestMappingHandlerMapping mapping = applicationContext.getBean(RequestMappingHandlerMapping.class);
		Map<RequestMappingInfo, HandlerMethod> map = mapping.getHandlerMethods();

		map.keySet().forEach(info -> {
			HandlerMethod handlerMethod = map.get(info);

			// 获取方法上边的注解 替代path variable 为 *
			IclyjInner method = AnnotationUtils.findAnnotation(handlerMethod.getMethod(), IclyjInner.class);
			Optional.ofNullable(method)
				.ifPresent(inner -> info.getPatternsCondition().getPatterns()
					.forEach(url -> urls.add(ReUtil.replaceAll(url, PATTERN, ASTERISK))));

			// 获取类上边的注解, 替代path variable 为 *
			IclyjInner controller = AnnotationUtils.findAnnotation(handlerMethod.getBeanType(), IclyjInner.class);
			Optional.ofNullable(controller)
				.ifPresent(iclyjInner -> info.getPatternsCondition().getPatterns()
					.forEach(url -> urls.add(ReUtil.replaceAll(url, PATTERN, ASTERISK))));
		});
	}

	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.applicationContext = context;
	}
}
