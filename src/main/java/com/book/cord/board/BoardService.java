package com.book.cord.board;

import java.util.List;

import com.book.cord.login.MemberVO;

public interface BoardService {
	
	/////////////////////////////공지사항 게시판
	//공지사항 리스트
	public List<NoticeVO> getList(Criteria cri);
	
	//글 개수
    public int count();
    
    //글 작성
    public void write(NoticeVO notice);
    
    //글 내용
    public NoticeVO getNotice(int notice_num);
    
    //글 삭제
    public int delNotice(int notice_num);
    
    //글 수정
    public int upNotice(NoticeVO notice);
    
    //글 조회수 증가
    public int upHit(int notice_num);
    
    //글 검색
    public List<NoticeVO> searchNotice(String select, String search, Criteria cri);
    
    //글 검색 결과 개수
    public int searchNoticeCount(String select, String search);
    
    /////////////////////////////자유 게시판
    //자유게시판 리스트
    public List<FreeBoardVO> getFreeBoardList(Criteria cri);
    
    //글 개수
    public int totalFreeBoardCount();
    
    //세션에 저장된 아이디 값의 닉네임 얻어오기
    public MemberVO getMemberName(String member_id);
    
    //글 작성
    public void writeFreeBoard(FreeBoardVO freeBoard);
    
    //글 내용
    public FreeBoardVO getFreeBoard(int freeBoard_num);
    
    //글 조회수 증가
    public int upFreeBoardHit(int freeBoard_num);
    
    //글 삭제
    public int delFreeBoard(int freeBoard_num);
    
    //글 수정
    public int upFreeBoard(FreeBoardVO freeBoard);
    
    //글 검색
    public List<FreeBoardVO> searchFreeBoard(String select, String search, Criteria cri);
    
    //글 검색 결과 개수
    public int searchFreeBoardCount(String select, String search);
        
}
