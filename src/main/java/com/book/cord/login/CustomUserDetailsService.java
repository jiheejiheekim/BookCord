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
        // DB에서 사용자 정보를 가져오는 로직을 구현
        MemberVO vo = memberMapper.read(id);

        System.out.println("queried by member mapper : "+vo);
        
        return vo == null ? null:new CustomUser(vo);
    }
}
