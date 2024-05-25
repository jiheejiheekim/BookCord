package com.book.cord.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;
	
	@Override
	public List<NoticeVO> list() throws Exception {
		System.out.println("Service 호출");
		return dao.list();
	}
	
	@Override
	public int count() throws Exception {
		System.out.println("Service 호출");
		return dao.count();
	}

}
