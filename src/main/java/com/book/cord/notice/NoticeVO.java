package com.book.cord.notice;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int notice_num;		//글번호
	private String title;		//글제목
	private String content;		//글내용
	private String member_id;	//작성자
	private Date reg_date;		//작성일 => TIMESTAMP
	private int hit;			//조회수
	private String files;		//첨부파일
	

}
