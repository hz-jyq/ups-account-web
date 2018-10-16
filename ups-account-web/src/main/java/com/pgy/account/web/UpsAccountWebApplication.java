package com.pgy.account.web;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@SpringBootApplication
@EnableTransactionManagement(proxyTargetClass=true)
@MapperScan("com.pgy.account.web.dao")
public class UpsAccountWebApplication {

	public static void main(String[] args) { 
		
		SpringApplication.run(UpsAccountWebApplication.class, args);
	}
			
}
