package com.book.cord.mypage;

import java.util.List;

import com.book.cord.notice.Criteria;

public interface MyPageDAO {
	
	public void insertBookMark(BookMarkVO vo);
	public int totalCount(String member_id);
	public List<BookMarkVO> getListWithPaging(Criteria cri, String member_id);
}
