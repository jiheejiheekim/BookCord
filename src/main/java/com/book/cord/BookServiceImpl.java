package com.book.cord;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.NewBooks;
import com.book.cord.BookVO.SearchBooks;

@Service
public class BookServiceImpl implements BookService {
	
	//상품 리스트 API
    private static final String API_URL1 = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    
    //상품 검색 API
    private static final String API_URL2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    //public String query;	//검색어
    
    //상품 조회 API
    
    
    private static final String API_KEY = "ttbfldpf20031555001";

    private final RestTemplate restTemplate;

    public BookServiceImpl(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @Override	//신간도서
    public NewBooks getNewBooks() {
        String url = API_URL1 + "?ttbkey=" + API_KEY + "&QueryType=ItemNewAll&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101";
        return restTemplate.getForObject(url, NewBooks.class);
    }
    
    @Override	//베스트셀러
    public BestSeller getBestSeller() {
    	String url = API_URL1 + "?ttbkey=" + API_KEY + "&QueryType=Bestseller&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101";
    	return restTemplate.getForObject(url, BestSeller.class);
    }
    
    @Override	//상품 검색 제목+저자(기본값)
    public SearchBooks getSearchBooks(String query) {
    	String url = API_URL2 + "?ttbkey=" + API_KEY + "&Query=" + query + "&QueryType=Keyword&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101";
    	return restTemplate.getForObject(url, SearchBooks.class);
    }
    
    
    
}