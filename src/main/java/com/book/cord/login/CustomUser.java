package com.book.cord.login;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Data
public class CustomUser extends User {
	
	private static long serialVersionUID = 1L;
	
	private MemberVO member;
	
	public CustomUser(String id, String pwd, Collection<? extends GrantedAuthority> authorities) {
		super(id, pwd, authorities);
	}
	
	public CustomUser(MemberVO vo) {
		super(vo.getId(), vo.getPwd(), vo.getRole().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.member=vo;
	}
	
}
