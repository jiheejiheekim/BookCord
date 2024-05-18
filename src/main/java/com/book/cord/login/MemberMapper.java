package com.book.cord.login;

public interface MemberMapper {
    // 아래와 같이 getMemberById 메서드가 정의되어 있는지 확인하세요
    MemberVO getMemberById(String id);
    
    int insertMember(MemberVO member);
}
