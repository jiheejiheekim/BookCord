package com.book.cord.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.book.cord.board.Criteria;
import com.book.cord.login.MemberVO;

@Mapper
public interface MyPageMapper {
	
	void insertBookMark(BookMarkVO vo);
	public int bookMarkTotalCount();
	public List<BookMarkVO> getBookMarkListPaging(Criteria cri, String member_id);
	public boolean isBookMarked(String member_id, String isbn13);
	
	public void insertReview(BookMarkVO vo);
	public int reviewTotalCount(String member_id);
	public List<BookMarkVO> getReviewListPaging(Criteria cri, String member_id);
	public void deleteReview(int review_num);
	public void updateReview(ReviewVO vo);
	
	public String getMemberInfo(String id);
	public int nameCheck(String name);
	public void memberUpdate(MemberVO member);
	
	public List<MemberVO> getAllMemberInfo(Criteria cri);
	public void enabledEditFalse(String id);
	public void enabledEditTrue(String id);
	public void roleDelAdmin(String id);
	public void roleAddAdmin(String id);
	public void memberDelete(String id);
	
}
