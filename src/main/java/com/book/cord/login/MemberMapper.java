package com.book.cord.login;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
    void insertMember(MemberVO member);
    MemberVO readMember(String id);
    void updateDate(String id);
    
}
