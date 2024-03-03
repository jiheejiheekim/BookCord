package com.book.cord;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.NewBooks;

@Service
public class BookServiceImpl implements BookService {
	
    private static final String API_URL = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    private static final String API_KEY = "ttbfldpf20031555001";

    private final RestTemplate restTemplate;

    public BookServiceImpl(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @Override
    public NewBooks getNewBooks() {
        String url = API_URL + "?ttbkey=" + API_KEY + "&QueryType=ItemNewAll&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101";
        return restTemplate.getForObject(url, NewBooks.class);
    }
    
    @Override
    public BestSeller getBestSeller() {
    	String url = API_URL + "?ttbkey=" + API_KEY + "&QueryType=Bestseller&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101";
    	return restTemplate.getForObject(url, BestSeller.class);
    }
    
}