package com.lyj.system.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/29
 *
 * 认证授权拦截测试
 */
@RestController
@RequestMapping("sys-test")
public class TestController {

    /**
     * 需要认证授权才可以访问的接口
     * @return
     */
    @GetMapping("testAuth")
    public String TestAuth(){
        return "testAuth";
    }

    /**
     * 不需要认证授权就可访问的接口
     * @return
     */
    @GetMapping("testUNAuth")
    public String TestUNAuth(){
        return "testUNAuth";
    }

}
