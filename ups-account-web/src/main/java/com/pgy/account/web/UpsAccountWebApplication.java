package com.pgy.account.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * UPS账务WEB系统启动
 * @author 墨凉
 *
 */

@SpringBootApplication
public class UpsAccountWebApplication {

	private static final Logger logger = LoggerFactory.getLogger(UpsAccountWebApplication.class);

	public static void main(String[] args) {
		logger.info ("begin to start-up [ups-biz]");
		SpringApplication.run(UpsAccountWebApplication.class, args);
		logger.info ("start-up [ups-biz] success !!!");
	}	

}
