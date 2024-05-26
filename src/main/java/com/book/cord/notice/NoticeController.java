package com.book.cord.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeServiceImpl")
	NoticeService service;
	
	@Autowired
	NoticeMapper mapper;
	
	/*
	@GetMapping("/notice") 
	public String memberEdit() { 
		return "notice/notice"; 
	}
	*/
	/*@GetMapping("/notice") 
	public String list(Model model) throws Exception {
		List<NoticeVO> list = service.list();
		int totalCount = service.count();

	    System.out.println("컨트롤러 로그 출력 Notices: " + list); // 로그 출력
	    //model.addAttribute("list", list);

	    //책 추가
	    model.addAttribute("list", service.getList(null));
	    model.addAttribute("totalCount", totalCount);
	    
		return "notice/notice";
	}*/
	
	@GetMapping("/notice") 
	public String list(Criteria cri, Model model) throws Exception {
		System.out.println("컨트롤러 로그 출력 Notices: " + cri); // 로그 출력
		
		List<NoticeVO> list = service.getList(cri);
        model.addAttribute("list", list);
        
		int totalCount = service.count();
		model.addAttribute("totalCount", totalCount);
	    
	    PageDTO pageMaker = new PageDTO(cri, totalCount);
        model.addAttribute("pageMaker", pageMaker);
        
	    
		return "notice/notice";
	}
	

}
