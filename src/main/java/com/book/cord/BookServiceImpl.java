package com.book.cord;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.DetailBooks;
import com.book.cord.BookVO.GenresBestSeller;
import com.book.cord.BookVO.GenresNewBooks;
import com.book.cord.BookVO.NewBooks;
import com.book.cord.BookVO.SearchBooks;
import com.book.cord.board.Criteria;
import com.book.cord.book.BookDAO;
import com.book.cord.mypage.ReviewVO;

@Service("bookServiceImpl")
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
    
    @Autowired
    @Qualifier("bookDAOImpl")
    BookDAO dao;

    @Override	// 신간도서
    public NewBooks getNewBooks() {
        String url = API_URL1 + "?ttbkey=" + API_KEY + "&QueryType=ItemNewAll&MaxResults=4&start=1&SearchTarget=Book&output=js&Version=20131101";
        return restTemplate.getForObject(url, NewBooks.class);
    }
    
    @Override	//메인 - 베스트셀러
    public BestSeller getMainBestSeller() {
    	String url = API_URL1 + "?ttbkey=" + API_KEY + "&QueryType=Bestseller&MaxResults=4"
    			/*+ "&start=1&SearchTarget=Book&output=js&Version=20131101&Year=" + year +"&Month=" + month + "&Week=3";*/
    			//현재의 베스트셀러 표출을 위해 주석처리
    	+ "&start=1&SearchTarget=Book&output=js&Version=20131101";
    	return restTemplate.getForObject(url, BestSeller.class);
    }
    
    @Override	// 베스트셀러
    public BestSeller getBestSeller(int year, int month) {
    	String url = API_URL1 + "?ttbkey=" + API_KEY + "&QueryType=Bestseller&MaxResults=15"
    			+ "&start=1&SearchTarget=Book&output=js&Version=20131101&Year=" + year +"&Month=" + month + "&Week=3";
    	return restTemplate.getForObject(url, BestSeller.class);
        
    }
    
    @Override	// 상품 검색 제목+저자(기본값)
    public SearchBooks getSearchBooks(String query) {
    	String url = API_URL2 + "?ttbkey=" + API_KEY + "&Query=" + query + "&QueryType=Keyword&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101";
    	return restTemplate.getForObject(url, SearchBooks.class);
    }
    
    
    @Override	// 상품 검색 제목+저자(기본값)
    public SearchBooks getSearchBooks2(String query, Integer pageNumber) {
    	String url = API_URL2 + "?ttbkey=" + API_KEY + "&Query=" + query + "&QueryType=Keyword&MaxResults=10" 
    			+ "&start=" + pageNumber + "&SearchTarget=Book&output=js&Version=20131101";
        return restTemplate.getForObject(url, SearchBooks.class);
    }
    
    @Override	// 도서상세페이지
    public DetailBooks getDetailBook(String isbn13) {
    	String url = API_URL3 + "?ttbkey=" + API_KEY + "&itemIdType=ISBN13&ItemId="+ isbn13 +"&output=js&Version=20131101"
    			+ "&OptResult=ebookList,usedList,reviewList,bestSellerRank,fulldescription,toc,categoryIdList,authors,ratingInfo,packing,subInfo,Story";
    	
    	return restTemplate.getForObject(url, DetailBooks.class);
    }
    
    @Override	//장르별 베스트셀러 페이지
    public GenresBestSeller getGenresBestSeller(Integer genreId, Integer pageNumber) {
    	String url = API_URL1 + "?ttbkey=" + API_KEY + "&QueryType=Bestseller&MaxResults=10"
    			+ "&start=" + pageNumber +"&SearchTarget=Book&output=js&Version=20131101&CategoryId=" + genreId;	//카테고리아이디 : 종합(), 건강/취미/레저(55890)
    	return restTemplate.getForObject(url, GenresBestSeller.class);
    }
    
    @Override	//장르별 베스트셀러 페이지
    public GenresNewBooks getGenresNewBooks(Integer genreId, Integer pageNumber) {
    	String url = API_URL1 + "?ttbkey=" + API_KEY + "&QueryType=ItemNewAll&MaxResults=10"
    			+ "&start=" + pageNumber +"&SearchTarget=Book&output=js&Version=20131101&CategoryId=" + genreId;	//카테고리아이디 : 종합(), 건강/취미/레저(55890)
    	return restTemplate.getForObject(url, GenresNewBooks.class);
    }
    
        
    @Override	//detail페이지의 리뷰 목록 가져오기
    public List<ReviewVO> getDetailReviewList(Criteria cri, String isbn13) {
    	System.out.println("Service getDetailReviewList 호출");
        return dao.getDetailReviewList(cri, isbn13);
    }
    
    @Override
    public int detailReviewTotal(String isbn13) {
    	System.out.println("Service detailReviewTotal 호출");
    	return dao.detailReviewTotal(isbn13);
    }
}
