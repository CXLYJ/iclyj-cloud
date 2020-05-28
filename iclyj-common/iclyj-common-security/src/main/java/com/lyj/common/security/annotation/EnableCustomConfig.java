package com.lyj.common.security.annotation;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableAsync;

import java.lang.annotation.*;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/27
 */

/**
 * 用于描述类、接口(包括注解类型) 或enum声明
 */
@Target(ElementType.TYPE)
/**
 * 注解不仅被保存到class文件中，jvm加载class文件之后，仍然存在；
 */
@Retention(RetentionPolicy.RUNTIME)
/**
 * 自定义注解`InheritedTest`使用了`@Inherited`元注解，表示此自定义注解**用在类上时，会被子类所继承**
 */
@Inherited
// 表示通过aop框架暴露该代理对象,AopContext能够访问
@EnableAspectJAutoProxy(exposeProxy = true)
// 指定要扫描的Mapper类的包的路径
@MapperScan("com.lyj.**.mapper")
// 开启线程异步执行
@EnableAsync
public @interface EnableCustomConfig
{
}
