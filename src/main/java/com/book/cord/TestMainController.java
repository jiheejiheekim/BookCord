package com.book.cord;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.NewBooks;
import com.book.cord.BookVO.SearchBooks;

@Controller
public class TestMainController {

    private final BookService bookService;

    public TestMainController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/testNew")
    public String New(Model model) {
        NewBooks searchResult = bookService.getNewBooks();
        if (searchResult != null) {
            model.addAttribute("books", searchResult.getItem());
        } else {
            model.addAttribute("books", null);
        }
        return "testNew";
    }
    
    
    @GetMapping("/testBest")
    public String Best(Model model) {
    	BestSeller searchResult = bookService.getBestSeller();
    	if (searchResult != null) {
    		model.addAttribute("books", searchResult.getItem());
    	} else {
    		model.addAttribute("books", null);
    	}
    	return "testBest";
    }
    
    
    @GetMapping("/search")
    public String showSearchForm() {
        return "search"; 
    }
    
    @PostMapping("/searchBooks") // POST 방식으로 요청을 처리하는 엔드포인트
    public String searchBooks(@RequestParam("query") String query, Model model) {
        SearchBooks searchResult = bookService.getSearchBooks(query);
        if (searchResult != null && searchResult.getItem() != null && !searchResult.getItem().isEmpty()) {
            model.addAttribute("books", searchResult.getItem());
        } else {
            model.addAttribute("books", null);
        }
        return "searchBooks"; // 검색 결과를 표시하는 searchBooks.jsp 파일을 나타냄
    }


    
    
    
}