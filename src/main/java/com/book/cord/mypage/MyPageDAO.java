package com.book.cord.mypage;

public interface MyPageDAO {
	
	//public void insertBookMark(String member_id, String title, String author, String isbn13, String cover);
	public void insertBookMark(BookMarkVO bookmarkRequest);
}
