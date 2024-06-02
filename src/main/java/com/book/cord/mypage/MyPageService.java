package com.book.cord.mypage;

public interface MyPageService {
	
	 //boolean addBookmark(String member_id, String title, String author, String isbn13, String cover);
	public void addBookMark(BookMarkVO request);
}