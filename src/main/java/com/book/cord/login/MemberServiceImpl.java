package com.book.cord.login;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;
    
    @Autowired
    private MemberMapper memberMapper;
    
    @Autowired
    private PasswordEncoder passwordEncoder; // 암호화를 위한 PasswordEncoder 빈 주입

    @Override
    public void registerMember(MemberVO member) {
        try {
            log.debug("Service: {}~~ ~~", member);
            
            String encodedPassword = passwordEncoder.encode(member.getPwd());
            member.setPwd(encodedPassword);

            memberDAO.insertMember(member); // MemberDAO를 통해 회원 추가
            
        } catch (Exception e) {
            log.error("Exception in registerMember", e);
        }
    }

    @Override
    public MemberVO getMemberById(String id) {
        return memberMapper.read(id);
        //return memberDAO.read(id);
    }
}
