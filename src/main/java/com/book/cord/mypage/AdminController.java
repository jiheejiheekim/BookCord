package com.book.cord.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.book.cord.board.Criteria;
import com.book.cord.login.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	MyPageService service;

	@GetMapping("admin")
	public String admin(Model model) {
		System.out.println("관리자 페이지 진입");
		List<MemberVO> memberInfo = service.getAllMemberInfo();
		if(memberInfo != null) {
			model.addAttribute("memberInfo", memberInfo);
		}else {
			System.out.println("관리자 페이지 진입 중 권한 에러");
		}
		
		return "mypage/admin";
	}
}
