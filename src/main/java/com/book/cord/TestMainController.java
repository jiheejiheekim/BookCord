package com.book.cord;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.DetailBooks;
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
    
    @PostMapping("/searchBooks")
    public String searchBooks(@RequestParam("query") String query, Model model) {
        SearchBooks searchResult = bookService.getSearchBooks(query);
        if (searchResult != null && searchResult.getItem() != null && !searchResult.getItem().isEmpty()) {
            model.addAttribute("books", searchResult.getItem());
        } else {
            model.addAttribute("books", null);
        }
        return "searchBooks";
    }


    @GetMapping("/bookDetail/{isbn13}")
    public String detail(@PathVariable("isbn13") String isbn13 ,Model model) {
        DetailBooks searchResult = bookService.getDetailBook(isbn13);
        if (searchResult != null) {
            model.addAttribute("items", searchResult.getItem());
			
			/*
			 * model.addAttribute("subInfo", searchResult.getSubInfo());
			 * model.addAttribute("packing", searchResult.getPacking());
			 */
			
        } else {
            model.addAttribute("items", null);
        }
        return "bookDetail";
    }

    
    
}