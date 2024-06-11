package com.book.cord.mypage;

import java.util.List;

import com.book.cord.notice.Criteria;

public interface MyPageDAO {
	
	public void insertBookMark(BookMarkVO vo);
	public int bookMarkTotalCount(String member_id);
	public List<BookMarkVO> getBookMarkListPaging(Criteria cri, String member_id);
	public boolean isBookMarked(String member_id, String isbn13);
	
	public void insertReview(ReviewVO vo);
	public int reviewTotalCount(String member_id);
	public List<BookMarkVO> getReviewListPaging(Criteria cri, String member_id);
	public void deleteReview(int review_num);
	public void updateReview(ReviewVO vo);
}
