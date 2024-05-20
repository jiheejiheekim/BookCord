package com.book.cord.login;

public interface MemberService {
	
    void registerMember(MemberVO member);
    MemberVO read(String id);
    
}
