package com.book.cord.book;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.book.cord.BookService;
import com.book.cord.BookVO.GenresBestSeller;

@Controller
public class BestSellerController {
	
	private final BookService bookService;
	
	public BestSellerController(BookService bookService) {
        this.bookService = bookService;
    }
	
	
	
	@GetMapping("/bestSeller")
    public String bestSeller(Model model) {
    	GenresBestSeller searchResult = bookService.getGenresBestSeller();	//장르별 베스트셀러
        if (searchResult != null) {
            model.addAttribute("books", searchResult.getItem());
        } else {
            model.addAttribute("books", null);
        }
        return "book/bestSeller";
    }
	
}
