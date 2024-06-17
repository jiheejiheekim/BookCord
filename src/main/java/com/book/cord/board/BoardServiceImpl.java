package com.book.cord.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.book.cord.login.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService {

	@Autowired
	@Qualifier("boardDAOImpl")
	private BoardDAO dao;


	@Override
	public List<NoticeVO> getList(Criteria cri) {
		System.out.println("Service getList 호출");
		return dao.getListWithPaging(cri);
	}
	
	@Override
	public int count() {
		System.out.println("Service count 호출");
		return dao.totalCount();
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

	////////////////////////////////////////////
	public List<FreeBoardVO> getFreeBoardList(Criteria cri) {
		System.out.println("Service getFreeBoardList 호출");
		return dao.getFreeBoardListPaging(cri);
	}
	
	public int totalFreeBoardCount() {
		System.out.println("Service totalFreeBoardCount 호출");
		return dao.totalFreeBoardCount();
	}
	
	public MemberVO getMemberName(String member_id) {
		System.out.println("Service getMemberName 호출");
		return dao.getMemberName(member_id);
	}
	
	public void writeFreeBoard(FreeBoardVO freeBoard) {
		System.out.println("Service writeFreeBoard 호출");
		dao.insertFreeBoard(freeBoard);
	}
	
	public FreeBoardVO getFreeBoard(int freeBoard_num) {
		System.out.println("Service getFreeBoard 호출");
		return dao.getFreeBoardDetail(freeBoard_num);
	}
	
	@Override
	public int upFreeBoardHit(int freeBoard_num) {
		System.out.println("Service upFreeBoardHit 호출");
		return dao.upFreeBoardHit(freeBoard_num);
	}
}
