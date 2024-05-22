package com.book.cord.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service
public class CustomLoginFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException accessException) throws IOException, ServletException {
	
		System.out.println(">>>>> Access Denied Handler");
		System.out.println(">>>>>>>>>>>Redirect....");
		
		if (accessException instanceof AuthenticationServiceException) {
			//request.setAttribute("error", "존재하지 않는 사용자입니다.");
			System.out.println("존재하지 않는 사용자입니다.");
		
		} else if(accessException instanceof BadCredentialsException) {
			System.out.println("비밀번호가 틀립니다.");
			
		} else if(accessException instanceof LockedException) {
			System.out.println("잠긴 계정입니다.");
			
		} else if(accessException instanceof DisabledException) {
			System.out.println("비활성화된 계정입니다.");
			
		} else if(accessException instanceof AccountExpiredException) {
			System.out.println("만료된 계정입니다.");
			
		} else if(accessException instanceof CredentialsExpiredException) {
			System.out.println("비밀번호가 만료되었습니다.");
		}
		
		
	}

}
