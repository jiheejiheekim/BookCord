package com.book.cord.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	    Map<String, Object> params = new HashMap<>();
	    params.put("pageNum", cri.getPageNum());
	    params.put("amount", cri.getAmount());
	    params.put("member_id", member_id);

	    return sqlSession.selectList(NAMESPACE + ".getBookMarkListPaging", params);
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
	public List<BookMarkVO> getReviewListPaging(Criteria cri, String member_id) { 
		System.out.println("DAO getReviewListPaging 호출");
		Map<String, Object> params = new HashMap<>();
		params.put("pageNum", cri.getPageNum());
		params.put("amount", cri.getAmount());
		params.put("member_id", member_id);
		
		return sqlSession.selectList(NAMESPACE + ".getReviewListPaging", params);
	}
	
	
	
}
