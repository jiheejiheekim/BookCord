package com.book.cord.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.book.cord.login.CustomUserDetails;
import com.book.cord.notice.Criteria;
import com.book.cord.notice.PageDTO;

@Controller
public class MyReviewController {
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService service;
	
	@Autowired
    HttpServletRequest request;
	
	@GetMapping("/myReview") 
	public String myReview(Criteria cri, Model model) { 
		System.out.println("나의 리뷰 리스트 >>> "+cri);
		
		HttpSession session = request.getSession();
		CustomUserDetails userDetails = (CustomUserDetails) session.getAttribute("member");
        String member_id = userDetails.getUsername();
        System.out.println("Session member_id: " + member_id);
        if (member_id == null) {
            throw new IllegalArgumentException("에러 >> member_id가 null");
        }
        
        List<BookMarkVO> list = service.getReviewList(cri, member_id);
		model.addAttribute("myReviewList", list);
		
		int totalCount = service.reviewTotal(member_id);
		model.addAttribute("totalCount", totalCount);
		
		PageDTO pageMaker = new PageDTO(cri, totalCount);
        model.addAttribute("pageMaker", pageMaker);
		
		return "mypage/myReview"; 
	}
	
	

}
