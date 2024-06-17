package com.book.cord.board;

import lombok.Data;

@Data
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	private int displayPageNum = 5; // 한 번에 보여줄 페이지 번호의 개수 (5개로 설정)
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
        this.total = total;

        this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) displayPageNum)) * displayPageNum;
        this.startPage = this.endPage - displayPageNum + 1;

        int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

        if (realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
	}
	
}
