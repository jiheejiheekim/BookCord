package com.book.cord.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface NoticeService {
	
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
    public int searchCount(String select, String search);
    
    /////////////////////////////자유 게시판
    //자유게시판 리스트
    public List<NoticeVO> getFreeBoardList(Criteria cri);
    
    //글 개수
    public int totalFreeBoardCount();
        
}
