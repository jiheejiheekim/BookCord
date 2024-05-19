package com.book.cord.login;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public void registerMember(MemberVO member) {
    	//member.setReg_date(new Date(System.currentTimeMillis())); 
        
        memberMapper.insertMember(member);
    }
}
