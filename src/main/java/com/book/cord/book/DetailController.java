package com.book.cord.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.client.RestTemplate;

import com.book.cord.BookService;
import com.book.cord.BookVO.DetailBooks;

@Controller
public class DetailController {
	
	//상품 리스트 API
    private static final String API_URL1 = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    
    //상품 검색 API
    private static final String API_URL2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    
    //상품 조회 API
    private static final String API_URL3 = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
    
    private static final String API_KEY = "ttbfldpf20031555001";

    public final RestTemplate restTemplate = new RestTemplate();

    @Autowired
	@Qualifier("bookServiceImpl")
	private final BookService bookService;
	
	@Autowired // BookService 주입
    public DetailController(BookService bookService) {
        this.bookService = bookService;
    }
	
	
	@GetMapping("/detail")
	public String detail() {
		return "book/detail";
	}
	
	
	@GetMapping("/detail/{isbn13}")
    public String detail(@PathVariable("isbn13") String isbn13 ,Model model) {
        DetailBooks searchResult = bookService.getDetailBook(isbn13);
        if (searchResult != null) {
            model.addAttribute("items", searchResult.getItem());
            System.out.println(searchResult.getItem());
        } else {
            model.addAttribute("items", null);
        }
        return "book/detail";
    }

}
