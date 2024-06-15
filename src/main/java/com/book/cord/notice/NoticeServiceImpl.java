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
	
	@Override
	public int upNotice(NoticeVO notice) {
		try {
			log.debug("Service: {}~~ ~~", notice);
			System.out.println("Service upNotice 호출");
			int result = dao.updateNotice(notice);
			// 공지사항 수정
			System.out.println("서비스 =========> 수정 결과: " + result);
			return result;
		} catch (Exception e) {
			System.out.println("예외발생 ==> Exception in upNotice()"+e);
			return 0;
		}
	}
	
	@Override
	public int upHit(int notice_num) {
		System.out.println("Service delNotice 호출");
		return dao.updateHit(notice_num);
	}
	
	@Override
	public List<NoticeVO> searchNotice(String select, String search, Criteria cri){
		System.out.println("Service searchNotice 호출");
		return dao.getSearchNoticePaging(select, search, cri);
	}
	
	@Override
	public int searchCount(String select, String search) {
		System.out.println("Service searchCount 호출");
		return dao.searchCount(select, search);
	}

}
