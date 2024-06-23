package com.book.cord.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    @Qualifier("memberServiceImpl")
    MemberService memberService;


    @GetMapping("/loginP")
    public String loginP(Model model) {
        return "login/loginP";
    }
    
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request) {
		String result = memberService.kakaoRegisterMember(code, request);
		if(result != null) {
			System.out.println("컨트롤러 : "+result);
			//로그인 성공 시 사용자 정보를 세션에 저장
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	        if (authentication != null) {
	            HttpSession session = request.getSession(true);
	            session.setAttribute("member", authentication.getPrincipal());
	        }
		}
		return "redirect:/main";
	}
    
    
}
