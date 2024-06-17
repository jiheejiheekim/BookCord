package com.book.cord.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.book.cord.login.MemberMapper;
import com.book.cord.login.MemberVO;

@Repository("boardDAOImpl")
@Primary
public class BoardDAOImpl implements BoardDAO {
	
	private final String NAMESPACE = "com.book.cord.board.BoardMapper";
    
    @Autowired
    private MemberMapper memberMapper;

    @Autowired	
    private SqlSession sqlSession;
    
	@Override
	public List<NoticeVO> getListWithPaging(Criteria cri) { 
		System.out.println("DAO getListWithPaging 호출");
		return sqlSession.selectList(NAMESPACE+".getListWithPaging", cri);
	}
	
	@Override
	public int totalCount(){
		System.out.println("DAO count 호출");
		return sqlSession.selectOne(NAMESPACE+".totalCount");
	}
	
	@Override
	public void insertNotice(NoticeVO notice) {
		System.out.println("DAO write 호출 " + notice);
		sqlSession.insert(NAMESPACE+".insertNotice", notice);
	}
	
	@Override
	public NoticeVO getNoticeDetail(int notice_num) {
		System.out.println("DAO getNoticeDetail 호출 " + notice_num);
		return sqlSession.selectOne(NAMESPACE+".getNoticeDetail", notice_num);
	}
	
	@Override
	public int deleteNotice(int notice_num) {
		System.out.println("DAO deleteNotice 호출 " + notice_num);
		return sqlSession.delete(NAMESPACE+".deleteNotice", notice_num);
	}
	
	@Override
	public int updateNotice(NoticeVO notice) {
		System.out.println("DAO updateNotice 호출 " + notice);
		return sqlSession.update(NAMESPACE+".updateNotice", notice);
	}
	
	@Override
	public int updateHit(int notice_num) {
		System.out.println("DAO updateNotice 호출 " + notice_num);
		return sqlSession.update(NAMESPACE+".updateHit", notice_num);
	}
	
	@Override
	public List<NoticeVO> getSearchNoticePaging(String select, String search, Criteria cri) {
		System.out.println("DAO getSearchNoticePaging 호출");
		Map<String, Object> params = new HashMap<>();
	    params.put("select", select);
	    params.put("search", search);
	    params.put("pageNum", cri.getPageNum());
	    params.put("amount", cri.getAmount());
	    
	    int startRow = (cri.getPageNum() - 1) * cri.getAmount() + 1;
	    int endRow = cri.getPageNum() * cri.getAmount();

	    params.put("startRow", startRow);
	    params.put("endRow", endRow);
	    
		return sqlSession.selectList(NAMESPACE+".getSearchNoticePaging", params);
	}
	
	@Override
	public int searchCount(String select, String search) {
		System.out.println("DAO searchCount 호출");
		Map<String, Object> params = new HashMap<>();
	    params.put("select", select);
	    params.put("search", search);
		return sqlSession.selectOne(NAMESPACE+".searchCount", params);
	}
	
	////////////////////////////////////////////
	public List<FreeBoardVO> getFreeBoardListPaging(Criteria cri) {
		System.out.println("DAO getFreeBoardListPaging 호출");
		return sqlSession.selectList(NAMESPACE+".getFreeBoardListPaging", cri);
	}

	public int totalFreeBoardCount() {
		System.out.println("DAO totalFreeBoardCount 호출");
		return sqlSession.selectOne(NAMESPACE+".totalFreeBoardCount");
	}
	
	public MemberVO getMemberName(String member_id) {
		System.out.println("DAO getMemberName 호출");
		return sqlSession.selectOne(NAMESPACE+".getMemberName", member_id);
	}
	
	public void insertFreeBoard(FreeBoardVO freeBoard) {
		System.out.println("DAO insertFreeBoard 호출");
		sqlSession.insert(NAMESPACE+".insertFreeBoard", freeBoard);
	}
	
	public FreeBoardVO getFreeBoardDetail(int freeBoard_num) {
		System.out.println("DAO getNoticeDetail 호출 " + freeBoard_num);
		return sqlSession.selectOne(NAMESPACE+".getFreeBoardDetail", freeBoard_num);
	}
	
	public int upFreeBoardHit(int freeBoard_num) {
		System.out.println("DAO upFreeBoardHit 호출 " + freeBoard_num);
		return sqlSession.update(NAMESPACE+".upFreeBoardHit", freeBoard_num);
	}
}
