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
		sqlSession.insert(NAMESPACE + ".insertBookMark", vo);
	}
	
	@Override
	public int totalCount(String member_id) {
		System.out.println("DAO count 호출");
		return sqlSession.selectOne(NAMESPACE+".totalCount", member_id);
	}

	@Override
	public List<BookMarkVO> getListWithPaging(Criteria cri, String member_id) { 
		System.out.println("DAO getListWithPaging 호출");
	    Map<String, Object> params = new HashMap<>();
	    params.put("pageNum", cri.getPageNum());
	    params.put("amount", cri.getAmount());
	    params.put("member_id", member_id);

	    return sqlSession.selectList(NAMESPACE + ".getListWithPaging", params);
	}
	
}
