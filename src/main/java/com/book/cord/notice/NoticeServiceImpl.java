package com.book.cord.notice;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	@Qualifier("noticeDAO")
	private NoticeDAO dao;


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

			// 공지사항 등록
			dao.insertNotice(notice);
		} catch (Exception e) {
			log.error("예외발생 ==> Exception in write()", e);
		}
	}

	@Override
	public NoticeVO getNotice(int notice_num) {
		System.out.println("Service getNotice 호출");
		return dao.getNoticeDetail(notice_num);
	}

	@Override
	public int delNotice(int notice_num) {
		System.out.println("Service delNotice 호출");
		return dao.deleteNotice(notice_num);
	}

}
