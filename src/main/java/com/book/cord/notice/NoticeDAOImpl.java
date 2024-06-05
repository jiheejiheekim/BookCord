package com.book.cord.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.book.cord.login.MemberMapper;

@Repository("noticeDAO")
@Primary
public class NoticeDAOImpl implements NoticeDAO {
	
	private final String NAMESPACE = "com.book.cord.notice.NoticeMapper";
    
    @Autowired
    private MemberMapper memberMapper;

    @Autowired	
    private SqlSession sqlSession;
    
	@Override
	public int totalCount(){
		System.out.println("DAO count 호출");
		return sqlSession.selectOne(NAMESPACE+".totalCount");
	}
	
	@Override
	public List<NoticeVO> getListWithPaging(Criteria cri) { 
		System.out.println("DAO getList 호출");
		return sqlSession.selectList(NAMESPACE+".getListWithPaging", cri);
	}
	
	@Override
	public void insertNotice(NoticeVO notice) {
		System.out.println("DAO write 호출" + notice);
		sqlSession.insert(NAMESPACE+".insertNotice", notice);
	}
	
	@Override
	public NoticeVO getNoticeDetail(int notice_num) {
		System.out.println("DAO write 호출" + notice_num);
		return sqlSession.selectOne(NAMESPACE+".getNoticeDetail", notice_num);
	}

}
