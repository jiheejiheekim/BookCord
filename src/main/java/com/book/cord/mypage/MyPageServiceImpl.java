package com.book.cord.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.book.cord.login.CustomUserDetails;
import com.book.cord.notice.Criteria;

@Service("myPageServiceImpl")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	@Qualifier("myPageDAOImpl")
	MyPageDAO dao;
	
	@Autowired
    HttpServletRequest request;
			
	@Override
	public void addBookMark(BookMarkVO vo) {
		dao.insertBookMark(vo);
	}
	
	@Override
	public int bookMarkTotal(String member_id) {
		System.out.println("Service bookMarkTotal 호출");
		return dao.bookMarkTotalCount(member_id);
	}
	
	@Override
	public List<BookMarkVO> getBookMarkList(Criteria cri, String member_id){
		System.out.println("Service getBookMarkList 호출");
		
        return dao.getBookMarkListPaging(cri, member_id);
    }
	
	//////////////////////////////////
	
	
	@Override
	public void addReview(ReviewVO vo) {
		dao.insertReview(vo);
	}

	@Override
	public int reviewTotal(String member_id) {
		System.out.println("Service reviewTotal 호출");
		return dao.reviewTotalCount(member_id);
	}
	
	@Override
	public List<BookMarkVO> getReviewList(Criteria cri, String member_id){
		System.out.println("Service getReviewList 호출");
		
        return dao.getReviewListPaging(cri, member_id);
    }
	
	@Override
	public void reviewDelete(int review_num) {
		dao.deleteReview(review_num);
	}
	
	
	@Override
	public void reviewUpdate(ReviewVO vo) {
		dao.updateReview(vo);
	}
	
	
	
}
