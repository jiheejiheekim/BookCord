package com.book.cord.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.book.cord.notice.Criteria;

@Mapper
public interface MyPageMapper {
	
	void insertBookMark(BookMarkVO vo);
	public int bookMarkTotalCount();
	public List<BookMarkVO> getBookMarkListPaging(Criteria cri, String member_id);
	
	public void insertReview(BookMarkVO vo);
	public int reviewTotalCount(String member_id);
	public List<BookMarkVO> getReviewListPaging(Criteria cri, String member_id);
	public void updateReview(ReviewVO vo);
}
