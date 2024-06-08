package com.book.cord.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.cord.BookService;
import com.book.cord.BookVO.Book;
import com.book.cord.BookVO.GenresNewBooks;
import com.book.cord.BookVO.SearchBooks;

@Controller
public class SearchBookController {
	
	@Autowired
	@Qualifier("bookServiceImpl")
	private final BookService bookService;
	
	public SearchBookController(BookService bookService) {
        this.bookService = bookService;
    }
	
	@PostMapping("searchBook")
	public String searchBook(@RequestParam("query") String query, 
			@RequestParam(value = "pageNumber", required = false, defaultValue = "1") Integer pageNumber, Model model) {
		System.out.println("---------- "+query+"로 검색한 결과");
		//SearchBooks searchResult = bookService.getSearchBooks(query);
		SearchBooks searchResult = bookService.getSearchBooks2(query,  pageNumber);
		if (searchResult != null && searchResult.getItem() != null && !searchResult.getItem().isEmpty()) {
			List<Book> books = searchResult.getItem();
			if (books != null) {
	            model.addAttribute("books", books);
	        }
			//model.addAttribute("books", searchResult.getItem());
			model.addAttribute("searchQuery", query);
			return "book/searchBook"; // 뷰 이름 반환
		} else {
			model.addAttribute("books", null);
			return "main"; // 뷰 이름 반환
		}
	}
	
	@GetMapping("/getSearchBook")
	public String getSearchBook(@RequestParam("query") String query, 
			@RequestParam(value = "pageNumber", required = false, defaultValue = "1") Integer pageNumber, Model model) {
		SearchBooks searchResult = bookService.getSearchBooks2(query, pageNumber);
	    if (searchResult != null) {
	        List<Book> books = searchResult.getItem();
	        if (books != null) {
	            model.addAttribute("books", books);
	        }
	        model.addAttribute("searchQuery", query);
	    }
	    return "book/searchBook";
	}

}
