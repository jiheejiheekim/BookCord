package com.book.cord.book;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.cord.BookService;
import com.book.cord.BookVO.Book;
import com.book.cord.BookVO.GenresBestSeller;

@Controller
public class BestSellerController {
	
	private final BookService bookService;
	
	public BestSellerController(BookService bookService) {
        this.bookService = bookService;
    }
	
	
	@GetMapping("/bestSeller")
    public String bestSeller(Model model, @RequestParam(required = false) Integer genreId) {
    	GenresBestSeller searchResult = bookService.getGenresBestSeller(genreId);	// 특정 장르의 베스트셀러 가져오기
    	
        if (searchResult != null) {
            model.addAttribute("books", searchResult.getItem());
        } else {
            model.addAttribute("books", null);
        }
        return "book/bestSeller";
    }
	
	@GetMapping("/getBooks")
	public String getBooksByGenre(@RequestParam("genreId") Integer genreId, Model model) {
	    GenresBestSeller searchResult = bookService.getGenresBestSeller(genreId);
	    if (searchResult != null) {
	        List<Book> books = searchResult.getItem();
	        model.addAttribute("books", books);
	    }
	    return "book/bestSeller"; // 장르별 책 목록을 보여줄 JSP 페이지 이름
	}

}
