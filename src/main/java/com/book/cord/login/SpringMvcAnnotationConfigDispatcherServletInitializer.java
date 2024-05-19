package com.book.cord.login;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SpringMvcAnnotationConfigDispatcherServletInitializer
 extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}
	
	//bean 설정과 spring container 설정을 위한 Config 클래스를 등록한다.
	//Config 클래스는 web.xml의 dispatcher servlet 초기화에 사용된 xml과 같은 기능을 한다.
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { SecurityConfig.class };
	}
	
	//web.xml의 servlet mapping 부분을 대체한다.
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
}