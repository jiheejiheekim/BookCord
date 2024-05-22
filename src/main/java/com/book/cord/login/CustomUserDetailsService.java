package com.book.cord.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private MemberMapper memberMapper;
    
    @Autowired
    private MemberService memberService;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        // DB에서 사용자 정보를 가져오는 로직을 구현
        //MemberVO vo = memberMapper.read(id);
    	
    	MemberVO member = memberMapper.read(id);

    	if (member == null) {
            throw new UsernameNotFoundException("---------------아이디 못 찾음 : " + id);
        }
    	
    	
    	
        System.out.println("-------> [로그인 한 유저의 정보] : "+member);
        
        //return new CustomUser(member);
        return new CustomUserDetails(member);
    }
}
