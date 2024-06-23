package com.book.cord.login;

public interface MemberDAO {
	
    void insertMember(MemberVO member);
    int searchId(String id);
    int searchName(String name);
    
}
