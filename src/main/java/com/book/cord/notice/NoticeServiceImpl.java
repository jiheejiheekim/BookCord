package com.book.cord.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	@Qualifier("noticeDAO") 
	private NoticeDAO dao;
	/*
	@Override
	public List<NoticeVO> list() throws Exception {
		System.out.println("Service 호출");
		return dao.list();
	}
	*/
	@Override
	public int count() {
		System.out.println("Service count 호출");
		return dao.totalCount();
	}
	
	@Override
	public List<NoticeVO> getList(Criteria cri) {
		System.out.println("Service getList 호출");
		return dao.getListWithPaging(cri);
	}
	
	@Override
	public void write(NoticeVO notice) {
		try {
		    log.debug("Service: {}~~ ~~", notice);
		    System.out.println("Service write 호출");
		    dao.insertNotice(notice);
		    
		 } catch (Exception e) {
			 log.error("Exception in registerMember", e);
		 }
	}

}
