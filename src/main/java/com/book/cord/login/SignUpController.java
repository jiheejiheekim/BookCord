package com.book.cord.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignUpController {
	
	@GetMapping("/signUp") 
	public String login() { 
		return "login/signUp"; 
	}
}
