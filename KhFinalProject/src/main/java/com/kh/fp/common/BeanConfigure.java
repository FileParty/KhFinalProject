package com.kh.fp.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

// 빈등록하는 클래스
@Configuration
public class BeanConfigure {
	
	@Bean
	public Logger getLogger() {
		return LoggerFactory.getLogger(BeanConfigure.class);
	}

}
