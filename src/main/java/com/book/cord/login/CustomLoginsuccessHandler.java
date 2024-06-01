package com.book.cord.login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginsuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
    private MemberMapper memberMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, 
			HttpServletResponse response, Authentication auth) 
		throws IOException, ServletException {
		
		 String username = auth.getName();
	     memberMapper.updateDate(username); //로그인 시 update_date 업데이트
		
		System.out.println(">>>>>>> 로그인 성공 ID : "+username);
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		System.out.println(">>>>>>> 로그인 한 유저의 권한 : "+roleNames);
		
		///////////////////////////////////////////
		// 사용자의 인증 정보를 가져옴
	    UserDetails userDetails = (UserDetails) auth.getPrincipal();
	    // 세션에 사용자 정보를 추가
	    HttpSession session = request.getSession();
	    session.setAttribute("userDetails", userDetails);
	    // 사용자의 Authentication 객체를 SecurityContext에 설정
	    SecurityContextHolder.getContext().setAuthentication(auth);
	    ///////////////////////////////////////////
	    
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/bc/admin");
			return;
		}
		
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/bc/vip");
			return;
		}
		
		response.sendRedirect("/");
	}
	
	

}
