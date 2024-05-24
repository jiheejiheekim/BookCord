package com.book.cord.notice;

import java.util.List;

public interface NoticeService {
	
	public List<NoticeVO> list() throws Exception;

    public int count() throws Exception;
    

}
