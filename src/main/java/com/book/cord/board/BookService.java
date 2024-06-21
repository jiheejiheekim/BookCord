package com.book.cord.board;

import java.util.List;

import com.book.cord.board.BookVO.BestSeller;
import com.book.cord.board.BookVO.DetailBooks;
import com.book.cord.board.BookVO.GenresBestSeller;
import com.book.cord.board.BookVO.GenresNewBooks;
import com.book.cord.board.BookVO.NewBooks;
import com.book.cord.board.BookVO.SearchBooks;
import com.book.cord.mypage.ReviewVO;

public interface BookService {
	
    NewBooks getMainNewBooks();		//메인 - 신간도서
    BestSeller getMainBestSeller();	//메인 - 베스트셀러
    //BestSeller getBestSeller(int year, int month);		//베스트셀러
    //SearchBooks getSearchBooks(String query);	//상품검색
    SearchBooks getSearchBooks(String query, Integer pageNumber);
    DetailBooks getDetailBook(String isbn13);	//도서상세페이지
    
    GenresBestSeller getGenresBestSeller(Integer genreId, Integer pageNumber);	//bestSeller.jsp
    GenresNewBooks getGenresNewBooks(Integer genreId, Integer pageNumber);	//newBooks.jsp
    
    public List<ReviewVO> getDetailReviewList(Criteria cri, String isbn13);
    public int detailReviewTotal(String isbn13);
    
}