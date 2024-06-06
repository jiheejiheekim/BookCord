package com.book.cord.notice;

import java.util.List;

public interface NoticeService {
	
	//public List<NoticeVO> list();

    public int count();
    
    //책 추가
    public List<NoticeVO> getList(Criteria cri);
    
    public void write(NoticeVO notice);
    
    public NoticeVO getNotice(int notice_num);
    
    //public int delNotice(String notice_num);
    public int delNotice(int notice_num);
}
