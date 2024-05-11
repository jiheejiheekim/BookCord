package com.book.cord;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.DetailBooks;
import com.book.cord.BookVO.GenresBestSeller;
import com.book.cord.BookVO.NewBooks;
import com.book.cord.BookVO.SearchBooks;

public interface BookService {
	
    NewBooks getNewBooks();			//신간도서
    BestSeller getMainBestSeller();	//메인 - 베스트셀러
    BestSeller getBestSeller(int year, int month);		//베스트셀러
    SearchBooks getSearchBooks(String query);	//상품검색
    DetailBooks getDetailBook(String isbn13);	//도서상세페이지
    
    GenresBestSeller getGenresBestSeller_1(Integer genreId, Integer pageNumber);
    
}