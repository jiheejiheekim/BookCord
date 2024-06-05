package com.book.cord.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeServiceImpl")
	NoticeService service;
	
	@Autowired
	NoticeMapper mapper;
			
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
	
	@GetMapping("/writeNotice")
	public String writeNotice() {
		return "notice/writeNotice";
	}
	
	@PostMapping("/insertNotice")
	public String insertNotice(@ModelAttribute("notice") NoticeVO notice){
		System.out.println("===============공지사항 작성 중 ===> " + notice + " !!!");
		try {
			service.write(notice);
		
			System.out.println("컨트롤러에서 서비스.inserNotice 호출!!!");
			return "redirect:/notice";
		} catch (Exception e) {
			System.out.println(" 실패 >>>>> 컨트롤러에서 inserNotice");
			e.printStackTrace();
			return "redirect:/";
		}
	}
	
	@GetMapping("/detailNotice/{notice_num}")
	public String detailNotice(@PathVariable("notice_num") int notice_num, Model model) {
		NoticeVO vo = service.getNotice(notice_num);
		if(vo != null) {
			model.addAttribute("notice", vo);
		}
		return "notice/detailNotice";
	}
	

}
