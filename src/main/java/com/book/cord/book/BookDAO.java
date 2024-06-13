package com.book.cord.book;

import java.util.List;

import com.book.cord.mypage.ReviewVO;
import com.book.cord.notice.Criteria;

public interface BookDAO {
	
	public List<ReviewVO> getDetailReviewList(Criteria cri, String isbn13);
	public int detailReviewTotal(String isbn13);
	
}
