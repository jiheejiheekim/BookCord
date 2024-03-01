package com.book.cord;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;

@Controller
public class TestMainController {

    @Autowired
    private RestTemplate restTemplate;

    private static final String API_URL = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    private static final String API_KEY = "ttbfldpf20031555001";

    @GetMapping("/testmain")
    public String main() {
        return "testmain";
    }

    @GetMapping("/search")
    public String searchBooks(Model model) {

        String url = API_URL + "?ttbkey=" + API_KEY + "&QueryType=ItemNewAll"
                + "&MaxResults=10&start=1&SearchTarget=Book&output=json&Version=20131101";

        String jsonResponse = restTemplate.getForObject(url, String.class);

        // JSON 데이터를 SearchResult 객체로 변환
        SearchResult searchResult = convertJsonToSearchResult(jsonResponse);

        if (searchResult != null && searchResult.getBooks() != null && !searchResult.getBooks().isEmpty()) {
            model.addAttribute("books", searchResult.getBooks());
        } else {
            model.addAttribute("books", null); // 검색 결과가 없을 경우, books를 null로 설정
        }

        return "search";
    }

    // JSON 데이터를 SearchResult 객체로 변환하는 메서드
    private SearchResult convertJsonToSearchResult(String json) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            SearchResult searchResult = objectMapper.readValue(json, SearchResult.class);
            return searchResult;
        } catch (IOException e) {
            e.printStackTrace();
            return null; // 변환 실패 시 null 반환
        }
    }

    @Data
    public static class SearchResult {
        private List<Book> books;
        private String errorCode;
    }

    @Data
    public class Book {
        private String title;
        private String author;
        private String publisher;
        private String isbn;
    }
}
