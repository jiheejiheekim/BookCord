package com.book.cord.login;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class KakaoAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private HttpSession httpSession;

	private final CustomUserDetailsService customUserDetailsService;
	private final CustomPasswordEncoder customPasswordEncoder;

	public KakaoAuthenticationProvider(CustomUserDetailsService customUserDetailsService,
			CustomPasswordEncoder customPasswordEncoder) {
		this.customUserDetailsService = customUserDetailsService;
		this.customPasswordEncoder = customPasswordEncoder;
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String email = (String) authentication.getPrincipal(); // 카카오 로그인에서는 이메일을 principal로 사용
		
		// 자체 회원가입 회원이 로그인할 때는 카카오 로그인 처리를 하지 않도록 처리
        // 예시: 만약 ID가 이메일 형식이 아니라면 카카오 로그인으로 간주하지 않음
        if (!isValidEmailFormat(email)) {
            return null; // 또는 다른 AuthenticationProvider로 넘기거나 예외를 던질 수 있음
        }

		//사용자 조회
		MemberVO user = memberMapper.readMember(email);

		if (user == null) {
			throw new UsernameNotFoundException("회원이 아닙니다 >> ID : " + email);
		}
		
		memberMapper.updateDate(email); //로그인 시 update_date 업데이트
		System.out.println("카카오 >>>>>>> 로그인 성공 ID : "+email);
		
		//권한 설정
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		System.out.println("카카오 >>>>>>> 로그인 한 유저의 권한 : "+authorities);
		
		//UserDetails 생성
		UserDetails userDetails = new User(user.getId(), user.getPwd(), authorities);
	
		// 세션에 사용자 ID 저장
		httpSession.setAttribute("member", userDetails); // 세션에 사용자 ID 저장

		return new UsernamePasswordAuthenticationToken(userDetails, user.getPwd(), authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	// 이메일 형식이 올바른지 확인하는 메서드
    private boolean isValidEmailFormat(String email) {
        // 예시로 간단히 @ 기호를 포함하는지만 확인하는 로직
        return email != null && email.contains("@");
    }
    
}
