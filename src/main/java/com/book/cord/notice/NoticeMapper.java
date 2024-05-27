package com.book.cord.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
    //public List<NoticeVO> listNotice();
    public int totalCount();
    public List<NoticeVO> getListWithPaging(Criteria cri);
    
    public void insertNotice(NoticeVO notice);
}
