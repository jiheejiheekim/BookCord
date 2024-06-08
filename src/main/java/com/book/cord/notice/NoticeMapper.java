package com.book.cord.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {

	public int totalCount();
	
    public List<NoticeVO> getListWithPaging(Criteria cri);
    
    public void insertNotice(NoticeVO notice);
    
    public NoticeVO getNoticeDetail(int notice_num);
    
    public int deleteNotice(int notice_num);
    
    public int updateNotice(NoticeVO notice);
}
