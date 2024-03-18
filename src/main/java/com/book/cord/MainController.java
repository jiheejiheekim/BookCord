package com.book.cord;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.book.cord.BookVO.BestSeller;

@Controller
public class MainController {
	
	//상품 리스트 API
    private static final String API_URL1 = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    
    //상품 검색 API
    private static final String API_URL2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    
    //상품 조회 API
    private static final String API_URL3 = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
    
    private static final String API_KEY = "ttbfldpf20031555001";

    public final RestTemplate restTemplate = new RestTemplate();

	private final BookService bookService;
	
	@Autowired // BookService 주입
    public MainController(BookService bookService) {
        this.bookService = bookService;
    }

    /*
	@GetMapping("/main") 
	public String main() { 
		return "main"; 
	}
	 */

	
    @GetMapping("/main")
    public String mainBest(Integer year, Integer month, Model model) {
    	BestSeller searchResult = bookService.getMainBestSeller(2024, 3);
    	if (searchResult != null) {
    		model.addAttribute("books", searchResult.getItem());
    	} else {
    		model.addAttribute("books", null);
    	}
    	return "main";
    }

}
