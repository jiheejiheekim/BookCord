package com.book.cord.login;

public interface MemberDAO {
	
    public void insertMember(MemberVO member);
    public MemberVO read(String id);
    
}
