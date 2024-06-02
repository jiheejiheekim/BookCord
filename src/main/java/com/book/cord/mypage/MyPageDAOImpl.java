package com.book.cord.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("myPageDAOImpl")
public class MyPageDAOImpl implements MyPageDAO {
	
	private final String NAMESPACE = "com.book.cord.mypage.MyPageMapper";

	@Autowired
    private MyPageMapper myPageMapper;
	
	@Autowired
    private SqlSession sqlSession;
	/*
	@Override
	public void insertBookMark(String member_id, String title, String author, String isbn13, String cover) {
		System.out.println("DAO.insertBookMark 지나가기");
		BookMarkVO bookmark = new BookMarkVO();
        bookmark.setMember_id(member_id);
        bookmark.setTitle(title);
        bookmark.setAuthor(author);
        bookmark.setIsbn13(isbn13);
        bookmark.setCover(cover);
        
        sqlSession.insert(NAMESPACE + ".insertBookMark", bookmark);
	}
	*/
	@Override
    public void insertBookMark(BookMarkVO bookmarkRequest) {

       sqlSession.insert(NAMESPACE + ".insertBookMark", bookmarkRequest);

    }
	
}
