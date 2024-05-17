package com.book.cord.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	/*
	@GetMapping("/login") 
	public String login() { 
		
		
		
		return "login/login"; 
	}
	
	@GetMapping("/vip")
	public String vip() {
		return "login/vip";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "login/admin";
	}	
	*/
	
	@RequestMapping("/vip")
	public String vip(Model model) {
		return "vip";
	}	
	
	@RequestMapping("/admin")
	public String admin(Model model) {
		return "admin";
	}
	
	@RequestMapping("/hahaha")
	public String index(Model model) {
		return "hahaha";
	}
	
	@RequestMapping("/loginPage")	
	public String login(Model model) {
		return "loginPage";
	}
	
}
