package com.book.cord;

import lombok.Data;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
public class BookService {
    private static final String API_URL = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    private static final String API_KEY = "ttbfldpf20031555001";

    private final RestTemplate restTemplate;

    public BookService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public SearchResult getNewBooks() {
        String url = API_URL + "?ttbkey=" + API_KEY + "&QueryType=ItemNewAll&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101";
        return restTemplate.getForObject(url, SearchResult.class);
    }

    @Data
    public static class SearchResult {
        private List<Book> item;
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
