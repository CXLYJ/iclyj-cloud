package com.lyj.system.test.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/29
 */
@RestController
@RequestMapping("sys-test")
public class TestController {

    @GetMapping("testAuth")
    public String TestAuth(){
        return "testAuth";
    }

    @GetMapping("testUNAuth")
    public String TestUNAuth(){
        return "testUNAuth";
    }

}
