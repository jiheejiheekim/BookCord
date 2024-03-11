package com.book.cord;

import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.xml.MappingJackson2XmlHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.DetailBooks;
import com.book.cord.BookVO.NewBooks;
import com.book.cord.BookVO.SearchBooks;

@Service
public class BookServiceImpl implements BookService {
	
	// 상품 리스트 API
    private static final String API_URL1 = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    
    // 상품 검색 API
    private static final String API_URL2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    
    // 상품 조회 API
    private static final String API_URL3 = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
    
    private static final String API_KEY = "ttbfldpf20031555001";

    private final RestTemplate restTemplate;

    
    public BookServiceImpl(RestTemplate restTemplate) {
    	this.restTemplate = restTemplate;
    }

    @Override	// 신간도서
    public NewBooks getNewBooks() {
        String url = API_URL1 + "?ttbkey=" + API_KEY + "&QueryType=ItemNewAll&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101";
        return restTemplate.getForObject(url, NewBooks.class);
    }
    
    @Override	// 베스트셀러
    public BestSeller getBestSeller() {
    	String url = API_URL1 + "?ttbkey=" + API_KEY + "&QueryType=Bestseller&MaxResults=15"
    			+ "&start=1&SearchTarget=Book&output=js&Version=20131101";
    	return restTemplate.getForObject(url, BestSeller.class);
    	
    }
    
    @Override	// 상품 검색 제목+저자(기본값)
    public SearchBooks getSearchBooks(String query) {
    	String url = API_URL2 + "?ttbkey=" + API_KEY + "&Query=" + query + "&QueryType=Keyword&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101";
    	return restTemplate.getForObject(url, SearchBooks.class);
    }
    
    @Override	// 도서상세페이지
    public DetailBooks getDetailBook(String isbn) {
    	/*String url = API_URL3 + "?ttbkey=" + API_KEY + "&itemIdType=ISBN13&ItemId="+ isbn13 +"&output=js&Version=20131101"
    			+ "&OptResult=ebookList,usedList,reviewList,fulldescription,Toc,categoryIdList,authors,ratingInfo,packing,subInfo,Story";*/
    	//String url = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=" + API_KEY + "&cover=big&ItemId=" + isbn + "&output=js";
    	String url = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=" + API_KEY + "&cover=big&ItemId=" + isbn + "&output=xml";

        // Set up a new RestTemplate instance that supports XML
    	RestTemplate xmlRestTemplate = new RestTemplate();
        xmlRestTemplate.getMessageConverters().add(new MappingJackson2XmlHttpMessageConverter());

        // Create a response entity with DetailBooks type to handle XML response
        ResponseEntity<DetailBooks> responseEntity = xmlRestTemplate.getForEntity(url, DetailBooks.class);

        // Extract DetailBooks from response entity
        DetailBooks detailBooks = responseEntity.getBody();

        return detailBooks;
    	//return restTemplate.getForObject(url, DetailBooks.class);
    }
    
    
}
