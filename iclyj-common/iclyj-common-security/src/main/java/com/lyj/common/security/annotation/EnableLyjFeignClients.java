package com.lyj.common.security.annotation;

import org.springframework.cloud.openfeign.EnableFeignClients;

import java.lang.annotation.*;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/27
 *
 * 自定义feign注解
 * 添加basePackages路径
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@EnableFeignClients
public @interface EnableLyjFeignClients
{
    String[] value() default {};

    String[] basePackages() default { "com.lyj" };

    Class<?>[] basePackageClasses() default {};

    Class<?>[] defaultConfiguration() default {};

    Class<?>[] clients() default {};
}
