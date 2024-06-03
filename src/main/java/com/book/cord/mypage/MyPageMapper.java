package com.book.cord.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.book.cord.notice.Criteria;

@Mapper
public interface MyPageMapper {
	
	void insertBookMark(BookMarkVO vo);
	public List<BookMarkVO> getListWithPaging(Criteria cri, String member_id);
	public int totalCount();
}
