package com.lyj.common.log.annotation;

import java.lang.annotation.*;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/6/3
 *
 * 日志注解
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface sysLog {
}
