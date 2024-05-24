package com.book.cord.notice;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@Autowired
	NoticeMapper mapper;
	
	/*
	@GetMapping("/notice") 
	public String memberEdit() { 
		return "notice/notice"; 
	}
	*/
	@GetMapping("/notice") 
	public String list(Model model) throws Exception {
		List<NoticeVO> list = service.list();
		int totalCount = service.count();
		//List<NoticeVO> notices = mapper.listNotice();
	    System.out.println("컨트롤러 로그 출력 Notices: " + list); // 로그 출력
	    model.addAttribute("list", list);
	    model.addAttribute("totalCount", totalCount);
	    
		return "notice/notice";
	}

}
