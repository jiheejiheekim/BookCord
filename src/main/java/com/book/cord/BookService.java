package com.book.cord;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.DetailBooks;
import com.book.cord.BookVO.NewBooks;
import com.book.cord.BookVO.SearchBooks;

public interface BookService {
	
    NewBooks getNewBooks();			//신간도서
    BestSeller getBestSeller();		//베스트셀러
    SearchBooks getSearchBooks(String query);	//상품검색
    DetailBooks getDetailBook(String isbn13);	//도서상세페이지
    
}