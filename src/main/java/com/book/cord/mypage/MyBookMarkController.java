package com.book.cord.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.cord.login.CustomUserDetails;
import com.book.cord.notice.Criteria;
import com.book.cord.notice.PageDTO;

@Controller
public class MyBookMarkController {
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService service;
	
	@Autowired
    HttpServletRequest request;
	
	@GetMapping("/myBookMark") 
	public String myBookMark(Criteria cri, Model model) { 
		System.out.println("나의 북마크 리스트 >>> "+cri);
		
		HttpSession session = request.getSession();
        CustomUserDetails userDetails = (CustomUserDetails) session.getAttribute("member");
        String member_id = userDetails.getUsername();
        System.out.println("Session member_id: " + member_id);
        if (member_id == null) {
            throw new IllegalArgumentException("에러 >> member_id가 null");
        }
		
		List<BookMarkVO> list = service.getBookMarkList(cri, member_id);
		model.addAttribute("myBookMarkList", list);
        
		int totalCount = service.bookMarkTotal(member_id);
		model.addAttribute("totalCount", totalCount);
		
		PageDTO pageMaker = new PageDTO(cri, totalCount);
        model.addAttribute("pageMaker", pageMaker);
		
		return "mypage/myBookMark"; 
	}

	//북마크에 추가하는 메서드
	@PostMapping("/bookmark")
    @ResponseBody
    public Map<String, String> bookmark(@RequestParam("member_id") String member_id,
                           @RequestParam("title") String title,
                           @RequestParam("author") String author,
                           @RequestParam("isbn13") String isbn13,
                           @RequestParam("cover") String cover) {
		
        System.out.println("컨트롤러 동작=================> ");
        BookMarkVO vo = new BookMarkVO();
        vo.setMember_id(member_id);
        vo.setTitle(title);
        vo.setAuthor(author);
        vo.setIsbn13(isbn13);
        vo.setCover(cover);
        service.addBookMark(vo);

        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        return response;
    }
	
	
	
	
}
