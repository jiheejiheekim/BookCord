package com.book.cord.mypage;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int review_num;
	private String member_id;
	private int stars;
	private String title;
	private String author;
    private String isbn13;
    private String cover;
    private String content;
    private Date reg_date;

}
