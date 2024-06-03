package com.book.cord.mypage;

import java.util.List;

import com.book.cord.notice.Criteria;

public interface MyPageService {
		
	public void addBookMark(BookMarkVO vo);
	public int count(String member_id);
	public List<BookMarkVO> getList(Criteria cri, String member_id);
}