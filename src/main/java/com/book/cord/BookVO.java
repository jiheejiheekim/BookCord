package com.book.cord;

import java.util.Date;
import java.util.List;

import lombok.Data;

public class BookVO {
    
    @Data
    public static class NewBooks {
        private List<Book> item;
    }
    
    @Data
    public static class BestSeller {
    	private List<Book> item;
    }
    
    @Data
    public static class SearchBooks {
    	private List<Book> item;
    }
    
    @Data
    public static class DetailBooks {
    	private List<Book> item;
    }

    @Data
    public static class Book {
    	//item의 하위정보
        private String title;			//상품명
        private String author;			//저자/아티스트
        private Date pubDate;			//출간일
        private String description;		//상품설명(요약)
        private String isbn;			//ISBN(10자리 ISBN)
        private String isbn13;			//ISBN(13자리 ISBN)
        private String publisher;		//출판사(제작자/출시사)
        private String cover;			//커버이미지
        private int customerReviewRank;	//알라딘회원리뷰평점(별점 평균):0~10점(별0.5개당 1점)
        private int priceSales;			//판매가
        private int priceStandard;		//정가
        private String categoryName;	//주)전체 분야 정보 - 카테고리 명
        private String fullDescription;	//주)책소개
        
        //subInfo의 하위정보
        private SubInfo subInfo;
        private SubInfo itemPage;		//상품의쪽수(정수x 숫자o) => Integer 시 에러
        
        
        private Bookinfo bookinfo;         	//주)목차
        private Bookinfo toc;         	//주)목차
        private SubInfo subTitle;       //부제
        
        //ratingScore의 하위정보
        private RatingInfo ratingScore;		//상품의별평점
        private RatingInfo ratingCount;		//상품에별을남긴개수
        
        //packing의 하위정보
        private Packing weight;				//무게(그램 기준)
        
        //*주)는 알라딘 API에서 일반적인 스펙에는 포함되지 않고, 별도로 협의 후 제공*/
    }
    
    @Data
    public static class SubInfo {
        // subInfo의 하위정보
        private Integer itemPage;		//상품의쪽수(정수x 숫자o)
        private String toc;         	//주)목차
        private String originalTitle;   //원제
        private String subTitle;      	//부제
        
        private RatingInfo ratingInfo;
        private Packing packing;
        
    }
    
    @Data
    public static class Bookinfo {
    	// subInfo의 하위정보
    	private Integer itemPage;		//상품의쪽수(정수x 숫자o)
    	private String toc;         	//주)목차
    	private String originalTitle;   //원제
    	private String subTitle;      	//부제
    	
    	
    }
    
    @Data
    public static class RatingInfo {
    	// ratingScore의 하위정보
    	private float ratingScore;		//상품의별평점
        private int ratingCount;		//상품에별을남긴개수
    }
    
    @Data
    public static class Packing {
    	// packing의 하위정보
    	private int weight;				//무게(그램 기준)
    }
    
}