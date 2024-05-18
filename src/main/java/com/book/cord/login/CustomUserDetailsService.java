package com.book.cord.login;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
    	
    	System.out.println("유저 이름 확인 : " + id);
				
		MemberVO vo = memberMapper.getMemberById(id);
		
		if (vo == null) {
	        throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + id);
	    }

	    // 사용자의 권한을 부여합니다. 여기서는 'ROLE_USER' 권한만 부여하도록 설정합니다.
	    List<GrantedAuthority> authorities = new ArrayList<>();
	    authorities.add(new SimpleGrantedAuthority("ROLE_USER")); // 예시로 'ROLE_USER' 권한을 추가합니다.

	    // UserDetails 객체를 생성하여 반환합니다.
	    return new User(vo.getId(), vo.getPwd(), authorities);
		
    }
}
