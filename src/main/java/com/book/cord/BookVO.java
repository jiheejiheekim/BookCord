package com.book.cord;

import java.util.Date;
import java.util.List;

import lombok.Data;

public class BookVO {
    
    @Data
    public static class NewBooks {
        private List<Book> item;
        private String errorCode;
    }
    
    @Data
    public static class BestSeller {
    	private List<Book> item;
    	private String errorCode;
    }
    
    @Data
    public static class SearchBooks {
    	private List<Book> item;
    	private String errorCode;
    }

    @Data
    public static class Book {
        private String title;			//상품명
        private String author;			//저자/아티스트
        private Date pubDate;			//출간일
        private String description;		//상품설명(요약)
        private int pricesales;			//판매가
        private int pricestandard;		//정가
        
        private String publisher;		//출판사(제작자/출시사)
        private String cover;			//커버
        private int customerReviewRank;	//회원리뷰평점평균
        
    }
}