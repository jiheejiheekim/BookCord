package com.book.cord.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.book.cord.login.MemberMapper;

@Repository
@Primary
public class NoticeDAOImpl implements NoticeDAO {
	
	private final String NAMESPACE = "com.book.cord.notice.NoticeMapper";
    
    @Autowired
    private MemberMapper memberMapper;

    @Autowired	
    private SqlSession sqlSession;
    
	@Override
	public List<NoticeVO> list() throws Exception {
		System.out.println("DAO 호출");
		return sqlSession.selectList(NAMESPACE+".listNotice");
	}
	
	@Override
	public int count() throws Exception {
		System.out.println("DAO 호출");
		return sqlSession.selectOne(NAMESPACE+".totalCount");
	}
	
	public List<NoticeVO> getList(Criteria cri) { 
		System.out.println("DAO 호출");
		return sqlSession.selectList(NAMESPACE+".getListWithPaging", cri);
}

}
