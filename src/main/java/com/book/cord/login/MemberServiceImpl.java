package com.book.cord.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
    
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public int registerMember(MemberVO member) {
        return memberMapper.insertMember(member);
    }

    @Override
    public MemberVO memberInfo(String id) {
        return memberMapper.getMemberById(id);
    }
}