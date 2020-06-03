package com.lyj.common.log.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/6/3
 *
 * 操作日志aop处理
 */
@Aspect
@Component
@Slf4j
public class SysLogAspect
{

    @Pointcut("@annotation(com.lyj.common.log.annotation.SysLog)")
    public void PointCut() {
    }

    @Before("PointCut()")
    public void doBefore(JoinPoint joinPoint) {
        log.info("---前置通知---");
    }

    @Around("PointCut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long beginTime = System.currentTimeMillis();
        //执行方法
        Object result = point.proceed();
        //执行时长(毫秒)
        long time = System.currentTimeMillis() - beginTime;

        log.info("执行了当前的方法......." + time);

        return result;
    }

    @After("PointCut()")
    public void doAfterAdvice(JoinPoint joinPoint) {
        log.info("---后置最终通知---");
    }

    @AfterReturning(returning = "ret", pointcut = "PointCut()")
    public void doAfterReturning(Object ret) throws Throwable {
        /// 处理完请求，返回内容
        log.info("RESPONSE : " + ret);
    }

}
