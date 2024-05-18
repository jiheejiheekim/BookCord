package com.book.cord.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SignUpController {
    
    @Autowired
    private MemberService memberService;
    
    @GetMapping("/signUp") 
    public String signUpForm() { 
        return "login/signUp"; 
    }
    
    @PostMapping("/register")
    public String processRegistrationForm(@ModelAttribute("member") MemberVO member) {
        System.out.println("회원가입 처리 중");
        memberService.registerMember(member);
        return "redirect:/login/loginP"; // 회원가입 후 로그인 페이지로 이동
    }
}
