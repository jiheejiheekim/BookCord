package com.book.cord.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService {

    @Autowired
	@Qualifier("memberDAO") 
    private MemberDAO memberDAO;
    
    @Autowired
    private MemberMapper memberMapper;
    
    @Autowired
    private CustomPasswordEncoder passwordEncoder; // 암호화를 위한 PasswordEncoder 빈 주입

    @Override
    public void registerMember(MemberVO member) {
        try {
            log.debug("Service: {}~~ ~~", member);
            
            String encodedPassword = passwordEncoder.encode(member.getPwd());
            member.setPwd(encodedPassword);
            member.setEnabled(true);
            memberDAO.insertMember(member); // MemberDAO를 통해 회원 추가
            
        } catch (Exception e) {
            log.error("Exception in registerMember", e);
        }
    }
/*
    @Override
    public MemberVO getMemberById(String id) {
        //return memberMapper.read(id);
    	System.out.println("서비스 >>>>> id : "+id);
        return memberDAO.read(id);
    }*/
    
    @Override
    public int idCheck(String id) {
    	System.out.println("id 중복체크 서비스");
    	int result=memberDAO.searchId(id);
    	System.out.println("중복체크 결과 : "+result);
    	return result;
    }
}
