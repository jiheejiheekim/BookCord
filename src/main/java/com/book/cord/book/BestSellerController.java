package com.book.cord.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.cord.board.BookService;
import com.book.cord.board.BookVO.Book;
import com.book.cord.board.BookVO.GenresBestSeller;

@Controller
public class BestSellerController {
	
	@Autowired
	@Qualifier("bookServiceImpl")
	private final BookService bookService;
	
	public BestSellerController(BookService bookService) {
        this.bookService = bookService;
    }
	
	
	@GetMapping("/bestSeller")
    public String bestSeller(Model model, @RequestParam(required = false) Integer genreId, Integer pageNumber) {
    	GenresBestSeller searchResult;
    	if (genreId != null) {
    		searchResult = bookService.getGenresBestSeller(genreId, pageNumber);
    	} else {
    		searchResult = bookService.getGenresBestSeller(null, null);
    	}
    	
        if (searchResult != null) {
            model.addAttribute("books", searchResult.getItem());
        } else {
            model.addAttribute("books", null);
        }
        return "book/bestSeller";
    }
	
	@GetMapping("/getBestBooks")
	public String getBestGenre(Model model, @RequestParam("genreId") Integer genreId, 
			@RequestParam(value = "pageNumber", required = false, defaultValue = "1") Integer pageNumber) {
	    GenresBestSeller searchResult = bookService.getGenresBestSeller(genreId, pageNumber);
	    if (searchResult != null) {
	        List<Book> books = searchResult.getItem();
	        if (books != null) {
	            model.addAttribute("books", books);
	        }
	    }
	    return "book/bestSeller";
	}

	
	

}
