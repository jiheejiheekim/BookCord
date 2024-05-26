package com.book.cord.notice;

import java.util.List;

public interface NoticeDAO {
	
	public List<NoticeVO> list() throws Exception;
	
	public int count() throws Exception;
	
	public List<NoticeVO> getList(Criteria cri);

}
