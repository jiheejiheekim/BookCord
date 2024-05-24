package com.book.cord.notice;

public class PageVO {
	
	private int cpage;			//현재 페이지 번호
	private int pageSize;		//한 페이지 당 보여줄 목록 개수 = 10
	private int totalCount;		//게시물 총 개수
	private int pageCount;		//전체 페이지 수
	private int pagingBlock; 	// 페이지 당 표시할 페이지 번호 수

	private int start;			//시작 페이지 번호
	private int end;			//끝 페이지 번호
	
	private int prevBlock;		//이전 5개(이전 블럭)
	private int nextBlock;		//이후 5개(이후 블럭)
	
	private String findType;	//검색 유형
	private String findKeyword;	//검색어

}
