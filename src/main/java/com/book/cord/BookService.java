package com.book.cord;

import org.springframework.stereotype.Service;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.NewBooks;
import com.book.cord.BookVO.SearchBooks;

public interface BookService {
	
    NewBooks getNewBooks();			//신간도서
    BestSeller getBestSeller();		//베스트셀러
    SearchBooks getSearchBooks(String query);	//상품검색
    
}