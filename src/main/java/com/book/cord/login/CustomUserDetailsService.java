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
    
    

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
    	MemberVO member = memberMapper.readMember(id);

    	if (member == null) {
            throw new UsernameNotFoundException("---------------아이디 못 찾음 : " + id);
        }
    	
    	//memberMapper.updateDate(id);
        System.out.println("-------> [로그인 한 유저의 정보] : "+member);
        
        return new CustomUserDetails(member);
    }
}
