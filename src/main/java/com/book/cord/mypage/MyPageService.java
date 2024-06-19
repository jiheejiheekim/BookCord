package com.book.cord.mypage;

import java.util.List;

import com.book.cord.board.Criteria;
import com.book.cord.login.MemberVO;

public interface MyPageService {
			
	public void addBookMark(BookMarkVO vo);
	public int bookMarkTotal(String member_id);
	public List<BookMarkVO> getBookMarkList(Criteria cri, String member_id);
	public boolean isBookMarked(String member_id, String isbn13);
	
	public void addReview(ReviewVO vo);
	public int reviewTotal(String member_id);
	public List<ReviewVO> getReviewList(Criteria cri, String member_id);
	public void reviewDelete(int review_num);
	public void reviewUpdate(ReviewVO vo);
	
	public MemberVO getMemberInfo(String id);
	public int nameCheck(String name);
	public void memberUpdate(MemberVO member);
	
	public List<MemberVO> getAllMemberInfo();
	public void enabledEditFalse(String id);
	public void enabledEditTrue(String id);
	public void roleDelAdmin(String id);
	public void roleAddAdmin(String id);
	
}