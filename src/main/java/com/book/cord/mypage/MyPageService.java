package com.book.cord.mypage;

import java.util.List;

import com.book.cord.notice.Criteria;

public interface MyPageService {
		
	public void addBookMark(BookMarkVO vo);
	public int bookMarkTotal(String member_id);
	public List<BookMarkVO> getBookMarkList(Criteria cri, String member_id);
	
	public void addReview(ReviewVO vo);
	public int reviewTotal(String member_id);
	public List<BookMarkVO> getReviewList(Criteria cri, String member_id);
	public void reviewDelete(int review_num);
	public void reviewUpdate(ReviewVO vo);
	
}