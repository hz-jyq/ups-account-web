package com.pgy.account.web.configuration;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.pgy.account.web.dao")
public class MybatisConfiguration {

}
