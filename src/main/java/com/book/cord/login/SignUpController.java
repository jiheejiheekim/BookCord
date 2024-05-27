package com.book.cord.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SignUpController {
    
    @Autowired
    @Qualifier("memberServiceImpl")
    private MemberService memberService;
    
    @Autowired
    private MemberDAO memberDAO;
    
    @Autowired
    private MemberMapper memberMapper;
    
    @Autowired
    private CustomPasswordEncoder passwordEncoder; 
  
    
    @GetMapping("/signUp") 
    public String signUpForm(Model model) { 
        return "login/signUp"; 
    }
    
   
    @PostMapping("/register")
    public String registerMember(@ModelAttribute MemberVO member) {
        System.out.println("===============회원가입 처리 중 ===> " + member + " !!!");
        try {
        	
            memberService.registerMember(member);
        	System.out.println("컨트롤러에서 서비스 호출!!!");
        	
            return "redirect:/index";
        } catch (Exception e) {
            System.out.println("예 외 발 생 Exception in registerMember: " + e.getMessage());
            e.printStackTrace();
            return "redirect:/loginP";
        }
    }
    
    @ResponseBody
    @GetMapping("/idCheck")
    public int idCheck(@RequestParam String id) {
    	System.out.println("===============id 중복 체크 중  ===> "+id);
    	int result=memberService.idCheck(id);
    	return result;
    }
    
}
