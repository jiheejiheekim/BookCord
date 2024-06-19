package com.book.cord.login;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {

    private MemberVO member;
	private boolean enabled;

    public CustomUserDetails(MemberVO member) {
        this.member = member;
    }

	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = member.getRoleList().stream()
            .map(role -> new SimpleGrantedAuthority(role.getAuth()))
            .collect(Collectors.toList());
        return authorities;
    }

    @Override
    public String getPassword() {
        return member.getPwd();
    }

    @Override
    public String getUsername() {
        return member.getId();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
    
       
    // false: 비활성화 상태
    @Override
    public boolean isEnabled() {
    	//return true;
    	return member.isEnabled();
    }
}
