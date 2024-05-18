package com.book.cord.login;

public interface MemberService {
	
	int registerMember(MemberVO member);
    
    MemberVO memberInfo(String id);
}
