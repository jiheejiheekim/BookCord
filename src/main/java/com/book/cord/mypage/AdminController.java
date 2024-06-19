package com.book.cord.mypage;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.book.cord.login.CustomUserDetails;
import com.book.cord.login.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	MyPageService service;

	@Autowired
	HttpServletRequest request;
	
	@GetMapping("admin")
	public String admin(Model model) throws Exception {
		System.out.println("관리자 페이지 진입");
		
		HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("member") == null) {
            String encodedMessage = URLEncoder.encode("로그인 하세요", "UTF-8");
            
            return "redirect:/loginP?error=true&message=" + encodedMessage;
        }
        
        CustomUserDetails userDetails = (CustomUserDetails) session.getAttribute("member");
        String member_id = userDetails.getUsername();
	
    	if(!member_id.equals("admin")) {
    		System.out.println("admin 컨트롤러의 멤버아이디"+member_id);
    		String encodedMessage = URLEncoder.encode("권한이 없습니다", "UTF-8");
    		
    		return "redirect:/memberEdit?error=true&message=" + encodedMessage; 
    	}
	    
        System.out.println("Session member_id: " + member_id);
        
		List<MemberVO> memberInfo = service.getAllMemberInfo();
		if(memberInfo != null) {
			model.addAttribute("memberInfo", memberInfo);
		}else {
			System.out.println("관리자 페이지 진입 중 권한 에러");
		}
		
		return "mypage/admin";
	}
}
