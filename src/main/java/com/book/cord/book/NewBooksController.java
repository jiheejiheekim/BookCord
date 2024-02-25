package com.book.cord.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewBooksController {
	
	@GetMapping("/newBooks") 
	public String bestSeller() { 
		return "book/newBooks"; 
	}

}
