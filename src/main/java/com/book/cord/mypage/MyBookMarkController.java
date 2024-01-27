package com.book.cord.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyBookMarkController {
	
	@GetMapping("/myBookMark") 
	public String myBookMark() { 
		return "mypage/myBookMark"; 
	}

}
