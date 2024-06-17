package com.book.cord.book;

import java.util.List;

import com.book.cord.board.Criteria;
import com.book.cord.mypage.ReviewVO;

public interface BookDAO {
	
	public List<ReviewVO> getDetailReviewList(Criteria cri, String isbn13);
	public int detailReviewTotal(String isbn13);
	
}
