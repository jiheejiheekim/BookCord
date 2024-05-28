package com.book.cord.login;

public interface MemberDAO {
	
    void insertMember(MemberVO member);
    //MemberVO read(String id);
    int searchId(String id);
    int searchName(String name);
}
