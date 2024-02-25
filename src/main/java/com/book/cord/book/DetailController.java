package com.book.cord.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DetailController {
	
	@GetMapping("/detail")
	public String detail() {
		return "book/detail";
	}

}
