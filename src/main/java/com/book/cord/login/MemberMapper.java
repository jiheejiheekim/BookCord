package com.book.cord.login;

public interface MemberMapper {
    
	void insertMember(MemberVO member);
    
    MemberVO read(String id);
    
}
