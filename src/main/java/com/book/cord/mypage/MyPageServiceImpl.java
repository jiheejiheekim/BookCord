package com.book.cord.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.book.cord.login.CustomUserDetails;
import com.book.cord.notice.Criteria;

@Service("myPageServiceImpl")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	@Qualifier("myPageDAOImpl")
	MyPageDAO myPageDAO;
	
	@Autowired
    HttpServletRequest request;
			
	@Override
	public void addBookMark(BookMarkVO vo) {
		myPageDAO.insertBookMark(vo);
	}
	
	@Override
	public int count(String member_id) {
		System.out.println("Service count 호출");
		return myPageDAO.totalCount(member_id);
	}
	
	@Override
	public List<BookMarkVO> getList(Criteria cri, String member_id){
		System.out.println("Service getList 호출");
		
        return myPageDAO.getListWithPaging(cri, member_id);
    }
	
}
