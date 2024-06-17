package com.book.cord.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FreeBoardController {
	
	@Autowired
	@Qualifier("noticeServiceImpl")
	NoticeService service;
	
	@GetMapping("/freeBoard") 
	public String freeList(Criteria cri, Model model) throws Exception {
		System.out.println("컨트롤러 freeList(): " + cri);

		List<NoticeVO> list = service.getFreeBoardList(cri);
		model.addAttribute("list", list);

		int totalCount = service.totalFreeBoardCount();
		model.addAttribute("totalCount", totalCount);

		PageDTO pageMaker = new PageDTO(cri, totalCount);
		model.addAttribute("pageMaker", pageMaker);

		return "notice/freeBoard"; 
	}

}
