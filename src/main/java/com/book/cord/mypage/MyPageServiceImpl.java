package com.book.cord.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.book.cord.board.Criteria;
import com.book.cord.login.CustomPasswordEncoder;
import com.book.cord.login.MemberVO;

@Service("myPageServiceImpl")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	@Qualifier("myPageDAOImpl")
	MyPageDAO dao;
	
	@Autowired
    HttpServletRequest request;
	
	@Autowired
    private CustomPasswordEncoder passwordEncoder;
			
	@Override
	public void addBookMark(BookMarkVO vo) {
		dao.insertBookMark(vo);
	}
	
	////////////////////////////////////////////////////////////////////
	//나의 북마크
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
	
	@Override
	public boolean isBookMarked(String member_id, String isbn13) {
		System.out.println("Service isBookMarked 호출");
		
		return dao.isBookMarked(member_id, isbn13);
	}
	
	////////////////////////////////////////////////////////////////////
	//나의 리뷰
	
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
	public List<ReviewVO> getReviewList(Criteria cri, String member_id){
		System.out.println("Service getReviewList 호출");
		
        return dao.getReviewListPaging(cri, member_id);
    }
	
	@Override
	public void reviewDelete(int review_num) {
		System.out.println("Service reviewDelete 호출");
		
		dao.deleteReview(review_num);
	}
	
	
	@Override
	public void reviewUpdate(ReviewVO vo) {
		System.out.println("Service reviewUpdate 호출");
		
		dao.updateReview(vo);
	}
	
	////////////////////////////////////////////////////////////////////
	//회원정보 수정
	
	@Override
	public MemberVO getMemberInfo(String id) {
		System.out.println("Service getMemberInfo 호출");
		
		return dao.getMemberInfo(id);
	}
	
	@Override
    public int nameCheck(String name) {
    	System.out.println("name 중복체크 서비스");
    	int result=dao.nameCheck(name);
    	System.out.println("NAME 중복체크 결과 : "+result);
    	return result;
    }
	
	@Override
    public void memberUpdate(MemberVO member) {
        try {
            String encodedPassword = passwordEncoder.encode(member.getPwd());
            member.setPwd(encodedPassword);
            
            dao.memberUpdate(member); // MemberDAO를 통해 회원 추가
            
        } catch (Exception e) {
            System.out.println("Exception in registerMember"+e);
        }
    }
	
	@Override
	public void deleteAccount(String id) {
		System.out.println("관리자 service의 deleteAccount-------------");
		dao.deleteAccount(id);
	}
	
	////////////////////////////////////////////////////////////////////
	
	@Override
	public List<MemberVO> getAllMemberInfo() {	
		System.out.println("관리자 service의 getAllMemberInfo-------------");
		Criteria cri = new Criteria();
		return dao.getAllMemberInfo(cri);
	}
	
	@Override
	public void enabledEditFalse(String id) {
		System.out.println("관리자 service의 enabledEdit-------------");
		dao.enabledEditFalse(id);
	}
	
	@Override
	public void enabledEditTrue(String id) {
		System.out.println("관리자 service의 enabledEdit-------------");
		dao.enabledEditTrue(id);
	}
	
	@Override
	public void roleDelAdmin(String id) {
		System.out.println("관리자 service의 roleDelAdmin-------------");
		dao.roleDelAdmin(id);
	}
	
	@Override
	public void roleAddAdmin(String id) {
		System.out.println("관리자 service의 roleAddAdmin-------------");
		dao.roleAddAdmin(id);
	}
	
	@Override
	public void memberDelete(String id) {
		System.out.println("관리자 service의 memberDelete-------------");
		dao.memberDelete(id);
	}
	
	
}
