package com.lyj.common.security.config;

import java.lang.annotation.*;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/6/13 13:56
 *
 * 服务调用不鉴权注解
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface IclyjInner {

    /**
     * 是否AOP统一处理
     *
     * @return false, true
     */
    boolean value() default true;

    /**
     * 需要特殊判空的字段(预留)
     *
     * @return {}
     */
    String[] field() default {};

}
