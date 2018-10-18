package com.pgy.account.web.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.alibaba.dubbo.config.ApplicationConfig;
import com.alibaba.dubbo.config.ConsumerConfig;
import com.alibaba.dubbo.config.RegistryConfig;
import com.alibaba.dubbo.config.spring.context.annotation.DubboComponentScan;

@Configuration
@DubboComponentScan("com.pgy.account.web.dubbo")
public class DubboConfiguration {
	
	@Bean
	public DubboProperties getDubboProperties() {
		return new DubboProperties();
	}
	
	@Bean
    public ApplicationConfig applicationConfig(DubboProperties dubboProperties) {
        ApplicationConfig applicationConfig = new ApplicationConfig();
        applicationConfig.setName(dubboProperties.getName());
        applicationConfig.setLogger(dubboProperties.getLogger());
        return applicationConfig;
    }

    @Bean
    public ConsumerConfig consumerConfig(DubboProperties dubboProperties) {
        ConsumerConfig consumerConfig = new ConsumerConfig();
        consumerConfig.setTimeout(dubboProperties.getTimeout());
        return consumerConfig;
    }

    @Bean
    public RegistryConfig registryConfig(DubboProperties dubboProperties) {
        RegistryConfig registryConfig = new RegistryConfig();
        registryConfig.setAddress(dubboProperties.getAddress());
        registryConfig.setClient(dubboProperties.getZkClient());
        return registryConfig;
    }
}
