package com.book.cord.login;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public void registerMember(MemberVO member) {
        memberMapper.insertMember(member);
    }
    
    @Override
    public MemberVO read(String id) {
    	return memberMapper.read(id);
    }
    
}
