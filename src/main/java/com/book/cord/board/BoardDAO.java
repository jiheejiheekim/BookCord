package com.book.cord.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.book.cord.login.MemberVO;

public interface BoardDAO {
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public int totalCount();
	
	public void insertNotice(NoticeVO notice);
	
	public NoticeVO getNoticeDetail(int notice_num);
	
	public int deleteNotice(int notice_num);
	
	public int updateNotice(NoticeVO notice);
	
	public int updateHit(int notice_num);
	
	public List<NoticeVO> getSearchNoticePaging(String select, String search, Criteria cri);
	
	public int searchCount(String select, String search);
	
	//////////////////////////////////////////////
	public List<FreeBoardVO> getFreeBoardListPaging(Criteria cri);
	
	public int totalFreeBoardCount();

	public MemberVO getMemberName(String member_id);
	
	public void insertFreeBoard(FreeBoardVO freeBoard);
	
	public FreeBoardVO getFreeBoardDetail(int freeBoard_num);
	
	public int upFreeBoardHit(int freeBoard_num);

}
