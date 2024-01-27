package com.book.cord.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {
	
	@GetMapping("/memberEdit") 
	public String memberEdit() { 
		return "mypage/memberEdit"; 
	}

}
