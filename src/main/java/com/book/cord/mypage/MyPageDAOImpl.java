package com.book.cord.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.cord.login.MemberVO;
import com.book.cord.notice.Criteria;

@Repository("myPageDAOImpl")
public class MyPageDAOImpl implements MyPageDAO {

	private final String NAMESPACE = "com.book.cord.mypage.MyPageMapper";

	@Autowired
	private MyPageMapper myPageMapper;

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBookMark(BookMarkVO vo) {
		System.out.println("DAO insertBookMark 호출");
		sqlSession.insert(NAMESPACE + ".insertBookMark", vo);
	}
	
	@Override
	public int bookMarkTotalCount(String member_id) {
		System.out.println("DAO bookMarkTotalCount 호출");
		return sqlSession.selectOne(NAMESPACE+".bookMarkTotalCount", member_id);
	}

	@Override
	public List<BookMarkVO> getBookMarkListPaging(Criteria cri, String member_id) { 
		System.out.println("DAO getListWithPaging 호출");

		int startRow = (cri.getPageNum() - 1) * cri.getAmount() + 1;
	    int endRow = cri.getPageNum() * cri.getAmount();

	    Map<String, Object> params = new HashMap<>();
	    params.put("startRow", startRow);
	    params.put("endRow", endRow);
	    params.put("member_id", member_id);
	    
	    return sqlSession.selectList(NAMESPACE + ".getBookMarkListPaging", params);
	}
	
	@Override
	public boolean isBookMarked(String member_id, String isbn13) {
		System.out.println("DAO isBookMarked 호출");
		Map<String, Object> params = new HashMap<>();
        params.put("member_id", member_id);
        params.put("isbn13", isbn13);
		int count = sqlSession.selectOne(NAMESPACE + ".isBookMarked", params);
        return count > 0;	//count가 0보다 크면 true, 그렇지 않으면 false
	}
	
	//////////////////////////////////////////
	
	@Override
	public void insertReview(ReviewVO vo) {
		System.out.println("DAO insertReview 호출");
		sqlSession.insert(NAMESPACE + ".insertReview", vo);
	}
	
	@Override
	public int reviewTotalCount(String member_id) {
		System.out.println("DAO reviewTotalCount 호출");
		return sqlSession.selectOne(NAMESPACE+".reviewTotalCount", member_id);
	}
	
	@Override
	public List<ReviewVO> getReviewListPaging(Criteria cri, String member_id) { 
		System.out.println("DAO getReviewListPaging 호출");
		Map<String, Object> params = new HashMap<>();
		params.put("pageNum", cri.getPageNum());
		params.put("amount", cri.getAmount());
		params.put("member_id", member_id);
		
		return sqlSession.selectList(NAMESPACE + ".getReviewListPaging", params);
	}

	@Override
	public void deleteReview(int review_num) {
		System.out.println("DAO deleteReview 호출");
		sqlSession.delete(NAMESPACE + ".deleteReview", review_num);
	}
	
	@Override
	public void updateReview(ReviewVO vo) {
		System.out.println("DAO updateReview 호출");
		sqlSession.update(NAMESPACE + ".updateReview", vo);
	}
	
	//////////////////////////////////////
	
	@Override
	public MemberVO getMemberInfo(String id) {
		System.out.println("DAO getMemberInfo 호출");
		return sqlSession.selectOne(NAMESPACE + ".getMemberInfo", id);
	}
	
	@Override
    public int nameCheck(String name) {
    	System.out.println("DAO.nameCheck 지나가기 : "+name);
    	return sqlSession.selectOne(NAMESPACE + ".nameCheck", name);
    }
	
	@Override
	public void memberUpdate(MemberVO member) {
		System.out.println("DAO.memberUpdate 지나가기 : "+member);
		sqlSession.update(NAMESPACE + ".memberUpdate", member);
	}
}
