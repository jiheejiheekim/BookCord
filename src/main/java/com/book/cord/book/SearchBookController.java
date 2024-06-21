package com.book.cord.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.cord.board.BookService;
import com.book.cord.board.BookVO.Book;
import com.book.cord.board.BookVO.SearchBooks;

@Controller
public class SearchBookController {
	
	@Autowired
	@Qualifier("bookServiceImpl")
	private final BookService bookService;
	
	public SearchBookController(BookService bookService) {
        this.bookService = bookService;
    }
	
	//메인에서 검색하면 실행되는 post
	@GetMapping("/searchBook")
	public String searchBook(@RequestParam("query") String query, 
	        @RequestParam(value = "pageNumber", required = false, defaultValue = "1") Integer pageNumber, Model model) {
	    System.out.println("---------- "+query+"로 검색한 결과");
	    SearchBooks searchResult = bookService.getSearchBooks(query,  pageNumber);
	   
	    if (searchResult != null && searchResult.getItem() != null && !searchResult.getItem().isEmpty()) {
	        List<Book> books = searchResult.getItem();
	        int totalResult = searchResult.getTotalResults();
	        if (books != null) {
	            model.addAttribute("books", books);
	        }
	        model.addAttribute("searchQuery", query);
	        model.addAttribute("totalResult", totalResult);
	        return "book/searchBook"; // 뷰 이름 반환
	    } else {
	        model.addAttribute("books", null);
	        return "main"; // 뷰 이름 반환
	    }
	}


	//검색 결과에서 페이지 넘길 시 ajax 요청
	@GetMapping("/getSearchBook")
	public String getSearchBook(@RequestParam("query") String query, 
			@RequestParam(value = "pageNumber", required = false, defaultValue = "1") Integer pageNumber, Model model) {
	    SearchBooks searchResult = bookService.getSearchBooks(query, pageNumber);

	    if (searchResult != null) {
	        List<Book> books = searchResult.getItem();
	        int totalResult = searchResult.getTotalResults();
	        if (books != null) {
	        	 model.addAttribute("books", books);
	        }
	        model.addAttribute("searchQuery", query);
	        model.addAttribute("totalResult", totalResult);
	        System.out.println(books);
	        System.out.println("검색어 : "+query+" / 페이지 : "+pageNumber+" / 전체페이지 : "+totalResult);
	    }
	    return "book/searchBook";
	}
	
}
