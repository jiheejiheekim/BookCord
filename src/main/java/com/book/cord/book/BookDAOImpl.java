package com.book.cord.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.cord.mypage.ReviewVO;
import com.book.cord.notice.Criteria;

@Repository("bookDAOImpl")
public class BookDAOImpl implements BookDAO {

	private final String NAMESPACE = "com.book.cord.book.BookMapper";

	@Autowired
	private BookMapper bookMapper;

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReviewVO> getDetailReviewList(Criteria cri, String isbn13) {
		System.out.println("DAO getDetailReviewList 호출");
			    
	    Map<String, Object> params = new HashMap<>();
	    params.put("pageNum", cri.getPageNum());
		params.put("amount", cri.getAmount());
		params.put("isbn13", isbn13);
		
		return sqlSession.selectList(NAMESPACE + ".getDetailReviewList", params);
		//return sqlSession.selectList(NAMESPACE + ".getDetailReviewList", isbn13);
	}
	
	@Override
    public int detailReviewTotal(String isbn13) {
    	System.out.println("DAO detailReviewTotal 호출");
    	return sqlSession.selectOne(NAMESPACE + ".detailReviewTotal", isbn13);
    }

}
