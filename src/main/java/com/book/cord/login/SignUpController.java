package com.book.cord.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SignUpController {
    
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private MemberDAO memberDAO;
    
    @GetMapping("/signUp") 
    public String signUpForm() { 
        return "login/signUp"; 
    }
    
    @GetMapping("/join")
    public String join(){
        return "login/join";
    }
    
   
    @PostMapping("/register")
    public String registerMember(@ModelAttribute MemberVO member) {
    	System.out.println("===============회원가입 처리 중");
        memberDAO.insertMember(member);
        return "redirect:/loginP"; // 회원가입 후 로그인 페이지로 리다이렉트
    }
}
