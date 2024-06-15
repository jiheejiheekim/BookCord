package com.book.cord.notice;

import java.util.Arrays;
import java.util.Date;
import java.util.stream.Collectors;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FreeBoardVO {
	
	private int notice_num;		//글번호
	private String title;		//글제목
	private String content;		//글내용
	private String member_id;	//작성자
	private Date reg_date;		//작성일 => TIMESTAMP
	private int hit;			//조회수
	private String files;  		//첨부파일명
	
    
	// 파일 배열을 콤마로 구분된 문자열로 설정
    public void setFilesFromMultipartFileArray(MultipartFile[] files) {
        this.files = Arrays.stream(files)
                           .filter(file -> !file.isEmpty())
                           .map(MultipartFile::getOriginalFilename)
                           .collect(Collectors.joining(","));
    }

    // 콤마로 구분된 문자열을 파일명 배열로 변환
    public String[] getFilesArray() {
        return files != null ? files.split(",  ") : new String[0];
    }

}
