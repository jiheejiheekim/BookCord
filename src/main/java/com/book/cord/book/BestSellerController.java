package com.book.cord.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BestSellerController {
	
	@GetMapping("/bestSeller") 
	public String bestSeller() { 
		return "book/bestSeller"; 
	}

}
