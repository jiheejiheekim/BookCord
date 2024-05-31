package com.book.cord.login;

public interface MemberService {
    void registerMember(MemberVO member);
    //MemberVO getMemberById(String id);
    int idCheck(String id);
    int nameCheck(String name);

}
