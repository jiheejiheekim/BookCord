package com.book.cord.book;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.cord.BookService;
import com.book.cord.BookVO.Book;
import com.book.cord.BookVO.GenresBestSeller;
import com.book.cord.BookVO.GenresNewBooks;

@Controller
public class NewBooksController {
	
	private final BookService bookService;
	
	public NewBooksController(BookService bookService) {
        this.bookService = bookService;
    }
	
	
	@GetMapping("/newBooks")
    public String bestSeller(Model model, @RequestParam(required = false) Integer genreId, Integer pageNumber) {
		GenresNewBooks searchResult;
    	if (genreId != null) {
    		searchResult = bookService.getGenresNewBooks(genreId, pageNumber);
    	} else {
    		searchResult = bookService.getGenresNewBooks(null, null);
    	}
    	
        if (searchResult != null) {
            model.addAttribute("books", searchResult.getItem());
        } else {
            model.addAttribute("books", null);
        }
        return "book/newBooks";
    }
	
	@GetMapping("/getNewBooks")
	public String getNewGenre(Model model, @RequestParam("genreId") Integer genreId, 
			@RequestParam(value = "pageNumber", required = false, defaultValue = "1") Integer pageNumber) {
		GenresNewBooks searchResult = bookService.getGenresNewBooks(genreId, pageNumber);
	    if (searchResult != null) {
	        List<Book> books = searchResult.getItem();
	        if (books != null) {
	            model.addAttribute("books", books);
	        }
	    }
	    return "book/newBooks";
	}

}
