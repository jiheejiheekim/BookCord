package com.book.cord.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
		
	@GetMapping("/vip")
    @Secured("ROLE_USER")
    public String vip(Model model) {
        return "vip";
    }   
    
	@GetMapping("/admin")
    @Secured("ROLE_ADMIN")
    public String admin(Model model) {
        return "admin";
    }
	
    @GetMapping("/index")
	public String index(Model model) {
		return "index";
	}
	
	
	@GetMapping("/loginP")	
	public String loginP(Model model) {
		return "login/loginP";
	}
	
	
}
