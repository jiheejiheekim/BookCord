package com.book.cord;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.book.cord.book.BookService;
import com.book.cord.book.BookVO.BestSeller;
import com.book.cord.book.BookVO.NewBooks;

@Controller
public class MainController {
	
	//상품 리스트 API
    private static final String API_URL1 = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    
    //상품 검색 API
    private static final String API_URL2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    
    //상품 조회 API
    private static final String API_URL3 = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
    
    private static final String API_KEY = "ttbfldpf20031555001";

    public RestTemplate restTemplate = new RestTemplate();

	private BookService bookService;
	
	@Autowired // BookService 주입
    public MainController(@Qualifier("bookServiceImpl") BookService bookService) {
        this.bookService = bookService;
    }

	
	@GetMapping("/main")
	public String mainBooks(Model model) {
		//베스트셀러
    	BestSeller searchResult1 = bookService.getMainBestSeller();
    	if (searchResult1 != null) {
    		model.addAttribute("bestSeller", searchResult1.getItem());
    	} else {
    		model.addAttribute("bestSeller", null);
    	}
    	
    	//신간도서
        NewBooks searchResult2 = bookService.getMainNewBooks();
        if (searchResult2 != null) {
            model.addAttribute("newBook", searchResult2.getItem());
        } else {
            model.addAttribute("newBook", null);
        }
        return "main";
    }
    
    
}
