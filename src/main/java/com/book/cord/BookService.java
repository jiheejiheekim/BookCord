package com.book.cord;

import java.util.List;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.DetailBooks;
import com.book.cord.BookVO.GenresBestSeller;
import com.book.cord.BookVO.GenresNewBooks;
import com.book.cord.BookVO.NewBooks;
import com.book.cord.BookVO.SearchBooks;
import com.book.cord.board.Criteria;
import com.book.cord.mypage.ReviewVO;

public interface BookService {
	
    NewBooks getNewBooks();			//신간도서
    BestSeller getMainBestSeller();	//메인 - 베스트셀러
    BestSeller getBestSeller(int year, int month);		//베스트셀러
    SearchBooks getSearchBooks(String query);	//상품검색
    SearchBooks getSearchBooks2(String query, Integer pageNumber);
    DetailBooks getDetailBook(String isbn13);	//도서상세페이지
    
    GenresBestSeller getGenresBestSeller(Integer genreId, Integer pageNumber);	//bestSeller.jsp
    GenresNewBooks getGenresNewBooks(Integer genreId, Integer pageNumber);	//newBooks.jsp
    
    public List<ReviewVO> getDetailReviewList(Criteria cri, String isbn13);
    public int detailReviewTotal(String isbn13);
    
}