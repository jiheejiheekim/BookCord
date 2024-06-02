package com.book.cord.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("myPageServiceImpl")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	@Qualifier("myPageDAOImpl")
	MyPageDAO myPageDAO;
	
	@Autowired
    HttpServletRequest request1; // HttpServletRequest 객체 주입
	
	
	@Override
	public void addBookMark(BookMarkVO request) {
        //myPageDAO.insertBookMark(bookmarkRequest);
        
		// 세션에서 member_id 가져오기
		HttpSession session = request1.getSession(); // 세션 객체 가져오기
		String member_id = (String) session.getAttribute("member_id"); // 세션에서 member_id 가져오기
		
		
        try {
            // 북마크 추가
        	BookMarkVO bookmark = new BookMarkVO();
        	bookmark.setMember_id(member_id); // 세션에서 가져온 member_id 설정
            bookmark.setIsbn13(request.getIsbn13());
            bookmark.setTitle(request.getTitle());
            bookmark.setAuthor(request.getAuthor());
            bookmark.setCover(request.getCover());
            myPageDAO.insertBookMark(bookmark);
            // 북마크 추가 성공
            System.out.println("북마크 추가 성공");
        } catch (Exception e) {
            // 북마크 추가 실패
            System.err.println("북마크 추가 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }
	
}
