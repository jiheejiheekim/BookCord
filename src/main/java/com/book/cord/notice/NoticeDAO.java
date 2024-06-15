package com.book.cord.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface NoticeDAO {
	
	//public List<NoticeVO> list() throws Exception;
	
	public int totalCount();
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public void insertNotice(NoticeVO notice);
	
	public NoticeVO getNoticeDetail(int notice_num);
	
	public int deleteNotice(int notice_num);
	
	public int updateNotice(NoticeVO notice);
	
	public int updateHit(int notice_num);
	
	public List<NoticeVO> getSearchNoticePaging(String select, String search, Criteria cri);
	
	public int searchCount(String select, String search);

}
