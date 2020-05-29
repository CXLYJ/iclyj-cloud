package com.lyj.gateway;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/5/29
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })  //不加载数据源
public class LyjGatewayApplication {
}
