package com.book.cord.notice;

import java.util.List;

public interface NoticeDAO {
	
	//public List<NoticeVO> list() throws Exception;
	
	public int totalCount();
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public void insertNotice(NoticeVO notice);
	
	public NoticeVO getNoticeDetail(int notice_num);
	
	public int deleteNotice(int notice_num);

}
