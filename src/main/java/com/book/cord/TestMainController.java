package com.book.cord;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.NewBooks;

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
    
}