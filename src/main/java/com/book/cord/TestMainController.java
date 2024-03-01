package com.book.cord;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestMainController {

    private final BookService bookService;

    public TestMainController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/testmain")
    public String main(Model model) {
        BookService.SearchResult searchResult = bookService.getNewBooks();
        if (searchResult != null) {
            model.addAttribute("books", searchResult.getItem());
        } else {
            model.addAttribute("books", null); // 검색 결과가 없을 경우, books를 null로 설정
        }
        return "testmain";
    }
}
