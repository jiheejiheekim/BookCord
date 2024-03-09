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
    public static class DetailBooks {
    	private Book []item;
    	private Book subInfo;
    	private Book packing;
    	private Book ratingScore;
    	private Book ratingInfo;
        private String errorCode;
    }

    @Data
    public static class Book {
    	//item의 하위정보
        private String title;			//상품명
        private String author;			//저자/아티스트
        private Date pubDate;			//출간일
        private String description;		//상품설명(요약)
        private String isbn13;			//ISBN(13자리 ISBN)
        private String publisher;		//출판사(제작자/출시사)
        private String cover;			//커버이미지
        private int customerReviewRank;	//알라딘회원리뷰평점(별점 평균):0~10점(별0.5개당 1점)
        
        private int pricesales;			//판매가
        private int pricestandard;		//정가
        
        //주)전체 분야 정보 - 카테고리 명
        private String categoryName;		
        
        //subInfo의 하위정보
        private int itemPage;			//상품의쪽수(정수x 숫자o)
        private String toc;				//주)목차
        
        //ratingScore의 하위정보
        private double ratingScore;		//상품의별평점
        private double ratingCount;		//상품에별을남긴개수
        
        //packing의 하위정보
        private int weight;				//무게(그램 기준)
        
        /*주)는 알라딘 API에서 일반적인 스펙에는 포함되지 않고, 별도로 협의 후 제공*/
    }
}