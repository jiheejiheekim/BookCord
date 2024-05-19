package com.book.cord.login;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
		
	@RequestMapping("/vip")
    @Secured("ROLE_USER")
    public String vip(Model model) {
        return "vip";
    }   
    
    @RequestMapping("/admin")
    @Secured("ROLE_ADMIN")
    public String admin(Model model) {
        return "admin";
    }
	
	@RequestMapping("/index")
	public String index(Model model) {
		return "index";
	}
	
	@RequestMapping("/loginPage")	
	public String loginPage(Model model) {
		return "loginPage";
	}
	
	@RequestMapping("/loginP")	
	public String loginP(Model model) {
		return "login/loginP";
	}
	
	
	
}
