package com.book.cord.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@GetMapping("/notice") 
	public String memberEdit() { 
		return "notice/notice"; 
	}

}
