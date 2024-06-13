package com.book.cord.login;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private HttpServletRequest request;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException accessException) throws IOException, ServletException {

        System.out.println(">>>>>>>>>>> 로그인 실패");
        System.out.println(">>>>>>>>>>> Redirect....");
        
        String errorMessage = "";

        if (accessException instanceof AuthenticationServiceException) {
            System.out.println("존재하지 않는 사용자입니다.");
            errorMessage = "존재하지 않는 사용자입니다.";
        } else if (accessException instanceof BadCredentialsException) {
            System.out.println("비밀번호가 틀립니다.");
            errorMessage = "아이디 또는 비밀번호가 일치하지 않습니다";
        } else if (accessException instanceof LockedException) {
            System.out.println("잠긴 계정입니다");
            errorMessage = "존재하지 않는 사용자입니다";
        } else if (accessException instanceof DisabledException) {
            System.out.println("비활성화된 계정입니다.");
            errorMessage = "존재하지 않는 사용자입니다";
        } else if (accessException instanceof AccountExpiredException) {
            System.out.println("만료된 계정입니다.");
            errorMessage = "존재하지 않는 사용자입니다";
        } else if (accessException instanceof CredentialsExpiredException) {
            System.out.println("비밀번호가 만료되었습니다.");
            errorMessage = "존재하지 않는 사용자입니다";
        }

        String encodedErrorMessage = URLEncoder.encode(errorMessage, "UTF-8");
        String redirectUrl = request.getContextPath() + "/loginP?error=true&message=" + encodedErrorMessage;
        response.sendRedirect(redirectUrl);
        
    }
}
