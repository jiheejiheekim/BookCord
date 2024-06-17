package com.book.cord.book;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.book.cord.board.Criteria;
import com.book.cord.mypage.ReviewVO;

@Mapper
public interface BookMapper {
	
	public List<ReviewVO> getDetailReviewList(Criteria cri, String isbn13);
	public int detailReviewTotal(String isbn13);
	
}
