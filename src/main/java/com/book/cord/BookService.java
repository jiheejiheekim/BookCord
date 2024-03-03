package com.book.cord;

import com.book.cord.BookVO.BestSeller;
import com.book.cord.BookVO.NewBooks;

public interface BookService {
	
    NewBooks getNewBooks();
    BestSeller getBestSeller();
    
}