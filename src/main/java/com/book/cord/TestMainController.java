package com.book.cord;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import lombok.Data;

@Controller
public class TestMainController {

    private static final String API_URL = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    private static final String API_KEY = "ttbfldpf20031555001";

	/*
	 * @GetMapping("/testmain") 
	 * public String main() { 
	 * 		return "testmain"; 
	 * }
	 */

    @GetMapping("/testmain")
    public String main() {
        String newBooksJson = requestNewBooksFromAladdin();
        return newBooksJson;
    }

    private String requestNewBooksFromAladdin() {
        RestTemplate restTemplate = new RestTemplate();
        String url = API_URL + "?ttbkey=" + API_KEY + "&QueryType=ItemNewAll&MaxResults=10&start=1&SearchTarget=Book&output=json&Version=20131101";
        return restTemplate.getForObject(url, String.class);
    }
    
    @GetMapping("/bc/view")
    public String view() {
        return "testmain"; // testmain.jsp 파일을 렌더링하여 응답으로 반환
    }


    @Data
    public static class SearchResult {
        private List<Book> books;
        private String errorCode;
    }

    @Data
    public static class Book {
        private String title;
        private String author;
        private String publisher;
        private String isbn;
    }
}
