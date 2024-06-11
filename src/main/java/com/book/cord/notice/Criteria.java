package com.book.cord.notice;

import lombok.Data;

@Data
public class Criteria {	//생성자를 통해 기본값을 1페이지, 10로 지정해서 처리
	
	private int pageNum;
	private int amount;
	private int startRow; // 시작 행
    private int endRow;   // 끝 행
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
