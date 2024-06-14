package com.book.cord.mypage;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.cord.login.CustomUserDetails;
import com.book.cord.login.MemberVO;

@Controller
public class MemberEditController {
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService service;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@GetMapping("/memberEdit") 
	public String memberEdit(Model model) throws Exception{ 
		System.out.println("컨트롤러 >>>>> 회원 정보 수정");

		HttpSession session = request.getSession(false); // 세션이 없을 경우 null 반환
        if (session == null || session.getAttribute("member") == null) {
            String encodedMessage = URLEncoder.encode("로그인 하세요", "UTF-8");
            return "redirect:/loginP?error=true&message=" + encodedMessage;
        }
	    
		CustomUserDetails userDetails = (CustomUserDetails) session.getAttribute("member");
	    String member_id = userDetails.getUsername();
	    
        System.out.println("Session member_id: " + member_id);
        	    
	    MemberVO member = service.getMemberInfo(member_id);
	    
	    if(member != null) {
	        System.out.println(member.getId()+"님의 회원정보 : "+member);
	        model.addAttribute("member", member);
	    }
	    return "mypage/memberEdit"; 
	}
	
	@ResponseBody
    @GetMapping("/nameCheck_edit")
    public int nameCheck(@RequestParam String name) {
    	System.out.println("=============== name 중복 체크 중  ===> "+name);
    	int result;
    	if(name != "") {
    		result=service.nameCheck(name);
    		return result;
    	}else {
    		return 1;
    	}
    }
	
	@PostMapping("/memberUpdate")
	public String memberUpdate(@ModelAttribute MemberVO member) {
		System.out.println("===============회원정보 수정 처리 중 ===> " + member + " !!!");
		try {
        	if(member != null) {
        		service.memberUpdate(member);
        		System.out.println("컨트롤러에서 회원 정보 수정 처리");
        		System.out.println(">>>>>>> 회원정보 수정 성공 ID : "+member.getId());
        	}
        	return "redirect:/memberEdit";
        } catch (Exception e) {
            System.out.println("예 외 발 생 Exception in memberUpdate: " + e.getMessage());
            e.printStackTrace();
            return "redirect:/memberEdit?message=Error updating member information";
        }
	}

}
