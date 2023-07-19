package com.poly.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

public class ResourcesConfig {
@Bean("messageSource")
public MessageSource getMessageResource() {
	ReloadableResourceBundleMessageSource ms = new
			ReloadableResourceBundleMessageSource();
	
	ms.setBasename("classpath:message/validator");
	ms.setDefaultEncoding("utf-8");
	return ms;
}
}
