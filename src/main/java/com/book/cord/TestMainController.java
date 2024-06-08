package com.book.cord;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.DetailBooks;
import com.book.cord.BookVO.GenresBestSeller;
import com.book.cord.BookVO.NewBooks;
import com.book.cord.BookVO.SearchBooks;

@Controller
public class TestMainController {

	@Autowired
	@Qualifier("bookServiceImpl")
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
    public String Best(@RequestParam("year") Integer year, @RequestParam("month") Integer month, Model model) {
    	BestSeller searchResult = bookService.getBestSeller(year, month);
    	if (searchResult != null) {
    		model.addAttribute("books", searchResult.getItem());
    	} else {
    		model.addAttribute("books", null);
    	}
    	return "testBest";
    }
    
    @GetMapping("/testBestYear")
    public String bestYear() {
        return "testBestYear";
    }
    
    @PostMapping("/testBestYear")
    public String postBestYear(@RequestParam("year") int year, @RequestParam("month") int month) {
        // POST 요청을 받은 후에 testBest.jsp로 리다이렉션
        return "redirect:/testBest?year=" + year + "&month=" + month;
    }

    
    
    @GetMapping("/search")
    public String showSearchForm() {
        return "search"; 
    }
    
  
    @PostMapping("/searchBooks")
    public String searchBooks(@RequestParam("query") String query, Model model) {
        SearchBooks searchResult = bookService.getSearchBooks(query);
        //if (searchResult != null && searchResult.getItem() != null && !searchResult.getItem().isEmpty()) {
            if (searchResult != null && searchResult.getItem() != null && !searchResult.getItem().isEmpty()) {
            model.addAttribute("books", searchResult.getItem());
            return "searchBooks"; // 뷰 이름 반환
        } else {
            model.addAttribute("books", null);
            return "search"; // 뷰 이름 반환
        }
    }


    @GetMapping("/bookDetail/{isbn13}")
    public String detail(@PathVariable("isbn13") String isbn13 ,Model model) {
        DetailBooks searchResult = bookService.getDetailBook(isbn13);
        if (searchResult != null) {
            model.addAttribute("items", searchResult.getItem());
			
			
        } else {
            model.addAttribute("items", null);
        }
        return "bookDetail";
    }

    
    @GetMapping("/testGenres")
    public String testGenres(Model model, @RequestParam("genreId") Integer genreId, 
			@RequestParam(value = "pageNumber", required = false, defaultValue = "1") Integer pageNumber) {
    	GenresBestSeller searchResult = bookService.getGenresBestSeller(genreId, pageNumber);
        if (searchResult != null) {
            model.addAttribute("books", searchResult.getItem());
        } else {
            model.addAttribute("books", null);
        }
        return "testGenres";
    }
    
    
}