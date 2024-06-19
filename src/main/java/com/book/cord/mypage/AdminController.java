package com.book.cord.mypage;

import java.net.URLEncoder;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println("컨트롤러 >>>>>> 관리자 페이지 진입");
		
		HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("member") == null) {
            String encodedMessage = URLEncoder.encode("로그인 하세요", "UTF-8");
            
            return "redirect:/loginP?error=true&message=" + encodedMessage;
        }
        
        CustomUserDetails userDetails = (CustomUserDetails) session.getAttribute("member");
        String member_id = userDetails.getUsername();
        System.out.println("Session member_id: " + member_id);
        
        Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        boolean isAdmin = authorities.stream().anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"));
        if (!isAdmin) {
            System.out.println("권한 없는 사용자가 관리자페이지에 접근 ------ ID : "+ member_id);
            String encodedMessage = URLEncoder.encode("권한이 없습니다", "UTF-8");
            return "redirect:/memberEdit?error=true&message=" + encodedMessage;
        }
        
		List<MemberVO> memberInfo = service.getAllMemberInfo();
		if(memberInfo != null) {
			model.addAttribute("memberInfo", memberInfo);
		}else {
			System.out.println("관리자 페이지 진입 중 권한 에러");
		}
		
		return "mypage/admin";
	}

	
	@PostMapping("enabledEdit")
	@ResponseBody
	public String enabledEdit(@RequestParam String id, @RequestParam String enabled) {
		System.out.println("컨트롤러 >>>>>> 관리자 페이지에서 <<"+id+">> 계정 활성화 상태 변경 시도");
		if(enabled.equals("true")) {
			service.enabledEditFalse(id);
			System.out.println("컨트롤러 >>>>>> 관리자 페이지에서 <<"+id+">> 계정 활성화 상태"+enabled+"에서 false로 변경 완료");
			return "false";
		}else if(enabled.equals("false")) {
			service.enabledEditTrue(id);
			System.out.println("컨트롤러 >>>>>> 관리자 페이지에서 <<"+id+">> 계정 활성화 상태"+enabled+"에서 true로 변경 완료");
			return "true";
		}else {
			System.out.println("에러");
			System.out.println("컨트롤러 >>>>>> 관리자 페이지에서 <<"+id+">> 계정 활성화 상태 변경 실패");
			return "null";

		}
	}
	
	@PostMapping("roleDelAdmin")
	@ResponseBody
	public String roleDelAdmin(@RequestParam String id) {
		System.out.println("컨트롤러 >>>>>> 관리자 페이지에서 <<"+id+">> admin 권한 회수 시도");
		service.roleDelAdmin(id);
		return "revoke";
	}
	
	@PostMapping("roleAddAdmin")
	@ResponseBody
	public String roleAddAdmin(@RequestParam String id) {
		System.out.println("컨트롤러 >>>>>> 관리자 페이지에서 <<"+id+">> admin 권한 추가 시도");
		service.roleAddAdmin(id);
		return "grant";
	}
	
	@PostMapping("memberDelete")
	@ResponseBody
	public String memberDelete(@RequestParam String id) {
		System.out.println("컨트롤러 >>>>>> 관리자 페이지에서 <<"+id+">> 회원 삭제 시도");
		service.memberDelete(id);
		return "success";	
	}
	
}
