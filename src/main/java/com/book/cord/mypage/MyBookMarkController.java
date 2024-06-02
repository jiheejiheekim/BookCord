package com.book.cord.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class MyBookMarkController {
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
	@GetMapping("/myBookMark") 
	public String myBookMark() { 
		return "mypage/myBookMark"; 
	}

	
	@PostMapping("/bookmark")
    public ResponseEntity<String> bookmark(@RequestBody BookMarkVO bookmarkRequest) {
        System.out.println("컨트롤러 동작?");
        myPageService.addBookMark(bookmarkRequest);
        return null;
    }
	
	
}
